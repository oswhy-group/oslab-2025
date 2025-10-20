# 扩展练习Challenge：buddy system（伙伴系统）分配算法（需要编程）
## 实验要求：Buddy System算法把系统中的可用存储空间划分为存储块(Block)来进行管理, 每个存储块的大小必须是2的n次幂(Pow(2, n)), 即1, 2, 4, 8, 16, 32, 64, 128...

- 参考伙伴分配器的一个极简实现， 在ucore中实现buddy system分配算法，要求有比较充分的测试用例说明实现的正确性，需要有设计文档。

## 设计思想：
-   分配内存：将存储空间分为多个大小相等的空闲链表，每个存储块的初始大小为2的幂次方。当请求分配一个存储块时，从最大的可用存储块开始查找，直到找到足够大的存储块为止。如果找到了合适的存储块，就分配给应用程序，并将其从空闲链表中移除。如果找不到合适的存储块，就尝试将两个相邻的较小存储块合并为一个较大的存储块，然后再次查找分配。
-   释放内存：当应用程序释放一个存储块时，将其添加到相应的空闲链表中。如果该存储块的相邻伙伴（即大小相同的另一个存储块）也是空闲的，就将它们合并为一个更大的存储块，并将其放入更大的空闲链表。
-   该算法的核心思想是利用空闲存储块的相邻关系，通过合并和拆分操作来高效地管理内存。优点在于其优点是快速搜索合并（O(logN)时间复杂度）以及低外部碎片（最佳适配best-fit）；其缺点是内部碎片，因为按2的幂划分块，如果碰上66单位大小，那么必须划分128单位大小的块。

## 开发文档:
- 不同于best-fit，buddy system在分配时，每个空闲块的大小必须是2的幂次方，所以我们需要重新设计一个新的数据结构，用以记录对应的块。
```c 
// 伙伴分配器数据结构
// size：管理的内存总单元数（必须是2的幂）
// longest：动态扩展数组，存储每个节点对应的最大空闲块大小
typedef struct buddy2 {
    unsigned size;
    unsigned longest[1]; // 占位符，实际初始化时扩展为2*size大小
} buddy2_t;
```

### 分配设计
```c
static struct Page* buddy2_alloc_pages(size_t n) {
    if (n == 0 || buddy == NULL) {
        return NULL;
    }
    
    // 将请求大小对齐到2的幂
    unsigned size;
    if (n > buddy->size) {
        return NULL;
    }
    
    size = 1;
    while (size < n) {
        size <<= 1;
    }
    
    // 搜索合适的节点
    unsigned index = 0;
    if (buddy->longest[index] < size) {
        cprintf("buddy2_alloc_pages: no block of size %u available, largest is %u\n", 
                size, buddy->longest[index]);
        return NULL;
    }
    
    // 深度优先搜索
    unsigned node_size = buddy->size;
    for (; node_size != size; node_size /= 2) {
        unsigned left = LEFT_LEAF(index);
        unsigned right = RIGHT_LEAF(index);
        
        if (buddy->longest[left] >= size) {
            index = left;
        } else {
            index = right;
        }
    }
    
    // 标记为已使用
    buddy->longest[index] = 0;
    
    // 计算偏移量
    unsigned offset = (index + 1) * node_size - buddy->size;
    
    // 更新祖先节点
    while (index) {
        index = PARENT(index);
        unsigned left = LEFT_LEAF(index);
        unsigned right = RIGHT_LEAF(index);
        
        buddy->longest[index] = MAX(buddy->longest[left], buddy->longest[right]);
    }
    
    // 计算对应的Page结构
    struct Page* base_page = (struct Page*)buddy;
    unsigned metadata_pages = (sizeof(buddy2_t) + sizeof(unsigned) * (buddy2_nodes(buddy->size) - 1) + PGSIZE - 1) / PGSIZE;
    struct Page* page = base_page + metadata_pages + offset;
    
    // 设置页属性
    for (struct Page* p = page; p < page + size; p++) {
        ClearPageProperty(p);
        set_page_ref(p, 0);
    }
    
    cprintf("buddy2 alloc: %u pages at offset %u\n", size, offset);
    return page;
}
```
通过深度优先搜索策略寻找合适的内存块,当请求分配内存时，算法首先将请求大小向上对齐到最接近的2的幂，然后从根节点开始遍历二叉树，选择能够满足需求的最小可用块；如果找到的块大于所需大小，则递归地进行分割，直到获得精确匹配的块，同时更新所有祖先节点的最大空闲块信息，确保高效利用内存并减少外部碎片。

