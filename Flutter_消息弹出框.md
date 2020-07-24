# Flutter消息弹出框

## AlertDialog

```dart
import 'package:flutter/material.dart';
import 'package:flutter_appa/page/search.dart';

import '../Form.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _alertDialog() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示'), //标题
          content: Text('这是内容'), //内容
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context, '确定了'); //这里也可以赋值
                },
                child: Text('ok')),
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('no'))
          ],
        );
      },
    );
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text('AlertDialog'),
          color: Theme.of(context).accentColor,
          onPressed: () {
            _alertDialog();
          },
        ),
      ],
    );
  }
}

```

## SimpleDialog 中间多个选则弹出

```dart
import 'package:flutter/material.dart';
import 'package:flutter_appa/page/search.dart';

import '../Form.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _dialog() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('提示'), //标题
          children: <Widget>[
            SimpleDialogOption(
              child: Text('data'),
              onPressed: () {
                Navigator.pop(context, 'data');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('data1'),
              onPressed: () {
                Navigator.pop(context, '这是一个值');
              },
            )
          ],
        );
      },
    );
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text('Dialog'),
          color: Theme.of(context).accentColor,
          onPressed: () {
            _dialog();
          },
        ),
      ],
    );
  }
}
```

## showModalBottomSheet 下方弹出

```dart
import 'package:flutter/material.dart';
import 'package:flutter_appa/page/search.dart';

import '../Form.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _dialog() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('a'),
                  onTap: () {
                    Navigator.pop(context, '传出a');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('b'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('c'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text('Dialog'),
          color: Theme.of(context).accentColor,
          onPressed: () {
            _dialog();
          },
        ),
      ],
    );
  }
}
```

## 第三方弹出库 fluttertoast

>和其他库一样配置

```dart
  _dialogTree() {
    Fluttertoast.showToast(
      msg: '我是消息',
      toastLength: Toast.LENGTH_LONG, //消息长度
      gravity: ToastGravity.BOTTOM, //消息弹出位置
      timeInSecForIosWeb: 4, //android不生效,弹出时间
      backgroundColor: Colors.black, //背景色
      textColor: Colors.white,
      fontSize: 16,
    );
  }
```

