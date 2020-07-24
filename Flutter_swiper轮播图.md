# Flutter_swiper轮播图

>pubspec.yaml dependencies 添加`flutter_swiper: ^1.1.6`
>`flutter pub get`
>import `import 'package:flutter_swiper/flutter_swiper.dart';`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var imgs = [
    "https://img-blog.csdnimg.cn/20200709133813183.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0tpbW1LaW5n,size_16,color_FFFFFF,t_70",
    "https://images2018.cnblogs.com/blog/1435523/201809/1435523-20180909150744140-2120125213.png",
    "https://img2018.cnblogs.com/i-beta/1435523/202002/1435523-20200214012521294-416245235.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('轮播图'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                //内容
                return new Image.network(
                  imgs[index],
                  fit: BoxFit.fill,
                );
              },
              loop: true, //无限轮播
              index: 1, //初始下标
              autoplay: true, //是否自动播放
              itemCount: imgs.length, //数量
              duration: 300, //播放时间
              onTap: (index) => {print('点击了${index}')}, //点击事件
              onIndexChanged: (value) => {}, //变化时候触发事件
              //pagination: new SwiperPagination(), //分页器
              //control: new SwiperControl(), //左右箭头
            ),
          ),
          Text("轮播图"),
        ],
      ),
    );
  }
}

```
