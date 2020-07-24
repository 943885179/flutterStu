# Flutter_路由Navigator

## 基本路由

>新建组件(一般在page下)

```dart
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('搜索'),
        ),
        body: Text('搜索界面'),
      ),
    );
  }
}

```

>home下设置跳转

```dart
import 'package:flutter/material.dart';
import 'package:flutter_appa/page/search.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('首页'),
        RaisedButton(
          child: Text('基本跳转'),
          onPressed: () {
            //路由跳转
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SearchPage(),
            ));
          },
        ),
      ],
    );
  }
}
```

## 路由传值

>设置组件

```dart
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  String title;
  FormPage({this.title = '默认'});//设置接受参数
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Text('搜索界面'),
      ),
    );
  }
}
```

>调用

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('首页'),
        RaisedButton(
          child: Text('基本跳转'),
          onPressed: () {
            //路由跳转
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SearchPage(),
            ));
          },
        ),
        RaisedButton(
          child: Text('带参数跳转'),
          onPressed: () {
            //路由跳转
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FormPage(title: "测试啊"),
            ));
          },
        ),
      ],
    );
  }
}
```

## 跳转过去的界面设置悬浮按钮

```dart
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  String title;
  FormPage({this.title = '默认'});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          //设置悬浮按钮
          onPressed: () {
            Navigator.of(context).pop(); //退出当前界面,返回上一级界面
          },
          backgroundColor: Colors.red,
          child: Text('返回'),
        ),
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Text('搜索界面'),
      ),
    );
  }
}
```

## 命名路由

### 在最外层配置路由routes参数

```dart
void main() {
  runApp(MaAPP());
}

class MaAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tabs(),
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/form1': (context) => FormPage(
              title: '命名路由一',
            ),
        '/form2': (context) => FormPage(
              title: '命名路由二',
            ),
      },
    );
  }
}
```

### 在调用的地方执行跳转

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('首页'),
        RaisedButton(
          child: Text('命名路由跳转'),
          color: Theme.of(context).accentColor,
          onPressed: () {
            //路由跳转
            Navigator.pushNamed(context, '/form1');
          },
        ),
      ],
    );
  }
}
```

### 命名路由传值 [地址](https://flutter.dev/docs/cookbook/navigation/navigate-with-arguments)

>入口统一注册路由和对命名路由统一处理 ,arguments必须是这个参数

```dart
class MaAPP extends StatelessWidget {
  final routes = {
    '/form1': (context) => FormPage(
          title: '命名路由一',
        ),
    '/form2': (context) => FormPage(
          title: '命名路由二',
        ),
    '/form3': (context, {arguments}) => AFormPage(
          arguments: arguments,
        ),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tabs(),
      title: '学习app',
      onGenerateRoute: (settings) {
        final Function pageContentBuilder = this.routes[settings.name];
        if (pageContentBuilder != null) {
          if (settings.arguments != null) {
            return MaterialPageRoute(
              builder: (context) {
                return pageContentBuilder(context,
                    arguments: settings.arguments);
              },
            );
          } else {
            return MaterialPageRoute(
              builder: (context) {
                return pageContentBuilder(context);
              },
            );
          }
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

//stu1：开始 hello world
class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "hello123",
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 40.0, color: Colors.yellow),
    ));
  }
}

```

>组件设置接受路由参数arguments

```dart
import 'package:flutter/material.dart';

class AFormPage extends StatelessWidget {
  var arguments;
  AFormPage({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          //设置悬浮按钮
          onPressed: () {
            Navigator.of(context).pop(); //退出当前界面,返回上一级界面
          },
          backgroundColor: Colors.red,
          child: Text('返回'),
        ),
        appBar: AppBar(
          title: Text('命名路由传参'),
        ),
        body: Text('传过来的参数为:${arguments['id']}'),
      ),
    );
  }
}

```

>调用

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('首页'),
        RaisedButton(
          child: Text('命名路由带参数跳转'),
          color: Theme.of(context).accentColor,
          onPressed: () {
            //路由跳转
            Navigator.pushNamed(context, '/form3', arguments: {"id": 123});
          },
        ),
      ],
    );
  }
}

``` 

## 路由剥离

>main.dart `initialRoute: '/', //表示初始化的时候加载的路由,这样就可以不指定home了`

```dart
void main() {
  runApp(MaAPP());
}

class MaAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Tabs(),
      title: '学习app',
      initialRoute: '/', //表示初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

```

>router/Router.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_appa/page/Aform.dart';
import 'package:flutter_appa/page/Form.dart';
import 'package:flutter_appa/page/tabs.dart';

final routes = {
  '/': (context, {arguments}) => Tabs(),
  '/form1': (context, {arguments}) => FormPage(
        title: '命名路由一',
      ),
  '/form2': (context, {arguments}) => FormPage(
        title: '命名路由二',
      ),
  '/form3': (context, {arguments}) => AFormPage(
        arguments: arguments,
      ),
};
// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  final Function pageContentBuilder = routes[settings.name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      return MaterialPageRoute(
        builder: (context) {
          return pageContentBuilder(context, arguments: settings.arguments);
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          return pageContentBuilder(context);
        },
      );
    }
  }
  assert(false, 'Need to implement ${settings.name}');
  return null;
};

```

## 替换路由（比如主页到注册一》注册二）注册二直接返回主页(直接返回根了)

```dart
   Navigator.of(context).pushReplacementNamed('/rthen');//用下一步替换上一把，替换路由，返回上一级的时候放回到上一个进入路由
```

## 跳转到首页

```dart
 Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => Tabs(
                          index: 2,
                        )),
                (route) => route == null);
```
