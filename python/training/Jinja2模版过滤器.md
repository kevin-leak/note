# Jinja2模版过滤器

过滤器是通过管道符号（`|`）进行使用的，例如：`{{ name|length }}`，将返回name的长度。过滤器相当于是一个函数，把当前的变量传入到过滤器中，然后过滤器根据自己的功能，再返回相应的值，之后再将结果渲染到页面中。`Jinja2`中内置了许多过滤器，在[这里](http://jinja.pocoo.org/docs/dev/templates/#builtin-filters)可以看到所有的过滤器，现对一些常用的过滤器进行讲解：

- `abs(value)`：返回一个数值的绝对值。 例如：`-1|abs`。

- `default(value,default_value,boolean=false)`：如果当前变量没有值，则会使用参数中的值来代替。`name|default('xiaotuo')`——如果name不存在，则会使用`xiaotuo`来替代。`boolean=False`默认是在只有这个变量为`undefined`的时候才会使用`default`中的值，如果想使用`python`的形式判断是否为`false`，则可以传递`boolean=true`。也可以使用`or`来替换。

- `escape(value)或e`：转义字符，会将`<`、`>`等符号转义成HTML中的符号。例如：`content|escape`或`content|e`。

- `first(value)`：返回一个序列的第一个元素。`names|first`。

- `format(value,*arags,**kwargs)`：格式化字符串。例如以下代码：

  ```html
    {{ "%s" - "%s"|format('Hello?',"Foo!") }}将输出：Helloo? - Foo!
  ```

- `last(value)`：返回一个序列的最后一个元素。示例：`names|last`。

- `length(value)`：返回一个序列或者字典的长度。示例：`names|length`。

- `join(value,d=u'')`：将一个序列用`d`这个参数的值拼接成字符串。

- `safe(value)`：如果开启了全局转义，那么`safe`过滤器会将变量关掉转义。示例：`content_html|safe`。

- `int(value)`：将值转换为`int`类型。

- `float(value)`：将值转换为`float`类型。

- `lower(value)`：将字符串转换为小写。

- `upper(value)`：将字符串转换为小写。

- `replace(value,old,new)`： 替换将`old`替换为`new`的字符串。

- `truncate(value,length=255,killwords=False)`：截取`length`长度的字符串。

- `striptags(value)`：删除字符串中所有的HTML标签，如果出现多个空格，将替换成一个空格。

- `trim`：截取字符串前面和后面的空白字符。

- `string(value)`：将变量转换成字符串。

- `wordcount(s)`：计算一个长字符串中单词的个数。