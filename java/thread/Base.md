#### 线程与进程

线程：cpu调度的最小单位

进程：资源分配的最小单位

线程分为核心线程和用户线程，线程也被称为轻量级进程，java中我们建立的线程是用户线程。

<span style="background-color: #F9B6E5; padding:0px 3px; margin:2px; border-radius:3px ">多线程就是拥有多个时钟周期(计算机执行的周期)的权利</span> 

##### 进程与线程区别

很好理解：进程创建需要很多内存数据的记录信息(PCB)，而线程的创建主要是为了CPU调度，耗时操作，对数据的依赖小。

1. 定义方面：进程是程序在某个数据集合上的一次运行活动；线程是进程中的一个执行路径。（进程可以创建多个线程）
2. 角色方面：在支持线程机制的系统中，进程是系统资源分配的单位，线程是CPU调度的单位。
3. 资源共享方面：进程之间不能共享资源，而线程共享所在进程的地址空间和其它资源。同时线程还有自己的栈和栈指针，程序计数器等寄存器。
4. 独立性方面：进程有自己独立的地址空间，而线程没有，线程必须依赖于进程而存在。
5. 开销方面：进程有自己的独立地址空间，每启动一个进程，系统就会为它分配地址空间，建立数据表来维护代码段、堆栈段和数据段，这种操作非常昂贵。 而线程是共享进程中的数据的，使用相同的地址空间，因此CPU切换一个线程的花费远比进程要小很多，同时创建一个线程的开销也比进程要小很多。

[进程与线程 PCB TCB](https://blog.csdn.net/github_36487770/article/details/60144610) 

##### 多线程

需要解决：宏观与微观、微观与微观的操作问题。

- 宏观的原子可能是多个微观的组合，需要标明限制，以便更好的描述和组织宏观现象。

- 不通过微观操作时间顺序会带来，不同的宏观现象。

  因为宏观现象有自己的组织结构，程序有顺序结构，选择结构，循环结构。

- 宏观原子之间包裹的微观操作可能出现交叉操作



线程操作性质：指的是我们在线程之间数据切换，要保证数据的正确性时，经常需要满足的性质。

- 原子性：在操作过程中，不可以在修饰的地方打断
- 有序性：保证修饰的代码块，不会被指令重排
- 可见性：保证各个操作的线程，可以立即知道被修饰的数据的变化。



原子性：解决宏观到微观的认知问题，我们认为的一次性操作，在计算机的微观世界需要几步。

有序性：虚拟机为了优化程序操作，指令重排带来的问题，但往往宏观要求有序。

可见性：多线程有内副本，为了数据同步的操作



多个微观操作处理宏观上的一个整体。

这个宏观上的整体的组织可能事有序的，也这就需要微观进行有序的操作，也就我们说的有序性。

对于我们编程人员来说，只有微观操作达到一定的量的时候，才具有显示意义，也就是说原子性

拿java来说，jvm就是做了这么一个操作：机器指令-->字节码文件-->java文件。

可见性，就是为了在不同的微观操作通一个内存数据的时候，需要相互间进通信。





#### 线程状态

阻塞：就是发起请求不会得到有效的回应，但是会不断的请求，请求时间间隔可自定义。

锁：就是一种标记，标记当前对象是否可被持有

##### 性能问题

1. 并不是线程越多越好，这涉及到线程的切换消耗问题
2. 锁空间的粒度问题，细化粒度，减少锁的持有时间。
3. 减少锁请求的次数



##### 锁分类

锁分类也是锁的设计原则问题？

- 锁内又有锁，一把钥匙是否可以全部打开？
- 对于与锁，是否只有一把钥匙？
- 同一个物体，不同位置是否有不同的锁？
- 同时开启锁，是否有优先级分别？
- 等待通知再竞争锁，还是不断轮询获取锁，轮询时间？

**常见的例子**

可重入锁：锁内又有锁

```java
synchronized void setA() throws Exception{
    Thread.sleep(1000);
    setB();
}
synchronized void setB() throws Exception{
    Thread.sleep(1000);
}
```

共享锁/独享锁：独享锁与共享锁是通过AQS来实现的

- ReentrantLock、Synchronized独享锁
- ReadWriteLock，读取是共享

分段锁：ConcurrentHashMap

公平锁/非公平锁：Synchronized是公平锁，ReentrantLock是AQS调度无法保证公平

偏向锁/轻量级锁/重量级锁：

内置锁是JVM提供的最便捷的线程同步工具，在代码块或方法声明上添加synchronized关键字即可使用内置锁。

[浅谈偏向锁、轻量级锁、重量级锁](https://monkeysayhi.github.io/2018/01/02/浅谈偏向锁、轻量级锁、重量级锁/) 

[让你彻底理解Synchronized](https://www.jianshu.com/p/d53bf830fa09) 

[【基本功】不可不说的Java“锁”事](https://mp.weixin.qq.com/s?__biz=MjM5NjQ5MTI5OA==&mid=2651749434&idx=3&sn=5ffa63ad47fe166f2f1a9f604ed10091&chksm=bd12a5778a652c61509d9e718ab086ff27ad8768586ea9b38c3dcf9e017a8e49bcae3df9bcc8&scene=21#wechat_redirect) 