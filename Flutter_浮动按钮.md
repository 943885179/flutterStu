# Flutter_浮动按钮floatingActionButton

```dart
import 'package:flutter/material.dart';
import 'package:flutter_appa/page/tabs/CategoryPage.dart';
import 'package:flutter_appa/page/tabs/Home.dart';
import 'package:flutter_appa/page/tabs/Me.dart';

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key key, this.index = 0}) : super(key: key);

  @override
  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  var _currentIndex = 0;

  _TabsState(int index) {
    this._currentIndex = index;
  }
  var _pageList = [HomePage(), CategoryPage(), MePage()];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        floatingActionButton: FloatingActionButton(
          //浮动按钮
          onPressed: () {},
          child: Icon(
            Icons.settings,
            color: Colors.black,
            size: 24,
          ),
          backgroundColor: Colors.yellow, //浮动按钮颜色
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat, //浮动按钮位置
        body: this._pageList[this._currentIndex],
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              /* Row(
                children: <Widget>[
                  Expanded(
                    child: DrawerHeader(
                      child: Text('设置'),
                      decoration: BoxDecoration(
                        // color: Colors.yellow,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://img-blog.csdnimg.cn/20200709133813183.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0tpbW1LaW5n,size_16,color_FFFFFF,t_70'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  )
                ],
              ),*/
              Row(
                children: <Widget>[
                  Expanded(
                    child: UserAccountsDrawerHeader(
                      accountName: Text('weixiao'),
                      accountEmail: Text('9438851792@qq.com'),
                      arrowColor: Colors.red,
                      otherAccountsPictures: <Widget>[Text('其他内容')],
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://img-blog.csdnimg.cn/20200709133813183.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0tpbW1LaW5n,size_16,color_FFFFFF,t_70'),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        /*image: DecorationImage(
                            image: NetworkImage(
                                'https://img-blog.csdnimg.cn/20200709133813183.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0tpbW1LaW5n,size_16,color_FFFFFF,t_70'),
                            fit: BoxFit.cover),*/
                      ),
                    ),
                  )
                ],
              ),
              ListTile(
                title: Text('登录'),
                leading: Icon(Icons.search),
                onTap: () {
                  Navigator.of(context).pop(); //消除抽屉
                  Navigator.pushNamed(context, '/rfirst');
                },
              ),
              Divider(),
              ListTile(
                title: Text('data'),
                leading: Icon(Icons.search),
              ),
              Divider(),
              ListTile(
                title: Text('data'),
                leading: Icon(Icons.search),
              ),
              Divider(),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: Text('右侧侧边栏'),
        ),
        bottomNavigationBar: BottomNavigationBar(
            //底部菜单设置
            currentIndex: this._currentIndex, //选中的索引值
            //iconSize: 36, //图标大小
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
