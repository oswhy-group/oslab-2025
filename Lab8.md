# Lab 8 文件系统

杨竣羽 2313043

何潇 2310434

王豪杰 2312517

## 一、实验原理

### 1、文件系统

#### 1.1 概念：

**文件系统(`file system`)**，指的是操作系统中管理（硬盘上）持久存储数据的模块。

​	具体点来说，**文件系统**是指计算机保存和维护数据存储在“持久存储数据的设备”（如机械硬盘、固态硬盘、光盘等设备）上的什么位置，以及设备上哪些位置没有被占用。

#### 1.2 虚拟文件系统（VFS）：

##### 1.2.1 概念：

​	虚拟文件系统VFS是操作系统和更具体的文件系统之间的接口。也就是**更接近用户使用的接口。**

#### 1.3 UNIX文件系统

##### 1.3.1 通用文件模型：

​	是在UNIX文件系统的数据结构。是面向对象的，由若干对象(`Object`)组成，每个对象有成员属性和函数接口。通用文件模型中的对象：

- 超级块(superblock)：存储整个文件系统的相关信息（）。对于磁盘上的文件系统，对应磁盘里的**文件系统控制块(`filesystem control block`)**。超级块中的典型信息包括**分区的块的数量、块 的大小、空闲块的数量和指针、空闲的FCB数量和FCB指针**等。
- 索引节点(inode)：存储关于某个文件的元数据信息（如访问控制权限、大小、拥有者、创建时间、数据内容等等），通常对应磁盘上的**文件控制块（`file control block`)**. 每个索引节点有一个编号，唯一确定文件系统里的一个文件。
- 文件(file)：这里定义的`file object`不是指磁盘上的一个”文件“， 而是指一个进程和它打开的一个文件之间的**关系**，这个对象存储在内核态的内存中，仅当某个进程打开某个文件的时候才存在。
- 目录项(dentry)：维护从”目录里的某一项“到”对应的文件“的链接/指针。一个目录也是一个文件，包含若干个子目录和其他文件。从某个子目录、文件的名称，对应到具体的文件/子目录的地址(或者索引节点`inode`)的链接，通过**目录项(`dentry`)**来描述。

```
省流版：
SuperBlock (超级块)：全局视角，描述整个文件系统。
Inode (索引节点)：文件视角，描述文件的属性和物理位置。
Dentry (目录项)：路径视角，连接文件名和 Inode。
File (文件)：进程视角，记录打开文件的状态（如读写指针）。
```

​	大概可以参考下图：

![](D:\学习\大三上\操作系统\OSLAB-2025\YangJunyu\Lab8\8d415db8edd8687a73a298a2eb90239d.png)

​													图1

#### 1.4 ucore文件系统

##### 1.4.1 ucore文件架构设计：

ucore模仿了UNIX的文件系统设计，ucore的文件架构设计主要由四部分组成：

- **通用文件系统访问接口层：**面向用户。它是内核的大门。

  ​	它将用户进程发出的系统调用（如 `open`, `write`）转换成内核能理解的标准请求，传递给下一层。

- **文件系统抽象层-VFS：**面向内核其他部分。它是枢纽。

  ​	向上：提供统一接口，无论下面是 SFS 还是 FAT32，上层看到的接口都一样。

  ​	向下：定义了一套标准的函数指针列表。它根据文件类型，把请求转发给具体的 SFS 实现层。

- **`Simple FS` 文件系统层-SFS**：实现具体的文件系统逻辑。它是工人。

​		向上：接收VFS的抽象请求。

​		向下：解析 Inode，管理数据块（Block），将“写文件”的逻辑请求转化为“写磁盘块”的物理请求。

- **外设接口层：**面向硬件。它是驱动。

​		向上：接收 SFS 层的 Block 读写请求，并操作实际的驱动程序完成数据传输。

​		向下：屏蔽了硬件细节（无论是真实的 IDE 硬盘还是内存模拟的 Ramdisk）。

​	具体结构如下图所示：

![](D:\学习\大三上\操作系统\OSLAB-2025\YangJunyu\Lab8\fs1.png)

​												图2

也就是：

<img src="C:\Users\yangjy\AppData\Roaming\Typora\typora-user-images\image-20260102151102198.png" alt="image-20260102151102198" style="zoom:50%;" />

##### 1.4.2 文件系统的访问过程

​	举个例子理解：

​	以一个用户态程序执行 **`write` (写文件)** 为例，数据流向如下：

1. **用户请求 (User Space)**
   - 用户程序调用 `write(fd, buffer, len)`。
   - 触发系统调用，进入内核态。
2. **进入通用接口层**
   - 内核通过 `sys_write` 接收请求。
   - 内核通过进程的 `file` 结构体找到对应的文件句柄。
3. **穿过抽象层 (VFS)**
   - VFS 检查这是一个什么文件。
   - VFS 调用该文件对应的 `vop_write` (虚拟文件系统写操作)。
   - *关键点*：VFS 不关心怎么写，它只负责调用挂载在该文件上的函数指针。
4. **执行 SFS 逻辑 (Simple FS)**
   - 如果是 SFS 文件，`sfs_write` 被调用。
   - SFS 计算：你要写的数据对应文件的哪个偏移量？这个偏移量对应磁盘上的哪个 Block（块）？
   - 如果需要，SFS 会分配新的磁盘块。
   - SFS 发出“将数据写入某扇区/块”的指令。
5. **驱动执行 (外设接口)**
   - 调用磁盘驱动程序（如 `ide_write`）。
   - 驱动程序将内存中的数据写入到“硬盘”（在 Lab 8 中是写入到内存模拟的硬盘区域）。



##### 1.4.3 ucore文件系统总体结构：

​	从 `ucore` 操作系统不同的角度来看，`ucore` 中的文件系统架构包含四类主要的数据结构, 它们分别是：

- 超级块（`SuperBlock`），它主要从文件系统的全局角度描述特定文件系统的全局信息。它的作用范围是整个 `OS` 空间。
- 索引节点（`inode`）：它主要从文件系统的单个文件的角度它描述了文件的各种属性和数据所在位置。它的作用范围是整个 `OS` 空间。
- 目录项（`dentry`）：它主要从文件系统的文件路径的角度描述了文件路径中的一个特定的目录项（注：一系列目录项形成目录/文件路径）。它的作用范围是整个 `OS` 空间。对于 `SFS` 而言，`inode`(具体为 `struct sfs_disk_inode`)对应于物理磁盘上的具体对象，`dentry`（具体为 `struct sfs_disk_entry`）是一个内存实体，其中的 `ino` 成员指向对应的 `inode number`，另外一个成员是 `file name`(文件名).
- 文件（`file`），它主要从进程的角度描述了一个进程在访问文件时需要了解的文件标识，文件读写的位置，文件引用情况等信息。它的作用范围是某一具体进程。

根据ucore实验指导书上的图片总结（图片看不清就不插入了）：

