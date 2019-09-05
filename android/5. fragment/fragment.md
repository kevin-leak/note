# Fragment基础

[TOC]

#### fragment 的起源

一句话，为了适配，如Android中平板的适配

##### 简要介绍

A Fragment is a piece of an application's user interface or behavior that can be placed in an `Activity`. 



#### fragment的使用

和 `activity` 的创建差不多，不需要 `AndroidManifest.xml` 中声明，寄生在 activity 中。



##### Sample 效果

<img src="..\picture\fragment_1.png" style="width: 230px; height:360px;" />



一共三个文件

- 类文件：
  - <a href="#2">MainActivity.java</a>
  - <a href="#2">FirstFragment.java</a>
- 资源文件：

  - <a href="#3">activity_main.xml</a>

  - <a href="#3">fragment_first.xml</a>

<a id="1">MainActivity</a>

```java
public class MainActivity extends AppCompatActivity {

    /**
     * fragment 的切换者
     */
    private FragmentTransaction transactor;
    /**
     * 对当前的fragment 进行储存
     */
    private FirstFragment currentFragment;

    @SuppressLint("CommitTransaction")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        transactor = getSupportFragmentManager().beginTransaction();
        if (currentFragment == null) {
            currentFragment = new FirstFragment();
        }
        transactor.add(R.id.fl_container, currentFragment).commit();
        
    }
    
}
```

<a id="2">FirstFragment</a>

```java
public class FirstFragment extends Fragment {

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup 		container,@Nullable Bundle savedInstanceState) {
        super.onCreateView(inflater, container, savedInstanceState);
        View view = inflater.inflate(R.layout.fragment_first, container，null);
        return view;
        
    }
}
```

<a id="4" >activity_main</a>

```xml
<?xml version="1.0" encoding="utf-8"?>
<android.support.constraint.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <!--设置一个fragment的容器-->
    <FrameLayout
        android:id="@+id/fl_container"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content">
    </FrameLayout>

    
</android.support.constraint.ConstraintLayout>
```

<a id="3">fragment_first.xml</a>

```xml
<?xml version="1.0" encoding="utf-8"?>
<android.support.constraint.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    tools:ignore="MissingDefaultResource">

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="这里放置了一个fragment"
        android:textSize="20sp"
        android:textAlignment="center"
        app:layout_constraintHorizontal_bias="0.5"
        app:layout_constraintVertical_bias="0.5"
        tools:ignore="HardcodedText" />

</android.support.constraint.ConstraintLayout>
```



#### FragmentTransaction 的介绍

##### FragmentTransaction 的获取

Interaction(相互作用) with fragments is done through `FragmentManager`, which can be obtained via `Activity.getFragmentManager()` and `Fragment.getFragmentManager()`.



1. 通过activity 获取到当前的 fragment管理者
2. 同时开启fragment 的交换事务
3. 获取到transaction 对象

```java
transaction  = getSupportFragmentManager().beginTransaction();
```



##### 切换的几种方法的介绍

fragment 的切换，是在  `view tree` 与 `fragment  的生命周期之间`  操作

- **replace**：

  触发顺序:

  detach()->onPause()->onStop()->onDestroyView()

  attach()->onCreateView()->onActivityCreated()->onStart()->onResume()

- **commit / commitAllowingStateLoss**：是否activity 保存了状态，再提交，(commit) it will be scheduled as work on the main thread to be done the next time that thread is ready.

- **hide / show** ：只是隐藏于展示

- **remove**：Remove an existing fragment. If it was added to a container, its view is also removed from that container.

- **detach** ：和按了返回键一样的效果，会将fragment 从UI中移除，视图的层次结构会被摧毁，但他的转态依旧由fragmenttransaction保存着 ，可以通过attach恢复。

-  **addToBackStack** ([String](http://www.android-doc.com/reference/java/lang/String.html) name)：回退栈



#### fragment 的通信

activity 获取到对象，直接通信调用方法通信

fragment 之间的通信 同样如此。



#### fragment 的生命周期

生命周期大致分为，四种

- 运行：如果fragment 可见，我们则称，它是运行的

- 暂停：当activity 出现了暂停的情况（由不可见的activity替换）， fragment也同时被暂停。

- 停止：如果被停止，那么有可能被activity 回收

  ​	有两种情况

  1. 寄宿的 activity 停止

  2. FragmentTransaction 对象 使用了 remove， replace，将碎片从activity 中移除

     但并没有使用 addToBackStack 那也，将停止。

- 销毁：类似停止。





##### fragment 生命周期接口图



<img src="..\picture\fragment_lifecycle.png" style="width: 230px; height:600px;" />





##### 周期实验方法

通过在不同的接口中打log， 在通过活动观察。





#### fragment 的数据存储

**public void onSaveInstanceState (Bundle outState)**

Added in [API level 11](http://www.android-doc.com/guide/topics/manifest/uses-sdk-element.html#ApiLevels)

Called to ask the fragment to save its current dynamic（动态） state, 

so it can later be reconstructed in a new instance of its process is restarted. If a new instance of the fragment later needs to be created, the data you place in the Bundle here will be available in the Bundle given to `onCreate(Bundle)`,`onCreateView(LayoutInflater, ViewGroup, Bundle)`, and `onActivityCreated(Bundle)`.

This corresponds(呼应) to `Activity.onSaveInstanceState(Bundle)` and most of the discussion there applies here as well. Note however: *this method may be called at any time before onDestroy()*. There are many situations where a fragment may be mostly torn(撕毁) down (such as when placed on the back stack with no UI showing), but its state will not be saved until its owning activity actually needs to save its state.

**Parameters**

outState		  Bundle in which to place your saved state.



#### fragment 处理 适配问题

[fragment 资源文件 的配置](http://www.android-doc.com/guide/topics/resources/providing-resources.html#AlternativeResources)

如果要适配，平板和手机，我们可以在 `res` 下建立 `layout-large`， 命名为Android同样的资源文件名

或者 `layout-sw600dp` 指定一个 small width



## 官网api

http://www.android-doc.com/reference/android/app/Fragment.html