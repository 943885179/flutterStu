# Flutter_Switch开关

```dart
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _flag = true;
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
            Switch(
                value: this._flag,
                onChanged: (v) {
                  setState(() {
                    this._flag = v;
                  });
                })
          ],
        ),
      ),
    );
  }
}

```
