# Flutter_Image组件

## 加载远程图片

```dart
//ImgUrlStu
class ImgUrlStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 900,
      color: Colors.red,
      child: Image.network(
        "https://img-blog.csdnimg.cn/20200709133813183.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0tpbW1LaW5n,size_16,color_FFFFFF,t_70",
        alignment: Alignment.center, //设置居中
        color: Colors.blue,
        colorBlendMode: BlendMode.screen, //和color一起使用，设置混合色
        fit: BoxFit.cover, //cover自适应 ,fill充满屏幕,fitWidth横向充满
        repeat: ImageRepeat.repeat, //平铺repeat双轴平铺
      ),
    );
  }
}
```

## 圆角图片

>方法一 ：Container容器

```dart
//ImgUrlStu
class ImgUrlStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
              image: NetworkImage(
                  "https://img-blog.csdnimg.cn/20200709133813183.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0tpbW1LaW5n,size_16,color_FFFFFF,t_70"),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(150))),
    );
  }
}
```

>方法二:ClipOval 组件

```dart
//ImgUrlStu
class ImgUrlStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: ClipOval(
        child: Image.network(
          "https://img-blog.csdnimg.cn/20200709133813183.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0tpbW1LaW5n,size_16,color_FFFFFF,t_70",
          width: 10,
          height: 10,
        ),
      ),
    );
  }
}
```

## 本地图片

>创建images文件夹
>创建`2.0x`,`3.0x`,`4.0x`文件夹2.0x,3.0x是必须的
>配置`pubspec.yaml`文件配置assets将图片都配置进去

```dart
//ImgUrlStu
class ImgUrlStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Image.asset('images/test.jpg'),
    );
  }
}
```
http://lorempixel.com/640/480/business