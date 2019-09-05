# process

<img src="..\..\mind mapping\process.png"  style="width: 400px"/>





- 进程首先考虑什么是进程？

  正在运行的程序模型

- 那么进程从哪里来，到哪里去，有什么控制？

  进程从磁盘里，进入内存，由CPU控制

- 设计目标

  基本功能，高效(并发)

那么也就是说，进程这个一个模型，也就是可以说磁盘，内存，CPU共同操作



那么就有了问题：

- CPU资源：由于I/O，操作并不需要CPU，此时我们释放CPU资源并实现调度，实现多个程序的切换，并发操作。
- 内存资源：这个在存储的时候有
- 共享的资源：死锁





[TOC]



## 什么是进程

一个正在运行的程序



如果要问进程的意义，可以编程中函数的概念来解释，一个操作系统可以做很多事，但有的事之间可有有清除的划分界限，那么这样分模块进行，和其他事件就不会互相干扰，对于公共操作的硬件资源也更好分配。

所以进程是**资源分配的最小单位**



那么每一个进程都想达到最大的运行时间，cpu的就需要对进程之间形成调度，来使得每个进程达到最大的效率。



### 进程生活中的 比喻：

Consider a culinary-minded(烹饪头脑) computer scientist who is baking a birthday cake for his young daughter. He has a birthday cake recipe(食谱)  and a kitchen well stocked with all the input: flour, eggs,sugar, extract(提取) of vanilla(香草味的), and so on.

 In this analogy(类比), the recipe is the **program**, that is, an **algorithm**
expressed in some suitable notation(符号), the computer scientist is the processor (**CPU**),
and the cake ingredients(佐料) are the input data. The **process is the activity** consisting of
our baker reading the recipe, **fetching** the ingredients, and baking the cake 



### 进程之间的切换 比喻

Now imagine that the computer scientist’s son comes running in screaming(尖叫) his
head off, saying that he has been stung by a bee. 

The computer scientist **records** where he was in the recipe (the state of the current process is saved), gets out a first aid book, and begins following the directions in it. Here we see the processor being
switched from one process (baking) to a **higher-priority process** (administering
medical care), each having a different program (recipe versus first aid book).
When the bee sting has been taken care of, the computer scientist goes back to his
cake, continuing at the **point** where he left off. 



### 介绍几个概念

- **伪并行**：

  pseudoparallelism，在1秒内能运行不同的程序，但其实对于计算机只运行了一个程序，只是做了不断的切换，而用户发现不了。

- **多处理器**：

  mutilprocesser，拥有多和cpu的电脑，可以操作。

- **进程**

  process，是一个模型，比如一个应用，他囊括了这个引用需要的一切资源，是cpu的一个活动







## 模型状态

进程是计算机操作系统这一层的 model，一种抽象的概念。

进程的构建肯定是依赖程序的，那么对他的操作的对象，一般是：**操作系统，应用，用户， 大型机批处理**，

而要控制进程，那么进程就要有自己的代码，

则进程的结构为：**program**，**data**，**PCB**（Process Control Block 进程控制块 ）





### Create



#### 创建进程的四种情境

- **System initialization**

  操作系统启动时候的初始化，操作系统启动的时候一般会创建两种进程，一种是可视，一种的 **Daemon**（守护进程），如电子邮件，web页面，对于这个词我个人的理解是：**守护当前的计算机能符合它正常运行的进程**

  unix 查看 进程 `PS命令` ，Windows `任务管理器`


- **Execution of a process-creation system call by a running process**

  正在执行的进程创建一个新的进程


- **A user request to create a new process**

  用户要求创建。比如鼠标双击一个启动图标


- **Initiation of a batch(一批) job**

  批处理作业。如：批处理系统。



#### 创建命令

- Unix：fork
- win：CreateProcess



### Termination



#### 停止的四种情境

volunaty：自主性

- Normal exit (voluntary).
- Error exit (voluntary).
- Fatal error (involuntary).
- Killed by another process (involuntary). 





