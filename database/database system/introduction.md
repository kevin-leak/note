

# introduction

<img src="..\mind mapping\database system.png" />

解读：从三个方面讲数据库系统，由外到内，与系统关系 ---> 从现实中剥离模型 ---> 转化为数据库系统结构

**特性**的分析主要是从这几个对象：数据，操作系统与硬件，DBA，应用程序。

- 数据多样化，我们需要将数据结构化储存给计算机可以认识的**数据**，这就涉及到如何描述数据，以怎样的方式来存储，则建立**数据模型**（关系模型）。

- 物理独立性

   指用户的应用程序与数据库中数据的物理存储是相互独立的。当数据的物理存储改变了，应用程序不用改变。

- 逻辑独立性

  指用户的应用程序与数据库的逻辑结构是相互独立的。 数据的逻辑结构改变了， 应用程序不用改变。数据独立性由数据库管理系统的二级映像功能来保证  

[TOC]



### 术语以及系统层次

一般在不会引起混淆时，常常把数据库系统、数据库管理系统简称为数据库

术语中 数据管理系统是操作系统之上的应用，而数据库 指的是数据文件物理结构，是在操作系统之下的应用。

<img src="..\images\database_level.png" style=" height:360px;" />

#### 术语

<table>
    <tr>
        <td> <a href="#td1">数据 data </a></td>
        <td> <a href="#td2">数据库 database </a></td>
        <td> <a href="#td3">数据库管理系统 DBMS </a></td>
        <td> <a href="#td4">数据系统 DBS </a></td>
    </tr>
</table>
#### 系统层次（图）

<img src="..\images\gradation.png" style=" height:360px;" />



<a id="td1"> 数据 data ：</a>

- 描述数据的符号，称为数据

- 数据的解释，称为语义




<a id="td2">数据库 database： </a>

简称 DB

- 长期储存在计算机、有组织的、可共享的、大量数据的**集合**。
- 较小的冗余度（redundancy）
- 较高的独立性（data independence）
- 易扩展 （scalability）



<a id="td3"> 数据管理系统 DBMS：</a>

Database Management System

和计算机操作系统一样，是计算机的基础软件。

位于用户与数据库系统之间的**管理软件**



<a id="td4">数据库系统 DBS ：</a>

Database System

由数据库（数据的集合）、数据库管理系统（Mysql）、应用程序（）、数据库管理员（Database System，DBS)

组成的储存、管理、处理和维护数据的**系统**。



### 数据库模型——data model                                

#### 模型层次图（图）

<img src="..\images\data_model.png" style=" height:360px;" />



#### 概念模型

为了建立数据模型，我们需要根据数据的特性， 对现实世界的事物进行区分

一般我们用 **E-R 图**建立概念模型

##### 描述自己

- entity：实体

- attribute：属性

- key：码，键


##### 描述自己与群体

- entity type：实体类型

- entity set：实体集


##### 描述自己与另外的实体

- relationship：关系



##### 实际生活解读：

<p style="color: #458B74">
    读书的小明（entity），<br/>
    具有性别、年龄的属性（attribute），<br/>
    标识有身份证（key)，<br/>
    都是人这种类型（entity type), <br/>
    在全体学生这一集合（entity set），<br/>
    与老师是师生关系（relationship）<br/>
</p>


#### 数据模型

三要素：数据结构、数据操作、数据完整性约束



- 层次：一颗倒立的大树，例如：一个系下面是教研室，教研室下面是教员。

- 网状：随便联

- 关系：以关系来描述。

  数据结构

  - relation name : 表名
  - relation：表
  - tuple：记录，行
  - attribute：属性，列
  - key：主键
  - domain：相同类型的集合
  - subvector：分量，一个记录的一列值
  - schema：模式，全体逻辑特征和结构的描述， 与之对应的是Instance



### 系统结构——三级模式

- 模式：数据库中全体数据的逻辑结构和特征的描述
- 外模式：模式的子集，用户数据的逻辑结构和特征
- 内模式：物理结构和存储方式的描述

就有点类似，一个server中，建立一个数据库，我们书写操作数据库的语句，这里面对对数据的操作是全局的（**模式**），而用户比如说一个app用户访问的个人数据就是（**外模式**），像索引以怎么样的方式建立（B+树，hash树）的建立就是内模式需要处理的事情。



设置三级模式的目的是分层，可以更好的设置保护机制，以及操作之间的分理



#### 模式结构（图）





<img src="..\images\app_database.png" style=" height:360px;" />





<img src="..\images\database_mode.png" style=" height:360px;" />

