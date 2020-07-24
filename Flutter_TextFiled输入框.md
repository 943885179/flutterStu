# Flutter_TextFiled输入框

## 基本使用

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
            SizedBox(
              height: 20,
            ),
            //创建表单
            TextField(),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '请输入用户名', //提示
                border: OutlineInputBorder(), //设置边框
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: 2, //多行
              //maxLength: 4,//最多输入四个字
              decoration: InputDecoration(
                hintText: '请输入用户名', //提示
                border: OutlineInputBorder(), //设置边框
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true, //设置密码框
              decoration: InputDecoration(
                hintText: '密码框', //提示
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: '用户名', //描述
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '请输入用户名', //提示
                icon: Icon(Icons.people),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

```

## 设置初始值

```dart
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var username = TextEditingController();
  @override
  void initState() {
    super.initState();
    username.text = '初始值';
  }

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
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: username, //赋值初始值
              onChanged: (value) {
                //print(this.username.text)
                setState(() {
                  this.username.text = value;
                });
              },
              decoration: InputDecoration(
                hintText: '请输入用户名', //提示
                icon: Icon(Icons.people),
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              width: double.infinity, //和容器宽度一致
              child: RaisedButton(
                onPressed: () {
                  print(this.username.text);
                },
                child: Text('登录'),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

```
