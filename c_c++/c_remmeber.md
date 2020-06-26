C/C++
=====

[toc]



内存模型
--------

这里贴一篇文章：[深入理解C语言内存管理](https://www.cnblogs.com/tuhooo/p/7221136.html)

- 可执行内存分类：Code，Data，BBS

  - Code ：代码区，存放CPU执行的机器指令（machine instructions），有时被叫做 文本段
  - BBS ：Block Started By Symbol，存入的是全局未初始化变量，且会被内核初始化为0或者null
  - Data ：数据区，通常还被划分为：全局区，文字常量区
    - 全局区：初始化了的全局变量，初始化了的静态变量（局部静态和全局静态）
    - 文字常量区：存放常量数据，比如说字符串

- 运行时内存分类：Stack，Heap

  - Stack：栈区，存储函数信息以及函数中局部变量，由编译器自动释放。有大小限制一般是1-4M，特别的：alloca，在栈申请内存,因此无需释放. 地址从高到底

  - Heap：堆区，由开发者申请内存并释放。 地址从底到高

    - 堆内存的分配

      - malloc：系统不会初始化，一般用memset来初始化，用free来释放

      - calloc：申请内存并将初始化内存数据为null.

      - ralloc：对malloc申请的内存进行大小的调整.

        ```C
          char *a = (char*)malloc(10);
            realloc(a,20);
        ```

- 内存分布之间的映射：mmap，brk(sbrk)

  <img src="./images/memory_maclloc.png" style="zoom:80%;" /> 

指针问题
--------

- void* 代表指针地址存储的类型可以多种。 C语言规定只有相同类型的指针才可以相互赋值 void* 指针作为左值用于“接收”任意类型的指针, void* 指针作为右值赋值给其它指针时需要强制类型转换

- 数据类型本质是固定内存大小的别名。大小计算用sizeof，数据类型的封装一般我们使用void *

- 函数指针：

  代码

  ```c
    typedef int (* callBack)();
    void steal(callBack c){ printf("我在偷东西\\n"); c();}
    int catch(){ printf("抓捕你");}
    int main() {
        steal(&catch);
        return 0;
    }
  ```

- **const 与 指针**

  和java对比，const = final

  ```c
    const char *：修饰值
    char const *：修饰值
    char * const：修饰指针
    char const * const：同时修饰值和指针
  ```



结构体
------

### 结构体的声明与初始化

第一种方式

```c
struct SqList {
    int *base;
    int length;
} kevin; // kevin 为变量
struct SqList leak; // leak 为变量，必须带上struct
```

第二种方式

```c
typedef struct  {
    int *base;
    int length;
} SqList;
SqList leak;
```

### 内存分配

铁律1: 每个结构体成员的起始地址为该成员大小的整数倍，即int型成员的其实地址只能为0、4、8等

铁律2: 结构体的大小为其中最大成员大小的整数倍

1. 数据类型自身对齐：数据类型的起始地址为其大小的整数倍
2. 结构体的自身对齐：结构体的自身对齐值为其中最大的成员大小
3. 指定对齐：可以使用关键词#pragma pack(1) 来指定结构体的对齐值
4. 有效对齐值：有效对齐值为自身对齐值与指定对齐值中较小的一个。（即指定对齐值超过自身对齐值无意义）



查缺补漏
--------

### 静态变量和普通变量







## 问答

- c 中静态变量的性质？

- extern关键字的理解？

- 自动变量？

- malloc，calloc，realloc，free

- union关键字？

- 强制类型转换？

- 变量：全局，局部静态，寄存器变量，自动变量，全局局部变量

- 文件包含，宏定义，条件编译？

- 内存类别，Block Started by Symbol是指？

- 静态变量和全局变量的区别？

- c的内存分布？以及空间申请？

- 内存泄漏：申请的内存一直申请不释放。

  野指针：占用别的程序申请的内存。

- inline函数？

- **存储类型**

  对于一个变量而言有三个性质：存储周期，作用域，链接数(程序变量的共享范围)。

  一个变量的修饰分为 存储类型、类型限定符、类型说明符

  存储类型涉及到存储周期问题，限定符就两个(const、volatile）

  贴一片文章：[c语言关键字存储类型讲解(auto,extern,static,register,const)](<https://blog.csdn.net/as480133937/article/details/88539716>) 

  写的很详细，可以先看这篇文章。

  <table>
      <tr>
          <td style="text-align:center"><a href="#td1"> extren  </a></td>
          <td style="text-align:center"><a href="#td2"> static </a></td>
          <td style="text-align:center"><a href="#td3"> auto </a></td>
          <td style="text-align:center"><a href="#td4"> register </a></td>
      </tr>
  </table>

  <a id="td1"> extren</a> 

  外部变量，用来跨文件引用变量。

  ```c
  // 头文件中，不可以重复定义。
  extren int k;
  
  // 实用函数中
  k = 0;
  ```

  如果两个头文件中都定义了外部变量，则会出错。

  <a id="td2"> static</a> 

  修饰的变量随着文件的借书而结束，并不是整个程序。

  1. **static全局变量与普通的全局变量有什么区别 ?**

  ```
  这两者在存储方式上并无不同。
  全局变量(外部变量)的说明之前再冠以static 就构成了静态的全局变量。
  全局变量本身就是静态存储方式， 静态全局变量当然也是静态存储方式。 
  
  
  这两者的区别在于 非静态全局变量的作用域是整个源程序 ， 当一个源程序由多个源文件组成时，非静态的全局变量在各个源文件中都是有效的。 而静态全局变量则限制了其作用域， 即只在定义该变量的源文件内有效， 在同一源程序的其它源文件中不能使用它。由于静态全局变量的作用域局限于一个源文件内，只能为该源文件内的函数公用，因此可以避免在其它源文件中引起错误。
  static全局变量只初使化一次，防止在其他文件单元中被引用; 　
  ```

  2.  **static局部变量和普通局部变量有什么区别 ？**

  ```
  把局部变量改变为静态变量后是改变了它的存储方式即改变了它的生存期。把全局变量改变为静态变量后是改变了它的作用域，限制了它的使用范围。 
  
  static局部变量只被初始化一次，下一次依据上一次结果值； 
  ```

  3.  **static函数与普通函数有什么区别？**

  ```
  　　 static函数与普通函数作用域不同,仅在本文件。只在当前源文件中使用的函数应该说明为内部函数(static修饰的函数)，内部函数应该在当前源文件中说明和定义。对于可在当前源文件以外使用的函数，应该在一个头文件中说明，要使用这些函数的源文件要包含这个头文件.
  ```

  <a id="td3"> auto</a>

  被修饰变量自动回收，只对块状代码修饰有效，不常用局部变量就是隐藏的修饰。

  <a id="td4"> register  </a>

  放在寄存器中，我还么没有感受到他的作用。

- **函数指针变量**

  ​     一个数据变量的内存地址可以存储在相应的指针变量中，函数的首地址也以存储在某个函数指针变量中。这样，我就可以通过这个函数指针变量来调用所指向的函数了。

  ​     在C系列语言中，任何一个变量，总是要先声明，之后才能使用的。函数指针变量也应该要先声明。

  ​     函数指针变量的声明：

  ~~~c
  typedef int (* callBack)();
  void steal(callBack c){ printf("我在偷东西\n"); c();}
  int catch(){ printf("抓捕你");}
  int main() {
      steal(&catch);
      return 0;
  }
  ~~~

   

  

  


