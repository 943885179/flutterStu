# Flutter_AppBar导航

```dart
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('登录'), //标题
          centerTitle: true, //标题居中显示
          leading: IconButton(
            //左上角内容
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          actions: <Widget>[
            //右上角内容，可以设置多个
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
        body: Text('登录界面'),
      ),
    );
  }
}

```

## appbar添加tabbar(头部导航)

```dart
import 'package:flutter/material.dart';

class DefaultPage extends StatefulWidget {
  DefaultPage({Key key}) : super(key: key);

  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //如果使用appbar需要要有defaultTabController
      child: Scaffold(
        appBar: AppBar(
          title: Text('看下面有好多个bar'),
          centerTitle: true,
          bottom: TabBar(
            //设置头部bar
            tabs: <Widget>[
              Tab(
                text: '热门',
                icon: Icon(Icons.settings),
              ),
              Tab(
                text: 't推荐',
                icon: Icon(Icons.ac_unit),
              )
            ],
          ),
        ),
        body: TabBarView(
          //和顶部的tabbar对应
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('测试'),
                  leading: Icon(Icons.search),
                ),
                ListTile(
                  title: Text('测试'),
                  leading: Icon(Icons.search),
                ),
                ListTile(
                  title: Text('测试'),
                  leading: Icon(Icons.search),
                ),
              ],
            ),
            Text('这个是测试界面')
          ],
        ),
      ),
      length: 2, //和里面bottom的个数一致
    );
  }
}

```

## 将头部tabbar放到title里

```dart
import 'package:flutter/material.dart';

class DefaultPage extends StatefulWidget {
  DefaultPage({Key key}) : super(key: key);

  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, //和里面bottom的个数一致
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(
                  child: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: '测试1',
                  ),
                  Tab(
                    text: '测试2',
                  )
                ],
              ))
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[Text('第一个'), Text('第二个')],
        ),
      ),
    );
  }
}

```
