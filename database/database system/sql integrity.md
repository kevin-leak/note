# integrity			

[TOC]



## primary null

创建表

```sql
CREATE TABLE Student(
    Sno CHAR(9) PRIMARY KEY,
    Sname CHAR(20) NOT NULL,
    Ssex CHAR(2),
    Sage SMALLINT,
    Sdept CHAR(20)
);

CREATE TABLE SC(
    Sno CHAR(9) NOT NULL,
    Cno CHAR(4) NOT NULL,
    Grade SMALLINT,
    PRIMARY KEY (Sno,Cno)，
    FOREIGN KEY (Sno) REFERENCES Student(Sno),
    FOREIGN KEY (Cno) REFERENCES Course(Cno)，
);

CREATE TABLE Student(
    Sno CHAR(9),
    Sname CHAR(20) NOT NULL,
    Ssex CHAR(2),
    Sage SMALLINT,
    Sdept CHAR(20),
    PRIMARY KEY(Sno)
);
```

注意

- Sno CHAR(9) PRIMARY KEY		// 列级约束

- Sname CHAR(20) NOT NULL

- PRIMARY KEY (Sno,Cno)，// 表级约束

  FOREIGN KEY (Sno) REFERENCES Student(Sno)



## check

### 建表时候创建

表达式写法如下：

1.[字段名] > number1 AND [字段名] < number2

2.[字段名] > number1 OR [字段名] < number2

3.[字段名] = ‘M’ AND [字段名] = 'F'

```sql

```



```sql

```



### 建表后添加

```sql
ALTER TABLE <table name>
WITH NOCHECK ADD CONSTRAINT <constraint name>
CHECK (字段名 > num1 and 字段名 < num2);
```

补充：可以写成这种          

```sql
ALTER TABLE <table name>
WITH NOCHECK ADD CONSTRAINT <constraint name>      
CHECK (字段名 in ('值1','值2','值3'));
```



## 字段约束

一、修改字段默认值

```sql
------说明：删除表的字段的原有约束
alter table <table name> drop constraint <constraint name>   

 -------说明：添加一个表的字段的约束并指定默认值
alter table <table name> add constraint <constraint name> 
DEFAULT <default value> for <column>

```

二、修改字段名：

```sql
alter table <table name> rename column <old name> to <new name>
```

三、修改字段类型：

```sql
alter table <table name> modify column UnitPrice decimal(18, 4) not null 
```

三、修改增加字段：

```sql
alter table <table name> ADD <column name> <type> NOT NULL Default 0
```





## unique

创建

```sql
create unique  index <index name> on <table name>(cloum name)
```

修改

```sql

```

删除

```sql
drop index <index name>
```

