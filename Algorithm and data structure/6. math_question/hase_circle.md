判断链表是否有环
================

[toc]

最为主要的是：这个怎么思考？

判断一个东西是否存在，首先要判断你找出来的东西是不是，也就是区分普通链表和带环链表。

没有环的链表就是线性的，你要判断两个东西不是同一个东西，你要通过测试来展现出他们各自特点。

环的特点和直线的特点是什么？？？？

- 环没一定没有终点，路会重复走（起点和终点一直）
- 直线不一定有终点，路不会重复走（计算机中普通链表是有重点，但是如果有环你无法判断是否当前是终点）
- 曲率在链表中不存在。



解决方案：

- 长度：如果链表长度已知，遍历长度就行

- 重复：如果长度不明确，但节点数据不重复，就通过这个性质重复去判断；

  ​			如果节点数据可能重复，就通过hash判断；

- 终点：快慢指针，利用速度来判断，不同速度，直线只会在终点相遇一次，而如果是环则会相遇无数次。



为什么快慢指针可以做到？？？？

如果node的节点足够多，那么将node抽象为位置的话，抽象的表现就是一个圆。

如果你硬要不是圆，是直接的地址转换，那么可以这么理解，可定有个点的转动都是360度。

因为是圆，额，为什么圆就可以，直线就不可以？？？？

两个点的相遇与路程没有关系，只和位移有关系，

快慢代表着速度，速度是矢量的，导致x轴和y轴上的轴，出现循环的变化