```
第一层：进程范围 (Process Scope)
这一层描述了一个进程是如何管理它打开的文件的。
struct proc_struct: 代表一个进程。
struct fs_struct *fs_struct: 进程控制块中有一个指针指向文件系统结构，这里存储了进程的当前工作目录（pwd）等信息。
filemaps (文件映射表): 这是一个关键的数组（或列表）。
数组的索引通常对应我们常说的文件描述符 (fd)。
数组中的每一项存储了指向 struct file 的指针。
struct file: 代表一个“打开的文件”。它记录了当前进程对该文件的操作状态（比如读写指针到了哪里、访问权限是什么）。
关键连接: struct file 中有一个指针指向下一层的 struct inode。

第二层：系统范围 (System Scope)
这一层是操作系统内核维护的，用于统一管理所有被打开的文件。
struct inode (索引节点): 这是 VFS（虚拟文件系统）层的核心。
它代表了文件在内存中的存在形式。无论有多少个进程打开了同一个文件，内存中通常只有一个对应的 inode。
in_info: 这是一个泛型指针（void *），它指向具体文件系统的私有数据。在图中，它指向了下一层的 sfs_inode。
in_ops: 指向操作函数表（如 open, read, write），不同的文件系统（SFS, FAT等）会有不同的实现。

第三层：SFS 具体实现层 & 物理层 (SFS & Memory/Disk)
这一层展示了 SFS（Simple File System）具体是如何组织数据的，以及内存数据结构与磁盘数据结构的对应关系。
struct sfs_inode: 这是 SFS 文件系统在内存中特有的 inode 结构。它包含了 SFS 管理文件所需的具体信息。
struct sfs_disk_inode *din: 这是一个非常关键的指针，它直接对应磁盘上的数据结构。
它包含了文件的大小 (size)、类型 (type)、链接数 (nlinks)、块数 (blocks)。
数据索引:
direct (直接索引): 如图中黄线所示，直接指向磁盘上的数据块（SFS 层中的 direct[1], direct[2]）。
indirect (间接索引): 用于处理大文件，指向一个存储更多块号的索引块。
```



### 2、基本概念

#### 2.1 从磁盘到内存



##### 2.1.1 磁盘索引节点（sfs_disk_inode）--存储在硬盘上的数据结构

```c++
struct sfs_disk_inode {
    uint32_t size;                    // 文件大小：100KB
    uint16_t type;                    // 文件类型：普通文件
    uint16_t nlinks;                  // 硬链接数
    uint32_t blocks;                  // 占用了多少个块：25个
    uint32_t direct[12];              // 直接索引（后面详细讲）
    uint32_t indirect;                // 间接索引（后面详细讲）
};
```

**关键点：**

- 它**本身也占用硬盘的一个块**（4KB）
- 它的位置由它的**块号**决定，例如根目录的 disk_inode 在第 1 块
- **inode 编号 = 它所在的块号**（SFS 的偷懒设计）



##### 2.1.2 内存索引节点（sfs_inode）--内存中的工作副本

当你**打开一个文件**时，操作系统会：

1. 从硬盘读取 `sfs_disk_inode`
2. 在内存中创建一个 `sfs_inode`
3. 把磁盘数据复制过来，并添加一些管理信息

```c++
struct sfs_inode {
    struct sfs_disk_inode *din;   // 指向磁盘上的原始数据（可能是内存中的副本）
    uint32_t ino;                 // inode 编号（就是磁盘块号）
    bool dirty;                   // 脏标记：数据是否被修改过
    semaphore_t sem;              // 信号量：防止多个进程同时修改
    // ... 其他字段
};
```

**关键点：**

- **生命周期**：文件打开时创建，文件关闭时销毁
- 作用：
  - 缓存磁盘数据，避免频繁读硬盘
  - 记录"是否被修改"（dirty 标记）
  - 提供同步机制（信号量）
- 与磁盘 inode 的关系：
  - 内存 inode 是磁盘 inode 的**增强版工作副本**
  - 修改内存 inode 后，需要在某个时机写回磁盘

##### 2.1.3 **VFS 的通用 inode (struct inode)** —— 抽象层的"接口"

```c++
struct inode {
    union {
        struct sfs_inode __sfs_inode_info;    // SFS 的私有数据
        struct device __device_info;          // 设备文件的私有数据
    } in_info;
    enum { ... } in_type;                     // 文件系统类型
    const struct inode_ops *in_ops;           // 操作函数表
    // ...
};
```

**关键点：**

- 它通过 `in_info.sfs_inode_info` 包含了 `sfs_inode`
- 它通过 `in_ops` 指向具体的操作函数（如 `sfs_read`）
- 上层代码只需调用 `inode->in_ops->vop_read()`，不需要知道底层是 SFS

#### 2.2 三个inode的嵌套

```
VFS 层的 inode (struct inode)
    |
    |-- in_info.sfs_inode_info  ---->  SFS 内存 inode (struct sfs_inode)
    |                                       |
    |                                       |-- din  ---->  磁盘 inode 的内存副本
    |                                       |
    |                                       |-- ino = 磁盘块号
    |                                       |-- dirty = 是否被修改
    |
    |-- in_ops  ---->  sfs_node_fileops (SFS 的操作函数表)
```

**数据流向：**

1. 用户调用 `read()`
2. VFS 通过 `struct inode` 找到 `sfs_inode`
3. SFS 通过 `sfs_inode->din` 访问磁盘数据
4. 如果修改了数据，设置 `dirty = true`
5. 关闭文件时，如果 `dirty == true`，把内存数据写回磁盘

#### 2.3 直接索引和间接索引

##### 2.3.1 直接索引（direct[]）：

在`sfs_disk_inode`中，用一个数组直接存储块号：

```
struct sfs_disk_inode {
    uint32_t direct[12];   // 直接索引数组
    // ...
};
```

##### 2.3.2 间接索引（indirect[]）：

用一个"索引块"专门存储更多的块号。

```c++
cstruct sfs_disk_inode {
    uint32_t direct[12];   // 直接索引（48KB）
    uint32_t indirect;     // 间接索引块的块号
    // ...
};
```

**工作原理：**

1. `indirect` 存储的是一个"索引块"的块号，例如 `indirect = 200`
2. 读取第 200 号块，这个块里面**全是块号**（不是数据）
3. 一个块（4KB）可以存储 1024 个块号（4KB ÷ 4 字节 = 1024）
4. 这 1024 个块号指向实际的数据块

#### 2.4 完整的寻址过程

假设你要读取文件的第 60KB 数据：

1. **判断使用哪种索引：**
   - 60KB > 48KB，超出了直接索引范围
   - 需要使用间接索引
2. **计算逻辑块号：**
   - 60KB ÷ 4KB = 第 15 个块
   - 前 12 个块用直接索引，所以是间接索引的第 3 个块
3. **查找物理块号：**
   - 读取 `indirect` 指向的索引块（例如块 200）
   - 在索引块中找到第 3 个块号（例如 245）
   - 读取块 245 的数据

**这个过程由 `sfs_bmap_load_nolock` 函数完成。**

#### 2.5 完整的操作流程示例

场景：用户执行 `read(fd, buf, 100KB)`

**第 1 步：从 fd 找到 file**

```
进程的 files_struct->fd_array[fd]  --->  struct file
```

**第 2 步：从 file 找到 VFS inode**

```
struct file->node  --->  struct inode (VFS 层)
```

**第 3 步：从 VFS inode 找到 SFS inode**

```
struct inode->in_info.sfs_inode_info  --->  struct sfs_inode (SFS 层)
```

**第 4 步：从 SFS inode 找到磁盘 inode**

```
struct sfs_inode->din  --->  struct sfs_disk_inode (内存副本)
```

**第 5 步：解析索引，找到数据块**

```
sfs_disk_inode->direct[0-11]  --->  前 48KB 的块号
sfs_disk_inode->indirect      --->  索引块
    索引块内的块号数组      --->  剩余数据的块号
```

**第 6 步：调用磁盘驱动读取数据**

```
根据块号，调用硬盘驱动读取实际数据到 buf
```

**第 7 步：关闭文件时写回**

```
if (sfs_inode->dirty) {
    把 sfs_disk_inode 写回磁盘的对应块
}
```

=========================================================================================================

​	上面是对整个过程的一个总结，下面是对过程中的细节的深入理解。

### 3、对ucore文件系统的深入理解

#### 3.1 文件系统抽象层VFS

​	**文件系统抽象层**是把不同文件系统的对外共性接口提取出来，形成一个函数指针数组，这样，通用文件系统访问接口层只需访问文件系统抽象层，而不需关心具体文件系统的实现细节和接口。（具体各个接口层的结构可以看上面的图2）

​	对VFS层理解时可以参考下面这个过程：

