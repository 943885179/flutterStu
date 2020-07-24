# Flutter_Checkbox多选框

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
            SizedBox(
              height: 20,
            ),
            Checkbox(
              //选择框
              value: this._flag, //是否选择
              onChanged: (value) {
                print(value);
                setState(() {
                  this._flag = value;
                });
              }, //选择改变事件
              checkColor: Colors.red, //选中的沟颜色
              activeColor: Colors.blue, //选中的颜色
            ),
            CheckboxListTile(
              value: this._flag, //是否选中
              onChanged: (v) {
                //改变事件
                setState(() {
                  this._flag = v;
                });
              },
              title: Text('这是文本'), //标题
              subtitle: Text('二级标题'), //二级标题
              //activeColor: Colors.red, //选中的颜色
              secondary: Icon(Icons.settings), //配置图标或者图片
              selected: true, //选中后文字颜色是否随状态改变
            )
          ],
        ),
      ),
    );
  }
}

```
