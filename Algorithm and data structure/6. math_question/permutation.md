排列组合问题
============

[toc]

这种问题在处理字符串拼接经常遇到，这里详细说一下。

排列组合其实是多种选择的组合情况，由于选择不同导致最终的结果不同。

每次在构造字符串的时候，我们一般做的操作是：

从可选集合中，选择符合要求的数据，追加到现有字符串中，每次只能选择一次

这个可以很明显的看出这是一个多叉树的问题。

但比赛中要注意：不一定是集合，不一定不能重复选择数据。

```java
// words是可选数据项，s是我们形成的结果子串
void combine(String[] words, String s, int index) {
    if (index >= words.length) {
        System.out.println(s);
        return;
    }
    for (int i = index; i < words.length; i++) {
        swap(words, i, index);
        combine(words, s + words[index], index + 1);
        swap(words, i, index);
    }
}
void swap(String[] words, int i, int index) {
    String s = words[i];
    words[i] = words[index];
    words[index] = s;
}
```