1. **用户态请求**：
   用户程序调用 `read(fd, buffer, len)`。这里的 `fd` 是一个整数（文件描述符）。
2. **系统调用（通用接口层）**：
   系统将操作转换为内核态，进入 `sys_read`。
3. **进程层查找**：
   内核首先去**当前进程**的 `proc_struct` 中找到 `files_struct`。
   利用用户传进来的 **`fd`** 作为索引，在 `files_struct` 的 `fd_array` 数组中找到对应的 **`struct file`**。
   - *注意：这一步是在进程管理结构中完成的，目的是从“用户的代号 fd”找到“内核的对象 file”。*
4. **VFS 层转发（这才是 VFS 开始工作的地方）**：
   拿到 `struct file` 后，内核通过 `file->node` 指针找到了 **`struct inode`**。
   此时进入了 VFS 的领域。内核不需要知道这个 inode 是 SFS 的还是设备的，它直接调用 `inode->in_ops->vop_read(...)`。
5. **实现层执行**：
   这个 `vop_read` 函数指针实际上指向了底层具体的实现（例如 `sfs_read`）。
   代码跳转到 SFS 层，执行具体的磁盘/内存操作。



具体的inode操作函数指针的列表inode_ops：

```c++
struct inode_ops {
    unsigned long vop_magic;
    int (*vop_open)(struct inode *node, uint32_t open_flags);
    int (*vop_close)(struct inode *node);
    int (*vop_read)(struct inode *node, struct iobuf *iob);
    int (*vop_write)(struct inode *node, struct iobuf *iob);
    int (*vop_getdirentry)(struct inode *node, struct iobuf *iob);
    int (*vop_create)(struct inode *node, const char *name, bool excl, struct inode **node_store);
    int (*vop_lookup)(struct inode *node, char *path, struct inode **node_store);
……
 };
```



#### 3.2 硬盘文件系统SFS

​	剩余的部分可以看实验指导书，这里就只说**SFS的操作接口**，也就是**SFS 如何实现 VFS 定义的抽象接口**。

##### 3.2.1 文件操作接口（sfs_node_fileops）：

```c++
static const struct inode_ops sfs_node_fileops = {
    .vop_open   = sfs_openfile,   // 打开文件（几乎不做什么）
    .vop_close  = sfs_close,      // 关闭文件（写回 dirty 数据）
    .vop_read   = sfs_read,       // 读文件
    .vop_write  = sfs_write,      // 写文件
    // ...
};
```

**工作流程：**

```c++
VFS 层调用: inode->in_ops->vop_read(...)
    ↓
实际执行: sfs_read(...)
    ↓
调用: sfs_io(...)  ← SFS 的统一 I/O 函数
    ↓
调用: sfs_bmap_load_nolock(...)  ← 逻辑块号 → 物理块号
    ↓
调用: 磁盘驱动读取数据块
```

##### 3.2.2 目录操作接口（sfs_node_dirops）：

```c++
static const struct inode_ops sfs_node_dirops = {
    .vop_open        = sfs_opendir,      // 打开目录
    .vop_close       = sfs_close,        // 关闭目录（与文件相同）
    .vop_getdirentry = sfs_getdirentry,  // 读取目录项（ls 命令）
    .vop_lookup      = sfs_lookup,       // 在目录中查找子文件
    // ...
};
可视化理解：
目录 /home 的数据块：
┌────────────────────────────┐
│ ino=100, name="user1"      │ ← entry 0
│ ino=101, name="user2"      │ ← entry 1
│ ino=0,   name=""           │ ← entry 2 (已删除)
│ ino=102, name="README"     │ ← entry 3
└────────────────────────────┘
```



**vop_lookup的作用：**

```
输入: 父目录的 inode + 子文件名（例如 "file.txt"）
输出: 子文件的 inode

实现:
1. 调用 sfs_dirent_search_nolock 在父目录中查找 "file.txt"
2. 获取对应的 ino（例如 500）
3. 读取磁盘第 500 块，得到 disk_inode
4. 创建内存 inode 并返回
```

##### 3.2.3 `inode_ops`结构体的作用

**核心思想:多态**

```c++
struct inode_ops {
    int (*vop_read)(struct inode *node, struct iobuf *iob);
    int (*vop_write)(struct inode *node, struct iobuf *iob);
    int (*vop_lookup)(struct inode *node, char *path, struct inode **node_store);
    // ... 更多操作
};
```

**具体的分层逻辑：**

```
[VFS 层]
调用: inode->in_ops->vop_lookup(...)  ← 统一接口

[SFS 层]
执行: sfs_lookup(...)
    ↓
调用: sfs_dirent_search_nolock(...)  ← 在目录中查找文件名
    ↓
返回: 子文件的 inode 编号

[磁盘层]
读取: 对应磁盘块的 disk_inode 数据
```



#### 3.3 设备即文件

| 设备       | 类型     | 读操作         | 写操作         | 特殊机制              |
| ---------- | -------- | -------------- | -------------- | --------------------- |
| **stdin**  | 字符设备 | ✅ 从缓冲区读取 | ❌ 不支持       | 双缓冲区 + 等待队列   |
| **stdout** | 字符设备 | ❌ 不支持       | ✅ 输出到控制台 | 直接调用 `cputchar()` |
| **disk0**  | 块设备   | ✅ 按块读取     | ✅ 按块写入     | 信号量保护 + 块对齐   |



#### 3.4 open的完整调用链

**一句话总结：**

​	用户调用 `open(path, flags)` → 内核拷贝路径 → VFS 层解析路径 → SFS 层逐级查找目录 → 返回 inode 和文件描述符 fd。

```
用户空间:
    fd = open("/sfs_filetest1", O_RDWR)
        ↓ 系统调用
内核态 - 通用接口层:
    sysfile_open()
        ↓ copy_path()  拷贝路径到内核
    file_open()
        ↓ fd_array_alloc()  分配 file 结构
        ↓
VFS 层:
    vfs_open()
        ↓ vfs_lookup()  路径解析
        ↓ get_device()  确定起始 inode（根目录）
        ↓ vop_lookup()  调用 SFS 层查找
        ↓
SFS 层:
    sfs_lookup()
        ↓ sfs_lookup_once()  在根目录查找 "sfs_filetest1"
        ↓ sfs_dirent_search_nolock()  遍历目录项
        ↓ 找到 ino = 100
        ↓ sfs_load_inode()  加载磁盘 inode
        ↓ 返回内存 inode
        ↓
返回 VFS 层:
    vfs_open() 返回 inode
        ↓
返回通用接口层:
    file_open() 初始化 file 结构
        ↓
返回用户空间:
    fd = 3
```

- 三层架构的职责划分：

| 层次           | 职责                                        |
| -------------- | ------------------------------------------- |
| **通用接口层** | 参数拷贝、分配 file 结构、返回 fd           |
| **VFS 层**     | 路径解析、处理 flags、调用底层文件系统      |
| **SFS 层**     | 查找目录项、加载 disk_inode、创建内存 inode |

- **路径解析的关键：**
  - **`get_device()`**：确定从哪个 inode 开始查找
  - **`vop_lookup()`**：逐级解析路径（虽然 Lab8 只支持单级）
  - **`sfs_dirent_search_nolock()`**：在目录中查找文件名

**（Read完整调用链就不写了，逻辑其实和open差不多），只写一个调用链就行：**

