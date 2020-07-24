# Flutter_Tabbar导航条设置

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
                //isScrollable: true, //是否可以滚动
                indicatorColor: Colors.red, //指示器的颜色
                //indicatorWeight: 20, //指示器的高度
                labelColor: Colors.red, //指示器文字颜色
                indicatorSize:
                    TabBarIndicatorSize.tab, //指示器大小tab默认 label文字大小(选中后下面的横线)
                unselectedLabelColor: Colors.white, //未选择的颜色
                //indicatorPadding: ,//指示器底部的边距
                //labelPadding: ,//文字边距
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

## 使用tabcontroller实现顶部导航

```dart
import 'package:flutter/material.dart';

class TabControlerPage extends StatefulWidget {
  TabControlerPage({Key key}) : super(key: key);

  @override
  _TabControlerPageState createState() => _TabControlerPageState();
}

class _TabControlerPageState extends State<TabControlerPage>
    with SingleTickerProviderStateMixin {
  TabController _tbc;
  @override
  void initState() {
    //初始化加载
    super.initState();
    _tbc = TabController(length: 2, vsync: this);
    _tbc.addListener(() {
      //发生改变时候执行
      print(_tbc.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, //和里面bottom的个数一致
      child: Scaffold(
        appBar: AppBar(
          title: Text('test'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: '赊销',
              ),
              Tab(
                text: '热门',
              )
            ],
            controller: this._tbc,
          ),
        ),
        body: TabBarView(
          controller: this._tbc,
          children: <Widget>[
            Center(
              child: Text('第一页'),
            ),
            Center(
              child: Text('热门'),
            )
          ],
        ),
      ),
    );
  }
}

```
