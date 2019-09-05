## practise

[TOC]



## problem



### query

```
1. 查询年龄20岁（含）以上的男生的学号和姓名。
2. 查询每位选课学生的姓名、选修课程名和成绩。
3. 查询所有学生的姓名、选修课程名和成绩。
4. 查询与李勇在同一个系的学生信息。
5. 查询CS系的学生学号、姓名、年龄，并按年龄降序排列。
6. 查询所有学生选课获得的总学分。
7. 查询选修课程的课程号、课程名和平均成绩。
8. 查询没有选修数据库课程的学生学号和姓名。
9. 查询李姓学生的学号、姓名、性别和所在系信息。
10.查询总学分超过8个学号和学分。
11.查询成绩大于各门课程平均成绩的所有学生的学号、课程号和成绩。
12.查询和刘晨同龄学生的学号和姓名。
13.查询选修了2号和3号课程的学生学号及姓名。
14.查询没有选修1号课程的学生学号及姓名。
15.查询没有先修课程的课程号和课程名。
```



### 表代码

```mysql
--- 创建学生表
create table student(
	Sno int not null auto_increment primary key,
	Sname char(10),
	Ssex enum('男', '女'),
	Sage tinyint,
	Sdept varchar(10)
);

--- 创建课程表
create table Course(
	Cno int  not null auto_increment primary key,
	Cname varchar(10) not null,
	Cpno tinyint,
	Ccredit tinyint
);

--- 创建课程成绩表
create table SC(
	Sno int not null,
	Cno int not null,
	Grade tinyint,
	constraint fk_student foreign key (Sno) references student(Sno),
	constraint fk_course foreign key (Cno) references Course(Cno)
);

--- 插入数据
	--- student插入数据
	insert into student (Sno, Sname, Ssex, Sage, Sdept) values (201215121, '李勇', '男', 20, 'CS');
	insert into student (Sname, Ssex, Sage, Sdept)
	values ('李晨', '女', 19, 'CS'),('王敏', '女', 18, 'MA'),('张立', '男', 19, 'IS');
	--- course插入数据
	insert into Course (Cname, Cpno, Ccredit) 
	values ('数据库', 5, 4),
		   ('数学', null, 2),
		   ('信息系统', 1, 4),
		   ('操作系统', 6, 3),
		   ('数据结构', 7, 4),
		   ('数据处理', null, 2),
		   ('PASCAL语言', 6, 4);
	--- SC插入数据
	insert into SC(Sno, Cno, Grade) values ('201215121', 1, 92);
	insert into SC(Sno, Cno, Grade) values ('201215121', 2, 85);
	insert into SC(Sno, Cno, Grade) values ('201215121', 3, 88),('201215122', 2, 90);
	insert into SC(Sno, Cno, Grade) values ('201215122', 3, 80);

```



### 查询代码

```mysql

```



