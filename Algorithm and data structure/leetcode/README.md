### 快速幂

参考：https://oi-wiki.org/math/quick-pow/

```java
public int quickPower(int x, int y){
    int cnt = x, ans = 1;
    while(y > 0){
        if((y & 1) == 1) ans *= cnt;
        cnt *= cnt;
        y >>= 1;
    } 
    return ans;
}
```



### 数组扩容

```java
/**
 * 扩容
 */
private void enlargeCapacity() {
    capacity += 10;
    ans = Arrays.copyOf(ans, capacity);
}

/**
 * 删除数组多余空间
 */
private void changeCapacity(int retCapacity) {
    ans = Arrays.copyOf(ans, retCapacity);
}

```