```
用户空间:
    read(fd, buf, 10000)
        ↓
内核态 - 通用接口层:
    sysfile_read()
        ↓ 分配 4KB 内核缓冲区
        ↓ 循环调用
    file_read()
        ↓ 更新 file->pos
        ↓
VFS 层:
    vop_read()
        ↓
SFS 层:
    sfs_read() → sfs_io() → sfs_io_nolock()
        ↓
        ↓ 第 1 步: 读取起始未对齐部分
        ↓ sfs_bmap_load_nolock() → 获取物理块号
        ↓ sfs_rbuf() → 读取部分块
        ↓
        ↓ 第 2 步: 读取中间完整块
        ↓ sfs_bmap_load_nolock() → 获取物理块号
        ↓ sfs_rblock() → 读取完整块
        ↓
        ↓ 第 3 步: 读取末尾未对齐部分
        ↓ sfs_bmap_load_nolock() → 获取物理块号
        ↓ sfs_rbuf() → 读取部分块
        ↓
磁盘层:
    ide_read_secs() → 读取物理磁盘扇区
        ↓
返回用户空间:
    copy_to_user() → 拷贝数据到用户缓冲区
    
```



```
┌─────────────────────────────────────────────────────────────┐
│ 用户态：open("/test.txt", O_RDWR)                          │
└─────────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────────┐
│ VFS 层：vfs_open(path="/test.txt", flags=O_RDWR, &node)    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│ 第一步：vfs_lookup(path, &node)  ← 查找文件               │
│     ↓                                                       │
│ ┌─────────────────────────────────────────────────────┐   │
│ │ get_device(path, &path, &node)                      │   │
│ │   输入：path = "/test.txt"                          │   │
│ │   输出：node = root_node (根目录 "/" 的 inode)      │   │
│ │         path = "test.txt"                           │   │
│ └─────────────────────────────────────────────────────┘   │
│     ↓                                                       │
│ ┌─────────────────────────────────────────────────────┐   │
│ │ vop_lookup(root_node, "test.txt", &node)            │   │
│ │   ↓ 调用 sfs_lookup                                │   │
│ │ ┌───────────────────────────────────────────────┐  │   │
│ │ │ sfs_lookup(root_node, "test.txt", &node)     │  │   │
│ │ │   ├─ 检查 root_node 是目录 ✓                │  │   │
│ │ │   └─ sfs_lookup_once(...)                    │  │   │
│ │ │       ├─ sfs_dirent_search_nolock           │  │   │
│ │ │       │   在根目录的数据块中搜索：           │  │   │
│ │ │       │   ┌───────────────────────────────┐ │  │   │
│ │ │       │   │ Block 50 (根目录数据)         │ │  │   │
│ │ │       │   │ entry[0]: ino=100, name="test.txt"│ │   │
│ │ │       │   │ entry[1]: ino=101, name="home"│ │  │   │
│ │ │       │   └───────────────────────────────┘ │  │   │
│ │ │       │   找到了！ino = 100                  │  │   │
│ │ │       └─ sfs_load_inode(sfs, &node, 100)   │  │   │
│ │ │           读取 Block 100：                   │  │   │
│ │ │           ┌───────────────────────────────┐ │  │   │
│ │ │           │ sfs_disk_inode                │ │  │   │
│ │ │           │ size = 1024                   │ │  │   │
│ │ │           │ type = SFS_TYPE_FILE          │ │  │   │
│ │ │           │ direct[0] = 300               │ │  │   │
│ │ │           └───────────────────────────────┘ │  │   │
│ │ │           创建内存 inode：                   │  │   │
│ │ │           node->in_ops = &sfs_node_fileops  │  │   │
│ │ └───────────────────────────────────────────┘  │   │
│ │   输出：node = file_node (test.txt 的 inode)   │   │
│ └─────────────────────────────────────────────────────┘   │
│                                                             │
│ 第二步：vop_open(node, O_RDWR)  ← 打开文件                │
│     ↓                                                       │
│ ┌─────────────────────────────────────────────────────┐   │
│ │ node->in_ops->vop_open(node, O_RDWR)                │   │
│ │   ↓ 调用 sfs_openfile                              │   │
│ │ ┌───────────────────────────────────────────────┐  │   │
│ │ │ sfs_openfile(node, O_RDWR)                   │  │   │
│ │ │   └─ return 0 (基本什么都不做)              │  │   │
│ │ └───────────────────────────────────────────────┘  │   │
│ └─────────────────────────────────────────────────────┘   │
│                                                             │
│ 返回：node = file_node                                     │
└─────────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────────┐
│ 返回用户态：fd = 3                                          │
└─────────────────────────────────────────────────────────────┘
```



## 二、练习

### 练习一：完成读文件操作的实现（需要编码）

首先了解打开文件的处理流程，然后参考本实验后续的文件读写操作的过程分析，填写在 kern/fs/sfs/sfs_inode.c中 的sfs_io_nolock()函数，实现读文件中数据的代码。

#### 一、打开文件的处理流程

用户程序: open("test.txt", O_RDWR)
    ↓
系统调用: sys_open()
    ↓
内核文件层: sysfile_open()
    ↓
文件描述符层: file_open()        ← 核心入口
    ↓
虚拟文件系统层: vfs_open()
    ↓                      ↘
文件系统层: sfs_lookup()   → sfs_create() (如果需要创建)
    ↓
磁盘操作层: sfs_load_inode()
    ↓
设备驱动层: disk_read()

打开文件的处理流程是一个自顶向下分层处理的过程：从用户空间的`open()`系统调用开始，经过内核的文件描述符管理层分配文件描述符并创建`file`结构体，再到虚拟文件系统层（VFS）解析路径和权限检查，最后由具体文件系统（如SFS）执行磁盘inode的查找或创建。整个过程涉及路径解析、权限验证、inode缓存管理、磁盘块分配等多个关键步骤，最终在进程文件描述符表和磁盘文件之间建立连接通道，使得后续的文件读写操作可以通过这个通道进行。

#### 二、sfs_io_nolock()函数分析

`sfs_io_nolock()` 是一个用于处理 SFS 文件系统中数据读取操作的内部函数。它不直接涉及到上述的完整流程中的某些步骤，但它在执行时需要考虑以下几点：

- **锁定机制**：由于名称中含有 `_nolock` 后缀，这意味着此函数的实现假定已经获得了适当的锁来保护共享资源的并发访问。
- **定位与读取**：该函数需要能够从文件中指定位置开始读取一定数量的字节到提供的

#### 三、代码部分：

```c
// Step 1: 处理不完整的起始块
    blkoff = offset % SFS_BLKSIZE;  // 计算在第一个块内的偏移
    if (blkoff != 0) {
        size = (nblks != 0) ? (SFS_BLKSIZE - blkoff) : (endpos - offset);
        // 获取第一个数据块的实际磁盘块号
        if ((ret = sfs_bmap_load_nolock(sfs, sin, blkno, &ino)) != 0) {
            goto out;
        }
        // 读取第一个块的部分数据
        if ((ret = sfs_buf_op(sfs, buf, size, ino, blkoff)) != 0) {
            goto out;
        }
        alen += size;
        blkno++;
        nblks--;
        buf += size;  // 移动缓冲区指针
    }

    // Step 2: 处理完整的中间块
    if (nblks > 0) {
        // 批量读取完整的块
        if ((ret = sfs_bmap_load_nolock(sfs, sin, blkno, &ino)) != 0) {
            goto out;
        }
        // 读取多个完整块
        if ((ret = sfs_block_op(sfs, buf, ino, nblks)) != 0) {
            goto out;
        }
        size = nblks * SFS_BLKSIZE;
        alen += size;
        blkno += nblks;
        buf += size;  // 移动缓冲区指针
    }

    // Step 3: 处理不完整的结束块
    size = endpos % SFS_BLKSIZE;
    if (size > 0) {
        // 获取最后一个数据块的实际磁盘块号
        if ((ret = sfs_bmap_load_nolock(sfs, sin, blkno, &ino)) != 0) {
            goto out;
        }
        // 读取最后一个块的部分数据（从块开始读取）
        if ((ret = sfs_buf_op(sfs, buf, size, ino, 0)) != 0) {
            goto out;
        }
        alen += size;
    }

out:
    *alenp = alen;
    if (offset + alen > sin->din->size) {
        sin->din->size = offset + alen;
        sin->dirty = 1;
    }
    return ret;```
