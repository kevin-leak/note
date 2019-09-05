# Thread

[TOC]



## 简介

在一个进程中，一个应用在执行某件事情的时候，部分是要进行I/O。如果因为部分操作而使得整个应用等待，那么用户体验就不好，比如word 修改一个字，而全体更新，所有我们需要一个类似于线程 的程序帮我们调用CPU

执行不需要I/O条件的事情。

这个 **CPU的最小调用的单位就是 线程**



根据并行的需求我们所需要

### 线程的能力

- the ability for the parallel entities to share an address space and all of its data
  among themselves.  

- A second argument for having threads is that since they are lighter weight than
  processes, they are easier (i.e., faster) to create and destroy than processes. 

  通常情况先，线程是进程创建速度的10-100倍

- A third reason for having threads is also a performance argument 

  当所有的线程运行的都消耗的是CPU 的资源时候（称为**密集型**），性能并不会得到提升，如果有些是I/O操作，那么本来应该阻塞的进程，可以并行处理。





### 例子

<img src="..\..\images\modern\thread_example.png" />



一个简单的例子吧，web服务器。

当不同的用户访问一个web页面，对于服务器肯定要实现并行，不能让用户排队访问这个页面吧

那么当用户第一次连接上的时候，服务器就会有个 **dispatch thread**，对于每一次的访问开一个线程。

由于用户的访问时频繁的，为了避免去磁盘里面去数据，那么一般操作系统会将数据存放在**cache**中。

那么当用户下次访问的时候，服务器就会启动原来启动的线程，来操作cache 中的数据。



配上代码

```c
// dispatch thread
while (TRUE) {
    get_next_request(&buf); 
    handoff_work(&buf); 
} 

// work thread
while (TRUE) {
    wait_for_work(&buf);
    look_for_page_in_cache(&buf, &page);
    if (page_not_in_cache(&page))
        read_page_from_disk(&buf, &page);
    return page(&page);
}
```





## Thread Model



### 进程与线程的区分

进程模型包括两个东西，一个是 **resource**，一个是 **excution**。

- resource：这些资源包括这个进程所需要用到的磁盘资源，子程序，进程自身的状态。
- excution：这个词是执行的意思，有点懵逼，理一下是，进程模型本来掌管着资源接收外界对象的操作，并且执行对资源的相应反应，而执行指令的就是**Thread**



总结一下就是：**Processes are used to group resources together; threads are the entities**
**scheduled for execution on the CPU** 



> The process model is based on two independent concepts: resource grouping and execution.
>
> The other concept a process has is a thread of execution, usually shortened to just thread  



线程和进程不同，独立性没有进程高，这也很好理解，本来线程就是设计来在进程中调用，处理一个进程里的调度

>What we are
>trying to achieve with the thread concept is the ability for multiple threads of execution to share a set of resources so that they can work together closely to perform some task. 



有了线程，就要考虑，线程是由谁控制。

- 内核
- 进程



## POSIX thread（可移植的线程接口）

portable  oprating system interface ：可以一直的操作系统接口。

操作系统统一调用线程的接口是函数包**PThread**，带有的方法有：

<img src="..\..\images\modern\PThread_func.png" />

强调几个方法：

Pthread_create：会返回一个表示，在unix 中 叫 **PID** (Pthread identify)

Pthread_attr_init：初始化线程的各个属性，并且赋予初始值，比如 **priority**







## implement thread

实现线程，肯定要考虑到一个掌控权，那么就有两个角色

- 进程
- CPU

则有三种实现方式：

- implement in user place
- implement in kernel
- hybrid implement



很明显由这张图可以看出，两者差别在：run-time system 是否由谁控制，thread table 由谁管理

分别说一下优缺点，来确定使用哪种方案。

<img src="..\..\images\modern\create_thread_ways.png" style="width: 400px; "/><img src="..\..\images\modern\hybrid_implementations.png" style="width: 300px" />



#### 用户态比和心跳的优点

进程与CPU，切换资源消耗，启动消耗，回收的消耗。

- 把进看做一个整体，那么相当于当线程操作，这样这种系统可以在支持单核的CPU上运行

- 切线程，就相当于遍历一个栈，那么处于用户态的消耗肯定会更小

  >Doing thread switching like this is at least an order of magnitude—
  >maybe more—faster than trapping to the kernel and is a strong argument in favor
  >of user-level threads packages. 

- 当线程进行切换，启动另外一个线程的时候，run-time 维护的线程消耗的时间更短，不用进行上下文切换。

  >Among other issues, no trap is needed, no context switch is needed, the memory cache need not be flushed, and so on. This makes thread scheduling very fast. 

- 可以自定义各种操作线程的方法，比如线程的回收机制。



#### 用户态比核心态的缺点

- 不好实现阻塞式系统调用，用户态的线程的调用需要通过系统调用请求和心态权限，但会停止所有的线程、
  - 改成非阻塞式的系统调用
  - 
- 