### 释放函数
```c
// 释放页块
static void buddy2_free_pages(struct Page* base, size_t n) {
    if (base == NULL || buddy == NULL || n == 0) {
        return;
    }
    
    // 计算释放的大小（2的幂）
    unsigned size = 1;
    while (size < n) {
        size <<= 1;
    }
    
    // 计算页偏移量
    struct Page* base_page = (struct Page*)buddy;
    unsigned metadata_pages = (sizeof(buddy2_t) + sizeof(unsigned) * (buddy2_nodes(buddy->size) - 1) + PGSIZE - 1) / PGSIZE;
    unsigned offset = base - base_page - metadata_pages;
    
    // 寻找对应的节点
    unsigned index = offset + buddy->size - 1;
    unsigned node_size = 1;
    
    // 向上搜索到实际分配大小的节点
    for (; buddy->longest[index] != 0; index = PARENT(index)) {
        node_size *= 2;
        if (index == 0) {
            panic("buddy2_free_pages: double free detected\n");
        }
    }
    
    // 恢复内存卡大小
    buddy->longest[index] = node_size;
    
    // 合并伙伴块
    while (index > 0) {
        index = PARENT(index);
        node_size *= 2;
        
        unsigned left = buddy->longest[LEFT_LEAF(index)];
        unsigned right = buddy->longest[RIGHT_LEAF(index)];
        
        if (left + right == node_size) {
            buddy->longest[index] = node_size;
        } else {
            buddy->longest[index] = MAX(left, right);
        }
    }
    
    // 设置页属性
    for (struct Page* p = base; p < base + size; p++) {
        SetPageProperty(p);
        set_page_ref(p, 0);
    }
    
    cprintf("buddy2 free: %u pages at offset %u\n", size, offset);
}
```
释放内存块时，我们首先根据释放地址计算出对应的二叉树节点并恢复其空闲状态，然后向上递归检查其伙伴块是否也处于空闲状态，如果相邻的伙伴块同样空闲则合并为更大的连续内存块，并继续向上尝试合并，直到无法合并或到达根节点为止，从而有效减少内存碎片并重建大的连续空闲空间。

## 测试用例
### 测试一：单页分配释放
```c
// 测试1：分配1页
    cprintf("\nTest 1: Allocate 1 page\n");
    struct Page* p0 = buddy2_alloc_pages(1);
    if (p0 == NULL) {
        panic("Failed to allocate 1 page\n");
    }
    cprintf("After allocating 1 page, free pages: %lu\n", buddy2_nr_free_pages());
    
    // 立即释放1页
    buddy2_free_pages(p0, 1);
    cprintf("After freeing 1 page, free pages: %lu\n", buddy2_nr_free_pages());
    
    // 验证恢复
    if (buddy2_nr_free_pages() != initial_free) {
        panic("Memory not recovered after single page test\n");
    }
```
测试结果：
Test 1: Allocate 1 page
buddy2 alloc: 1 pages at offset 0
After allocating 1 page, free pages: 8192
buddy2 free: 1 pages at offset 0
After freeing 1 page, free pages: 16384

### 测试二：不同大小分配
```c
// 测试2：分配不同大小的页块
    cprintf("\nTest 2: Allocate different sizes\n");
    struct Page *p1, *p2, *p3;
    
    p1 = buddy2_alloc_pages(1);
    if (p1 == NULL) panic("Failed to allocate 1 page");
    cprintf("Allocated 1 page, free: %lu\n", buddy2_nr_free_pages());
    
    p2 = buddy2_alloc_pages(2);
    if (p2 == NULL) panic("Failed to allocate 2 pages");
    cprintf("Allocated 2 pages, free: %lu\n", buddy2_nr_free_pages());
    
    p3 = buddy2_alloc_pages(4);
    if (p3 == NULL) panic("Failed to allocate 4 pages");
    cprintf("Allocated 4 pages, free: %lu\n", buddy2_nr_free_pages());
    
    // 按分配顺序的逆序释放
    buddy2_free_pages(p3, 4);
    cprintf("Freed 4 pages, free: %lu\n", buddy2_nr_free_pages());
    
    buddy2_free_pages(p2, 2);
    cprintf("Freed 2 pages, free: %lu\n", buddy2_nr_free_pages());
    
    buddy2_free_pages(p1, 1);
    cprintf("Freed 1 page, free: %lu\n", buddy2_nr_free_pages());
    
    // 最终验证
    if (buddy2_nr_free_pages() != initial_free) {
        panic("Memory leak detected! Initial: %lu, Final: %lu\n", 
              initial_free, buddy2_nr_free_pages());
    }
    
    cprintf("\nbuddy2 check passed!\n");
```
测试结果：
Test 2: Allocate different sizes
buddy2 alloc: 1 pages at offset 0
Allocated 1 page, free: 8192
buddy2 alloc: 2 pages at offset 2
Allocated 2 pages, free: 8192
buddy2 alloc: 4 pages at offset 4
Allocated 4 pages, free: 8192
buddy2 free: 4 pages at offset 4
Freed 4 pages, free: 8192
buddy2 free: 2 pages at offset 2
Freed 2 pages, free: 8192
buddy2 free: 1 pages at offset 0
Freed 1 page, free: 16384

经过简单测试后，均得到了正确的输出。