```

### 练习2: 完成基于文件系统的执行程序机制的实现（需要编码）

1.补充alloc_proc函数中初始化 proc_struct

    proc->filesp = NULL;

2.补充 proc_run 函数中更新 tlb 代码

    bool intr_flag;
    local_intr_save(intr_flag);
    {
        struct proc_struct *prev = current;
        current = proc;
    
        lsatp(proc->pgdir);
        flush_tlb();        //lab8 更新tlb
        switch_to(&(prev->context), &(proc->context));
    }
    local_intr_restore(intr_flag);

3.补充load_icode函数代码

    static int
    load_icode(int fd, int argc, char **kargv)
    {
        /* LAB8:EXERCISE2 YOUR CODE  HINT:how to load the file with handler fd  in to process's memory? how to setup argc/argv?
        * MACROs or Functions:
        *  mm_create        - create a mm
        *  setup_pgdir      - setup pgdir in mm
        *  load_icode_read  - read raw data content of program file
        *  mm_map           - build new vma
        *  pgdir_alloc_page - allocate new memory for  TEXT/DATA/BSS/stack parts
        *  lsatp             - update Page Directory Addr Register -- CR3
        */
        //You can Follow the code form LAB5 which you have completed  to complete 
        /* (1) create a new mm for current process
        * (2) create a new PDT, and mm->pgdir= kernel virtual addr of PDT
        * (3) copy TEXT/DATA/BSS parts in binary to memory space of process
        *    (3.1) read raw data content in file and resolve elfhdr
        *    (3.2) read raw data content in file and resolve proghdr based on info in elfhdr
        *    (3.3) call mm_map to build vma related to TEXT/DATA
        *    (3.4) callpgdir_alloc_page to allocate page for TEXT/DATA, read contents in file
        *          and copy them into the new allocated pages
        *    (3.5) callpgdir_alloc_page to allocate pages for BSS, memset zero in these pages
        * (4) call mm_map to setup user stack, and put parameters into user stack
        * (5) setup current process's mm, cr3, reset pgidr (using lsatp MARCO)
        * (6) setup uargc and uargv in user stacks
        * (7) setup trapframe for user environment
        * (8) if up steps failed, you should cleanup the env.
        */
        assert(argc >= 0 && argc <= EXEC_MAX_ARG_NUM);
        
        if (current->mm != NULL)
        {
            panic("load_icode: current->mm must be empty.\n");
        }
    
        int ret = -E_NO_MEM;
        struct mm_struct *mm;
        struct Page*page;
        
        // ====================== 步骤1：为当前进程创建新的mm结构 ======================
        if ((mm = mm_create()) == NULL)
        {
            goto bad_mm;
        }
        
        // ====================== 步骤2：创建新的PDT，设置mm->pgdir指向PDT的内核虚拟地址 ======================
        if (setup_pgdir(mm) != 0)
        {
            goto bad_pgdir_cleanup_mm;
        }
    
        // ====================== 步骤3：将二进制文件的TEXT/DATA/BSS复制到进程内存空间 ======================
        // 3.1 读取文件原始数据并解析ELF文件头（elfhdr）
        struct elfhdr __elf, *elf = &__elf;
        if ((ret = load_icode_read(fd, elf, sizeof(struct elfhdr), 0)) != 0)
        {
            goto bad_elf_cleanup_pgdir;
        }
    
        // 检查ELF魔数（合法性校验，为3.1解析步骤的补充）
        if (elf->e_magic != ELF_MAGIC)
        {
            ret = -E_INVAL_ELF;
            goto bad_elf_cleanup_pgdir;
        }
    
        struct proghdr __ph, *ph = &__ph;
        uint32_t vm_flags, perm, phnum;
        
        // 遍历所有程序段（核心循环处理TEXT/DATA/BSS）
        for (phnum = 0; phnum < elf->e_phnum; phnum++)
        {
            off_t phoff = elf->e_phoff + sizeof(struct proghdr) * phnum;
            
            // 3.2 基于ELF头信息读取并解析程序段头（proghdr）
            if ((ret = load_icode_read(fd, ph, sizeof(struct proghdr), phoff)) != 0)
            {
                goto bad_cleanup_mmap;
            }
            
            // 只处理LOAD类型的段（TEXT/DATA/BSS属于此类）
            if (ph->p_type != ELF_PT_LOAD)
            {
                continue;
            }
            if (ph->p_filesz > ph->p_memsz)
            {
                ret = -E_INVAL_ELF;
                goto bad_cleanup_mmap;
            }
            if (ph->p_memsz == 0)
            {
                continue;
            }
            
            // 设置虚拟内存标志和页表权限（为3.3做准备）
            vm_flags = 0;
            perm = PTE_U | PTE_V;
    
            if (ph->p_flags & ELF_PF_R) {
                vm_flags |= VM_READ;
                perm |= PTE_R;  //  添加读权限
            }
            if (ph->p_flags & ELF_PF_W) {
                vm_flags |= VM_WRITE;
                perm |= (PTE_R | PTE_W);  // 可写必须可读
            }
            if (ph->p_flags & ELF_PF_X) {
                vm_flags |= VM_EXEC;
                perm |= PTE_X;  //  添加执行权限
            }
            
            // 3.3 调用mm_map构建TEXT/DATA对应的VMA
            if ((ret = mm_map(mm, ph->p_va, ph->p_memsz, vm_flags, NULL)) != 0)
            {
                goto bad_cleanup_mmap;
            }
            
            // 分配物理页并加载段数据的临时变量初始化
            size_t off, size;
            uintptr_t start = ph->p_va, end, la = ROUNDDOWN(start, PGSIZE);
            
            ret = -E_NO_MEM;
            end = ph->p_va + ph->p_filesz;
            
            // 3.4 逐页分配物理页，读取文件内容并复制到新分配的页中（TEXT/DATA加载）
            while (start < end)
            {
                if ((page = pgdir_alloc_page(mm->pgdir, la, perm)) == NULL)
                {
                    goto bad_cleanup_mmap;
                }
                off = start - la, size = PGSIZE - off, la += PGSIZE;
                if (end < la)
                {
                    size -= la - end;
                }
                
                // 从文件读取TEXT/DATA数据到物理页
                if ((ret = load_icode_read(fd, page2kva(page) + off, size, 
                                        ph->p_offset + (start - ph->p_va))) != 0)
                {
                    goto bad_cleanup_mmap;
                }
                start += size;
            }
            
            // 处理BSS段的临时变量更新
            end = ph->p_va + ph->p_memsz;
            // 3.5 为BSS段分配物理页并清零（当前页剩余部分）
            if (start < la)
            {
                if (start == end)
                {
                    continue;
                }
                off = start + PGSIZE - la, size = PGSIZE - off;
                if (end < la)
                {
                    size -= la - end;
                }
                memset(page2kva(page) + off, 0, size);
                start += size;
                assert((end < la && start == end) || (end >= la && start == la));
            }
            
            // 3.5 为BSS段分配新物理页并清零（跨页部分）
            while (start < end)
            {
                if ((page = pgdir_alloc_page(mm->pgdir, la, perm)) == NULL)
                {
                    goto bad_cleanup_mmap;
                }
                off = start - la, size = PGSIZE - off, la += PGSIZE;
                if (end < la)
                {
                    size -= la - end;
                }
                memset(page2kva(page) + off, 0, size);
                start += size;
            }
        }
        
        // 关闭ELF文件（步骤3的收尾）
        file_close(fd);
    
        // ====================== 步骤4：调用mm_map设置用户栈，并准备参数入栈 ======================
        // 4.1 构建用户栈的VMA
        vm_flags = VM_READ | VM_WRITE | VM_STACK;
        if ((ret = mm_map(mm, USTACKTOP - USTACKSIZE, USTACKSIZE, vm_flags, NULL)) != 0)
        {
            goto bad_cleanup_mmap;
        }
    
        // 预分配栈顶8页（栈初始化补充）
        for (uint32_t n = 1; n <= 8; n++)
        {
            assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - n * PGSIZE,
                                    PTE_U | PTE_R | PTE_W | PTE_V) != NULL);
        }
    
        // 计算参数总大小（为参数入栈做准备）
        uint32_t argv_size = 0;
        for (uint32_t idx = 0; idx < (uint32_t)argc; idx++)
        {
            argv_size += strnlen(kargv[idx], EXEC_MAX_ARG_LEN + 1) + 1;
        }
    
        // 计算栈上参数布局（为参数入栈做地址规划）
        uintptr_t strings_top = USTACKTOP - ROUNDUP(argv_size, sizeof(uintptr_t));
        char **uargv = (char **)(strings_top - (uintptr_t)(argc + 1) * sizeof(char *));
        uintptr_t sp_aligned = ROUNDDOWN((uintptr_t)uargv, 16);
        uintptr_t argv_ptr_uva = sp_aligned - sizeof(uintptr_t);
        uintptr_t argc_uva = argv_ptr_uva - sizeof(uintptr_t);
    
        // 校验栈空间是否足够（参数入栈前的安全检查）
        if (argc_uva < USTACKTOP - USTACKSIZE)
        {
            ret = -E_NO_MEM;
            goto bad_cleanup_mmap;
        }
    
        // ====================== 步骤6：在用户栈中设置uargc和uargv ======================
        // 6.1 拷贝参数字符串到用户栈
        uintptr_t arg_uva = strings_top;
        for (uint32_t idx = 0; idx < (uint32_t)argc; idx++)
        {
            size_t len = strnlen(kargv[idx], EXEC_MAX_ARG_LEN + 1) + 1;
            if ((ret = user_mem_store_bytes(mm->pgdir, arg_uva, kargv[idx], len)) != 0)
            {
                goto bad_cleanup_mmap;
            }
    
            // 6.2 写入argv数组元素（指向参数字符串）
            uintptr_t ptr_uva = (uintptr_t)&uargv[idx];
            if ((ret = user_mem_store_bytes(mm->pgdir, ptr_uva, &arg_uva, sizeof(arg_uva))) != 0)
            {
                goto bad_cleanup_mmap;
            }
            arg_uva += len;
        }
    
        // 6.3 写入argv数组末尾的NULL
        uintptr_t null_ptr = 0;
        if ((ret = user_mem_store_bytes(mm->pgdir, (uintptr_t)&uargv[argc], &null_ptr, sizeof(null_ptr))) != 0)
        {
            goto bad_cleanup_mmap;
        }
    
        // 6.4 写入uargc到用户栈
        uintptr_t argc_value = (uintptr_t)argc;
        if ((ret = user_mem_store_bytes(mm->pgdir, argc_uva, &argc_value, sizeof(argc_value))) != 0)
        {
            goto bad_cleanup_mmap;
        }
    
        // 6.5 写入uargv指针到用户栈
        uintptr_t uargv_value = (uintptr_t)uargv;
        if ((ret = user_mem_store_bytes(mm->pgdir, argv_ptr_uva, &uargv_value, sizeof(uargv_value))) != 0)
        {
            goto bad_cleanup_mmap;
        }
    
        // 确定用户态栈指针最终位置（步骤4和6的收尾）
        uintptr_t user_sp = argc_uva;
    
        // ====================== 步骤5：设置进程mm、更新CR3（lsatp）、重置页目录 ======================
        mm_count_inc(mm);
        current->mm = mm;
        current->pgdir = PADDR(mm->pgdir);
        lsatp(PADDR(mm->pgdir));  // 更新页目录基址寄存器（对应CR3）
        flush_tlb();  // 刷新TLB，确保页表生效
    
        // ====================== 步骤7：为用户环境设置trapframe ======================
        struct trapframe *tf = current->tf;
        memset(tf, 0, sizeof(struct trapframe));
        tf->gpr.sp = user_sp;       // 设置用户态栈指针
        tf->gpr.a0 = argc;          // 传递argc到用户态
        tf->gpr.a1 = (uintptr_t)uargv;  // 传递uargv到用户态
        tf->gpr.a2 = 0;
        tf->epc = elf->e_entry;     // 设置程序入口地址
        tf->status = (read_csr(sstatus) | SSTATUS_SPIE) & ~SSTATUS_SPP;  // 配置用户态运行状态
        
        ret = 0;
    
    out:
        return ret;
        
        // ====================== 步骤8：步骤失败时清理环境 ======================
    bad_cleanup_mmap:
        exit_mmap(mm);  // 清理虚拟内存映射和物理页
    bad_elf_cleanup_pgdir:
        put_pgdir(mm);  // 清理页目录表
    bad_pgdir_cleanup_mm:
        mm_destroy(mm); // 销毁mm结构体
    bad_mm:
        goto out;       // 最终返回错误码
    }



### 扩展练习 Challenge1：完成基于“UNIX的PIPE机制”的设计方案

#### 1、管道（Pipe）机制

##### 1.1 定义：

管道=一个环形缓冲区+同步机制，如下图所示：

```
┌─────────────────────────────────┐
│         环形缓冲区                │
│  ┌───┬───┬───┬───┬───┬───┬───┐  │
│  │ A │ B │ C │   │   │   │   │  │
│  └───┴───┴───┴───┴───┴───┴───┘  │
│    ↑           ↑                │
│  read_pos   write_pos           │
│                                 │
│  data_size = 3 (有 3 个字节)     │
│  capacity = 7 (总共 7 个字节)     │
└─────────────────────────────────┘
写操作：
1. 检查是否有空间
2. 如果满了，等待
3. 写入数据到 write_pos
4. write_pos 向后移动
5. 唤醒等待的读者

