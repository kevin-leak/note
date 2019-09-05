# Mysql architecture and history

- To get most form mysql, you need to understand its design so that you can work with it, not against it.
- MySQL's  most unusual and important feature(特征) is its storage-engine architecture, whose design separates query processing and other server tasks from data storage and retrieval(恢复), this separations of concern lets you choose how your data is stored and what performance, features, and other  characteristics you want.

- **this chapter provides a high-level overview of the MySQL server architecture, the major differences between the storage engines, and why those differences are important.**



----

[TOC]

----



#### MySQL's Logical Architecture

this is a mental picture of how mysql's components work together

![1.server architecture](..\images\1.server architecture.png)

- **The topmost layer**：It's  contains the services that are't unique to mysql. They're services most network-based client/server tools or servers need: `connection handling, authentication, security, and so forth.`
- **The second layer**：It'is the brain of mysql , which is including the code for query parsing, analysis, optimization,caching , and all the build-in functions(e.g dates, time, math, and encryption), Any functionality provided across storage engines lives at this level: `stored procedures(过程) , triggers, and views for example.`
- **The third layer**: it's contains the storage engines. `They are responsible for storing and retrieving all data stored "in" MySQL.` 





#### Connection Management and Security

- Each client connection gets its `own thread` within the server process
- The connection's queries execute within that single thread, which `in turn resides on one core or CPU`
- The caches threads , so they `don't need to be created and destroyed` for each new connection.
- Connect the mysql server need to `authenticate` with usename, originating host, and password. X.509 certificates can also be used across SSL (Secure Socket Layer) connection.once a client has connected , `the server verifies whether the client has privileges(特权) for each query it issues`



#### Optimization and Execution

- Mysql parses queries to create an internal structure (the prase tree), and then applies a variety of optimizations.
- the optimizer does not really care what storage engine a particular table uses, but storage engine does affect how the server optimizes the query.
- Before even parsing the queries, though , the server consults the query cache, which can store only SELECT statements , along with their result sets.



#### Concurrency Control （并发控制）

For our purposes in this chapter, MySql has to do this at tow levels： 

- the server  level
- the storage level

In this note , just to give a overview of how mysql deals with concurrent readers and writers.



#### Read/Write Locks



#### 

