# Flutter_BottomNavigationBar底部导航条组件

>基本定义

```dart
class MaAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: HomeConter(),
        bottomNavigationBar: BottomNavigationBar(
            //底部菜单设置
            currentIndex: 1, //默认选中的底部菜单
            iconSize: 36, //图标大小
            fixedColor: Colors.red, //选中的颜色
            type: BottomNavigationBarType.fixed, //允许多个底部按钮（不设置超过三个会显示问题）
            onTap: (index) {
              //点击底部按钮触发事件
              //print(index);
            },
            items: [
              //底部菜单数据
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('首页')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), title: Text('分类')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), title: Text('个人')),
            ]),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

```

>设置有状态

```dart
class MaAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tabs(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: HomeConter(),
        bottomNavigationBar: BottomNavigationBar(
            //底部菜单设置
            currentIndex: this._currentIndex, //默认选中的底部菜单
            onTap: (index) {
              //点击底部按钮触发事件
              print(index);
              setState(() {
                this._currentIndex = index;
              });
            },
            items: [
              //底部菜单数据
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('首页')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), title: Text('分类')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), title: Text('个人')),
            ]),
      ),
    );
  }
}
```

>设置动态界面随底部导航改变（正式项目中）
>>创建page文件夹后创建`tabs.dart`文件将tabs单独分离出来,

```dart
import 'package:flutter/material.dart';
import 'package:flutter_appa/page/tabs/CategoryPage.dart';
import 'package:flutter_appa/page/tabs/Home.dart';
import 'package:flutter_appa/page/tabs/Me.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  var _currentIndex = 0;
  var _pageList = [HomePage(), CategoryPage(), MePage()];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: this._pageList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            //底部菜单设置
            currentIndex: this._currentIndex, //选中的索引值
            iconSize: 36, //图标大小
            fixedColor: Colors.red, //选中的颜色
            type: BottomNavigationBarType.fixed, //允许多个底部按钮（不设置超过三个会显示问题）
            onTap: (index) {
              //点击底部按钮触发事件
              //print(index);
              setState(() {
                this._currentIndex = index;
              });
            },
            items: [
              //底部菜单数据
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('首页')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), title: Text('分类')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), title: Text('个人')),
            ]),
      ),
    );
  }
}
```

>>page文件夹下创建`tabs`文件夹，在下面创建具体的文件，这边我是创建了三个菜单

```dart
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('主页'),
    );
  }
}

```

```dart
import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  MePage({Key key}) : super(key: key);

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('个人中心'),
    );
  }
}

```

```dart
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('分类'),
    );
  }
}

```

>>设置号后可以详细的看看tabs.dart文件
>>>将页面引入到文件内
>>>设置页面List，实现切换
>注入到主Myapp中

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
    );
  }
}
```