读操作：
1. 检查是否有数据
2. 如果空了，等待
3. 从 read_pos 读取数据
4. read_pos 向后移动
5. 唤醒等待的写者
```

##### 1.2 基本思想：把管道Pipe伪装成inode，这样就可以直接复用现有的框架。

##### 1.3 管道Pipe的数据结构：

```c++
// kern/fs/pipe/pipe_inode.h

// ========== 核心结构：pipe_inode_info ==========
struct pipe_inode_info {
    // ────────── 1. 环形缓冲区 ──────────
    char *buffer;               // 缓冲区指针
    size_t read_pos;            // 读位置（头指针）
    size_t write_pos;           // 写位置（尾指针）
    size_t bytes;               // 当前数据量（有多少字节可读）
    
    // 解释：
    // buffer: [A][B][C][ ][ ][ ][ ]
    //          ↑       ↑
    //      read_pos write_pos
    // bytes = 3（有 3 个字节可读）
    
    // ────────── 2. 引用计数 ──────────
    int read_open;              // 读端打开计数
    int write_open;             // 写端打开计数
    
    // 解释：
    // read_open = 1  → 有进程持有读端
    // write_open = 1 → 有进程持有写端
    // 两者都为 0 → 销毁管道
    
    // ────────── 3. 同步互斥 ──────────
    semaphore_t mutex;          // 互斥锁（保护整个结构）
    wait_queue_t readers;       // 读者等待队列
    wait_queue_t writers;       // 写者等待队列
    
    // 解释：
    // mutex：确保同一时间只有一个进程操作管道
    // readers：管道空时，读者在这里睡眠
    // writers：管道满时，写者在这里睡眠
};