### Hierarchies(层次结构)

- unix 有层次关系，在启动程序的时候，会创建一个init 进程，所以，整个系统都是以init 为根的一棵树。

  >As another example of where the process hierarchy plays a key role, let us look
  >at how UNIX initializes itself when it is started, just after the computer is booted.
  >A special process, called init, is present in the boot image. When it starts running,
  >it reads a file telling how many terminals there are. Then it forks off a new processper terminal 

- win 没有层次关系，在创建子进程的时候，父进程可以获取子进程的句柄

  >The only hint of a process hierarchy is that when a process is created, the
  >parent is given a special token (called a **handle**) that it can use to control the child 



### State

三种状态加一张图

<img src="..\..\images\modern\process_state.png" />

- Running (actually using the CPU at that instant).
- Ready (runnable; temporarily(临时) stopped to let another process run).
- Blocked (unable to run until some external event happens). 



## Process implement

操作系统控制进程这一抽象的模型，通过 **process table**

很容易理解，应为进程需要管理生命周期，那么就要对资源回收，则就需要掌握他的生命周期。

同时因为一个系统中存在多个进程，根据堆栈的原理 ，我们设计一张表来管理process的切换，

以及他们之间的交流，那么就需要 **interrupt vector** (中断向量) 。

> typically at a fixed location near the bottom of memory called the interrupt vector 

### 进程的属性：

<img src="..\..\images\modern\process_table.png" />



### 进程切换步骤

<img src="..\..\images\modern\process_switch.png" />





## Model Multiprograming（多道程序设计模型）

在单核的情况一下，要运行多个应用，则需要考虑程序切换的问题

因为进程的切换也需要时间（如保存状态），如果要使得进程运行达到最大的 **利用率(utilization)**

则会遇到两个问题：

- 进程的空闲的时间
- 停留在内存的时间（包括空闲的时间）

> 由于我们切换进程的目的是，获取cpu的空闲时间，用于其他进程，比如一个应用需要进行 I/O 操作。
>
> 那么由于现实的情况会出现，切换的时候各个程序可能同时等待I/O，这里我们忽略讨论。



要达到效率的最大值，那么我们用 **等待时间 与 停留在内存的时间 的比  p  来描述** 两个值之间应该拥有的时间。

那么有**n (the degree of multiprograming 多道程序设计的道数)** 个进程

那么 可以算出 n 个程序的空闲的概率 $${} p^n $$



#### cpu的利用率

cpu  的利用率， n为进程数，p为 运行时间/在内存停留的时间
$$
CPU \   \  utilization = 1 - p^n
$$







## 并发与调度



调度与并发是两个概念：

- 调度：满足用户的需求而产生的对进程管理（包括执行操作与资源管理操作）。比如：实时系统与分时系统不同产生的调度。

并发



### 通信





### 调度

从父进程、自身、其他进程、I/O 四个角度来考虑	调度是为了解决

- 父进程对子进程的要求
- 自身周期的进行
- 进程对IO等待时，对CPU的释放
- I/O中断



#### 调度目标

算法本身是不能解决所有情况的，所以我们用不同的算法针对性解决调度问题

<img src="..\..\images\modern\scheduling_target.png" />



##### 评判调度的优劣标准

- 吞吐量：单位时间内系统所完成的作业数 
- 周转时间：一个批处理作业从提交时刻开始直到作业完成时刻为止的统计平均时间
- CPU利用率：1-p^n



##### 批处理

- 先来先服务：first come first server，先来先服务
- 最短作业优先：short job first，最短作业优先
- 最短剩余时间优先：shortest remaining time next，最短剩余时间优先



##### 交互式

- 轮转调度：rb，就是每个进程分配同样的时间
- 优先级：优先级高的优先使用
- 多级队列：分成不同层次的列，进行不同优先级的处理。







## 经典IPC





### 生产者/消费者



### 读与写



### 银行家算法



### 哲学家进餐





