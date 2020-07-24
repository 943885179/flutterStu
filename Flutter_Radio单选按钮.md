# 单选按钮

## Radio按钮组

```dart
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _sex = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('登录'), //标题
          centerTitle: true, //标题居中显示
          /*bottom: TabBar(tabs: <Widget>[
            Text('标签一'),
            Text('标签二')
          ],),*/
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
        body: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Text('男'),
            Radio(
                value: 1,
                groupValue: this._sex,
                onChanged: (v) {
                  setState(() {
                    this._sex = v;
                  });
                }),
            Text('女'),
            Radio(
                value: 2,
                groupValue: this._sex,
                onChanged: (v) {
                  setState(() {
                    this._sex = v;
                  });
                }),
            Row(
              children: <Widget>[Text('选中的是${this._sex == 1 ? '男' : '女'}')],
            ),
          ],
        ),
      ),
    );
  }
}

```

## RadioLisTilte 按钮列表

```dart
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _sex = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('登录'), //标题
          centerTitle: true, //标题居中显示
          /*bottom: TabBar(tabs: <Widget>[
            Text('标签一'),
            Text('标签二')
          ],),*/
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
        body: Column(
          children: <Widget>[
            RadioListTile(
              value: 1,
              groupValue: this._sex,
              onChanged: (v) {
                setState(() {
                  this._sex = v;
                });
              },
              title: Text('男'), //标题
              secondary: Icon(Icons.settings), //图标或图片
              subtitle: Text('男生啊'), //副标题
              selected: this._sex == 1, //文字高亮
            ),
            RadioListTile(
              value: 2,
              groupValue: this._sex,
              onChanged: (v) {
                setState(() {
                  this._sex = v;
                });
              },
              title: Text('女'),
              subtitle: Text('女生啊'),
              secondary: Icon(Icons.settings),
              selected: this._sex == 2,
            )
          ],
        ),
      ),
    );
  }
}

```