// ========== VFS 集成：inode_ops ==========
static const struct inode_ops pipe_inode_ops = {
    .vop_magic   = VOP_MAGIC,
    .vop_open    = pipe_open,      // 打开管道
    .vop_close   = pipe_close,     // 关闭管道
    .vop_read    = pipe_read,      // 读取管道
    .vop_write   = pipe_write,     // 写入管道
    .vop_ioctl   = pipe_ioctl,     // 控制操作
    // 其他操作为 NULL
};
```

###### 1.3.1 对同步互斥问题的处理：

从读者read视角，可以参考下列的代码：

```c++
ssize_t pipe_read(struct pipe *pipe, void *buf, size_t len) {
    // ========== 步骤 1：获取互斥锁 ==========
    down(&pipe->mutex);
    // 作用：确保只有一个进程操作管道
    
    // ========== 步骤 2：检查条件（同步）==========
    while (pipe->bytes == 0) {
        // 管道为空
        
        // 检查：是否有写者？
        if (pipe->writers == 0) {
            // 没有写者 → 不会再有数据 → 返回 EOF
            up(&pipe->mutex);
            return 0;
        }
        
        // 有写者，等待数据
        // 关键：wait_in_queue 会自动释放锁！
        wait_in_queue(&pipe->readers, &pipe->mutex); //----->如果存在写者，进入读者等待队列
        
        // 被唤醒后，锁已重新获取
        // 继续循环，重新检查条件
    }
    
    // ========== 步骤 3：读取数据（临界区）==========
    // 此时：bytes > 0，可以安全读取
    
    size_t to_read = (len < pipe->bytes) ? len : pipe->bytes;
    
    // 从环形缓冲区复制数据
    for (int i = 0; i < to_read; i++) {
        ((char*)buf)[i] = pipe->buffer[pipe->read_pos];
        pipe->read_pos = (pipe->read_pos + 1) % PIPE_SIZE;
    }
    
    pipe->bytes -= to_read;
    
    // ========== 步骤 4：唤醒写者（同步）==========
    // 因为读取了数据，管道有空间了
    wakeup_queue(&pipe->writers);
    
    // ========== 步骤 5：释放互斥锁 ==========
    up(&pipe->mutex);
    
    return to_read;
}
```

#### 1.4 接口实现详解：

```
用户层
  ↓ pipe() / read() / write() / close()
────────────────────────────────────────
系统调用层 (kern/syscall/syscall.c)
  ├─ sys_pipe(int *fd_store)
  │    创建管道(分配pipe_inode_info和buffer)，分配两个文件描述符
  │
  ↓ 调用文件系统通用接口
────────────────────────────────────────
VFS 层 (kern/fs/vfs/)
  ├─ vfs_open() / vfs_read() / vfs_write()----->通过inode_ops调用管道操作
  │    统一文件操作接口
  │
  ↓ 通过 inode_ops 分发
────────────────────────────────────────
管道实现层 (kern/fs/pipe/pipe_inode.c)
  ├─ pipe_read(struct inode *node, struct iobuf *iob)
  │    从管道读取数据
  ├─ pipe_write(struct inode *node, struct iobuf *iob)
  │    向管道写入数据
  ├─ pipe_open(struct inode *node, uint32_t flags)
  │    打开管道，增加引用计数
  └─ pipe_close(struct inode *node, struct file *file)
       关闭管道，减少引用计数，必要时销毁
  │
  ↓ 使用同步原语
────────────────────────────────────────
同步原语层 (kern/sync/)
  ├─ wait_in_queue(wait_queue_t *queue, semaphore_t *mutex)
  │    进程进入等待队列并睡眠（自动释放/重获锁）
  └─ wakeup_queue(wait_queue_t *queue)
       唤醒等待队列中的所有进程
```





### 扩展练习 Challenge2：完成基于“UNIX的软连接和硬连接机制”的设计方案

#### 1、硬链接详解

##### 1.1 数据结构：

```c++
// kern/fs/sfs/sfs.h

// ========== 磁盘 inode 结构（已有）==========
struct sfs_disk_inode {
    uint32_t size;                   // 文件大小（字节）
    uint16_t type;                   // 文件类型
    uint16_t nlinks;                 // 硬链接计数 ← 关键字段
    uint32_t blocks;                 // 数据块数量
    uint32_t direct[SFS_NDIRECT];    // 直接块索引
    uint32_t indirect;               // 一级间接块索引
};

// ────────── nlinks 字段说明 ──────────
// nlinks = 1  → 普通文件，只有一个名字
// nlinks = 2  → 有一个硬链接（两个名字）
// nlinks = 0  → 没有名字，可以删除

// ========== 内存 inode 结构 ==========
struct sfs_inode {
    struct sfs_disk_inode *din;      // 磁盘 inode
    uint32_t ino;                    // inode 号
    bool dirty;                      // 是否被修改
    semaphore_t sem;                 // inode 锁
    // ...
};

// ========== 目录项结构 ==========
struct sfs_disk_entry {
    uint32_t ino;                    // inode 号（0 表示空闲）
    char name[SFS_MAX_FNAME_LEN + 1]; // 文件名
};

// ────────── 硬链接的存储方式 ──────────
// 目录：
// ┌──────────────────────────┐
// │ entry[0]: {ino=100, name="file1.txt"} │
// │ entry[1]: {ino=100, name="file2.txt"} │ ← 同一个 ino
// └──────────────────────────┘
//              ↓
//         inode 100
//         nlinks = 2
```

##### 1.2 接口实现详解

```c++
用户层
  ↓ link() / unlink()
────────────────────────────────────────
系统调用层 (kern/syscall/syscall.c)
  ├─ sys_link(const char *oldpath, const char *newpath)
  │    创建硬链接
  └─ sys_unlink(const char *path)
       删除链接
  │
  ↓ 调用 VFS 接口
────────────────────────────────────────
VFS 层 (kern/fs/vfs/vfsfile.c)
  ├─ vfs_lookup() / vfs_lookup_parent()
  │    路径解析，获取 inode
  ├─ vop_link(struct inode *old, struct inode *parent, const char *name)
  │    VFS 层硬链接接口
  └─ vop_unlink(struct inode *parent, const char *name)
       VFS 层删除接口
  │
  ↓ 分发到具体文件系统
────────────────────────────────────────
SFS 实现层 (kern/fs/sfs/sfs_inode.c)
  ├─ sfs_link(struct inode *old, struct inode *parent, const char *name)
  │    ├─ 增加 old->din->nlinks
  │    └─ 在 parent 目录添加目录项 {ino, name}
  │
  └─ sfs_unlink(struct inode *parent, const char *name)
       ├─ 从 parent 目录删除目录项
       ├─ 减少 target->din->nlinks
       └─ 如果 nlinks == 0，释放数据块和 inode
  │
  ↓ 调用目录操作
────────────────────────────────────────
目录操作层 (kern/fs/sfs/sfs_dir.c)
  ├─ sfs_dirent_link_nolock()
  │    在目录中添加目录项
  └─ sfs_dirent_unlink_nolock()
       在目录中删除目录项
```

##### 1.3 同步互斥问题：

##### 1.3.1 问题一：nlinks计数竞争

- 描述：两个进程同时创建/删除硬链接 → nlinks 计数错误

- 解决方式：使用inode锁保护nlinks。具体实现如下所示：

```c++
sfs_link() {
    struct sfs_inode *sin = vop_info(old_node, sfs_inode);
    
    lock_sin(sin);              // ← 加锁
    sin->din->nlinks++;         // ← 临界区
    sin->dirty = true;
    unlock_sin(sin);            // ← 解锁
    
    // ...
}
```

##### 1.3.2 问题二：目录项并发修改

- 描述：多个进程同时在同一目录创建/删除链接 → 目录项冲突
- 解决方案：使用父目录的inode锁：

```c++
sys_link() {
    // ...
    lock_sin(parent_sin);        // ← 锁定父目录
    
    // 检查是否已存在
    if (sfs_dirent_search_nolock(parent, name, &ino, NULL, NULL) == 0) {
        unlock_sin(parent_sin);
        return -E_EXISTS;
    }
    
    // 添加目录项
    sfs_dirent_link_nolock(parent, name, target_ino);
    
    unlock_sin(parent_sin);      // ← 解锁
    
    // 更新目标 inode 的 nlinks（使用目标 inode 的锁）
    lock_sin(target_sin);
    target_sin->din->nlinks++;
    unlock_sin(target_sin);
}

// ────────── 关键点 ──────────
// ✓ 使用父目录的锁保护目录项操作
// ✓ 使用目标 inode 的锁保护 nlinks
// ✓ 注意加锁顺序，避免死锁：
//   - 总是先锁定父目录，再锁定子 inode
//   - 或者使用 trylock + 重试
```



#### 2、软链接详解

##### 2.1 数据结构：

```c++
// kern/fs/sfs/sfs.h

// ========== 扩展文件类型 ==========
#define SFS_TYPE_INVAL  0                // 无效
#define SFS_TYPE_FILE   1                // 普通文件
#define SFS_TYPE_DIR    2                // 目录
#define SFS_TYPE_LINK   3                // 软链接（新增）
#define SFS_TYPE_PIPE   4                // 命名管道

// ========== 磁盘 inode（复用已有结构）==========
struct sfs_disk_inode {
    uint32_t size;                       // 对于软链接：路径字符串长度
    uint16_t type;                       // SFS_TYPE_LINK
    uint16_t nlinks;                     // 通常为 1
    uint32_t blocks;                     // 数据块数（0 或 1）
    uint32_t direct[SFS_NDIRECT];        // 存储路径字符串（或路径所在块）
    uint32_t indirect;
};

// ────────── 软链接的存储方式 ──────────
// 短路径（≤ 60 字节，SFS_NDIRECT * 4）：
//   直接存在 direct[] 数组中（快速模式）
//
// 长路径（> 60 字节）：
//   分配数据块，存在数据块中（普通模式）

// ========== 内存 inode 扩展（可选优化）==========
struct sfs_inode {
    struct sfs_disk_inode *din;
    // ...
    
    // 快速软链接缓存
    char *symlink_cache;                 // 缓存的路径字符串
    bool symlink_cached;                 // 是否已缓存
};

// ========== VFS inode 类型扩展 ==========
#define S_IFMT      0170000              // 类型掩码
#define S_IFREG     0100000              // 普通文件
#define S_IFDIR     0040000              // 目录
#define S_IFLNK     0120000              // 软链接（新增）
#define S_IFIFO     0010000              // FIFO

// ========== 路径解析标志 ==========
#define LOOKUP_FOLLOW       0x01         // 跟随软链接
#define LOOKUP_NOFOLLOW     0x02         // 不跟随软链接
#define MAX_SYMLINK_DEPTH   8            // 最大跟随深度（防止循环）// ========== SFS 文件类型扩展 ==========
#define SFS_TYPE_LINK   3            // 软链接类型

// ========== 磁盘 inode（复用）==========
struct sfs_disk_inode {
    uint16_t type;                   // SFS_TYPE_LINK
    uint32_t size;                   // 路径字符串长度
    uint32_t direct[];               // 存储路径（短路径）或块号（长路径）
};
```

##### 2.2 接口实现详解：

```c++
用户层
  ↓ symlink() / readlink() / open()
────────────────────────────────────────
系统调用层 (kern/syscall/syscall.c)
  ├─ sys_symlink(const char *target, const char *linkpath)
  │    创建软链接
  └─ sys_readlink(const char *path, char *buf, size_t bufsz)
       读取软链接内容
  │
  ↓ 调用 VFS 接口
────────────────────────────────────────
VFS 层 (kern/fs/vfs/)
  ├─ vop_symlink(struct inode *parent, const char *name, const char *target)
  │    VFS 层创建软链接接口
  ├─ vop_readlink(struct inode *node, char *buf, size_t bufsz)
  │    VFS 层读取软链接接口
  └─ vfs_lookup_flags(const char *path, uint32_t flags, struct inode **node)
       路径解析（支持跟随/不跟随软链接）
       flags: LOOKUP_FOLLOW / LOOKUP_NOFOLLOW
  │
  ↓ 分发到具体文件系统
────────────────────────────────────────
SFS 实现层 (kern/fs/sfs/sfs_inode.c)
  ├─ sfs_symlink(struct inode *parent, const char *name, const char *target)
  │    ├─ 分配新 inode（type = SFS_TYPE_LINK）
  │    ├─ 将 target 路径写入 inode：
  │    │   - 短路径（≤60字节）：直接存入 din->direct[]
  │    │   - 长路径：分配数据块存储
  │    └─ 在父目录添加目录项
  │
  └─ sfs_readlink(struct inode *node, char *buf, size_t bufsz)
       ├─ 检查类型：必须是 SFS_TYPE_LINK
       └─ 读取路径字符串：
           - 短路径：从 din->direct[] 复制
           - 长路径：从数据块读取
```

##### 2.3 同步互斥问题：

##### 2.3.1 问题一：路径字符串读写竞争

- 描述：进程 A 读取软链接内容，同时进程 B 修改软链接
- 解决方案：使用 inode 锁保护读取

```c++
sfs_readlink() {
    struct sfs_inode *sin = vop_info(node, sfs_inode);
    
    lock_sin(sin);              // ← 加锁
    
    size_t len = sin->din->size;
    if (len > bufsz) len = bufsz;
    
    // 读取路径字符串
    if (sin->din->blocks == 0) {
        memcpy(buf, sin->din->direct, len);
    } else {
        sfs_rbuf(sfs, buf, len, sin->din->direct[0], 0);
    }
    
    unlock_sin(sin);            // ← 解锁
    
    return len;
}
```

##### 2.3.2 问题二：循环链接检测

- 描述：链接循环，比如：link1 → link2 → link3 → link1（产生无限循环）
- 解决方案：限制最大跟随深度：

```c++
vfs_lookup_flags() {
    int symlink_depth = 0;
    
    while (symlink_depth < MAX_SYMLINK_DEPTH) {
        // 解析路径...
        
        if (is_symlink && (flags & LOOKUP_FOLLOW)) {
            symlink_depth++;
            
            // 读取目标路径
            vop_readlink(node, target, PATH_MAX);
            
            // 继续跟随
            current_path = target;
        } else {
            break;
        }
    }
    
    if (symlink_depth >= MAX_SYMLINK_DEPTH) {
        return -E_LOOP;  // Too many levels of symbolic links
    }
    
    return 0;
}
```



## 三、实验结论

​	在本次Lab 8的实验中，我们系统地学习了文件系统的基本原理和实现，特别是ucore操作系统中的文件系统结构。实验过程中，我们深入探讨了虚拟文件系统（VFS）如何与具体文件系统（如SFS）交互，并实现了核心文件操作的功能。

### 主要收获：

1. **文件系统结构与工作原理理解**：
   - 理解了文件系统的基本组成，包括超级块、索引节点、目录项和文件对象。学习了它们在文件存储、数据访问和权限控制中的重要作用。
   - 掌握了ucore文件系统的架构设计，尤其是如何通过VFS层整合不同类型的文件系统，让上层应用能够透明地访问底层存储。
2. **功能实现与练习**：
   - 通过具体的编码任务，如实现文件的读写、创建文件和处理路径解析等，加深了对文件操作的实际应用理解。
   - 在实践中，认识到文件系统设计中涉及的同步和互斥机制的重要性，确保在并发环境中数据的安全与一致性。
3. **调试与问题解决能力提升**：
   - 实验过程中遇到的各种问题，如协调并发访问的锁机制，增强了我们的调试能力和解决问题的灵活性。通过分析问题成因并付诸实践，成功实现了功能预期。

​	综上所述，本次实验不仅加深了我们对文件系统的理解，也培养了独立编程和系统思考的能力。未来在学习和操作系统研究中，期望将这些知识运用到更复杂的项目中。

​	本次学期的OS实验到此结束！

