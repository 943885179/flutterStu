# Flutter_ListView列表组件

## 基本列表

```dart
//ListView
class ListViewStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical, //默认垂直列表
      //reverse: true,//反转列表
      //padding: EdgeInsets.all(20),//内边距
      children: <Widget>[
        //Text("q31"),等
        //ListTile 最普通的列表
        ListTile(
          leading: Icon(
            //图标(在前面加图标)
            Icons.settings, //图标名称
            color: Colors.red, //图标颜色
            size: 50, //图标大小
          ),
          trailing: Icon(
            //图标(在后加图标)
            Icons.add, //图标名称
            color: Colors.red, //图标颜色
            size: 50, //图标大小
          ),
          title: Text("测试标题"), //主标题
          subtitle: Text("副标题。。啊啊"), //副标题
        ),
        ListTile(
          leading: Image.network(
              'https://img-blog.csdnimg.cn/20200709133813183.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0tpbW1LaW5n,size_16,color_FFFFFF,t_70'),
          title: Text("测试标题"),
          subtitle: Text("副标题。。啊啊"),
        ),
      ], //内容
    );
  }
}
```

>垂直列表

```dart
//ListView
class ListViewStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal, //默认垂直列表
      //reverse: true,//反转列表
      //padding: EdgeInsets.all(20),//内边距
      children: <Widget>[
        Container(
          width: 180,
          height: 100,
          color: Colors.red,
        ),
        Container(
          width: 180,
          height: 100,
          color: Colors.yellow,
        ),
        Container(
          width: 180,
          height: 100,
          color: Colors.blue,
        ),
      ], //内容
    );
  }
}
```

## 动态列表

>简单的动态列表（模拟数据）

```dart
//ListView
class ListViewStu extends StatelessWidget {
  List<Widget> _getDate() {
    var result = List<Widget>();
    for (var i = 0; i < 10; i++) {
      result.add(ListTile(
        title: Text("这个是$i列表"),
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      //rscrollDirection: Axis.horizontal, //默认垂直列表
      //reverse: true,//反转列表
      //padding: EdgeInsets.all(20),//内边距
      children: this._getDate(), //内容
    );
  }
}

```

>使用自定义数据
>>设置数据源,在lib下创建res下创建listData.dart文件

```dart
var listData = [
  {
    "title": "标题1",
    "author": "weixiao",
  },
  {
    "title": "标题2",
    "author": "weixiao",
  },
  {
    "title": "标题3",
    "author": "weixiao",
  }
];
```

>>引入`import 'package:flutter_appa/res/listData.dart';`
>>使用

```dart
//ListView
class ListViewStu extends StatelessWidget {
  List<Widget> _getDate() {
    List<Widget> tempList = listData
        .map((value) => ListTile(
              title: Text(value['title']),
              subtitle: Text(value['author']),
            ))
        .toList();
    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      //rscrollDirection: Axis.horizontal, //默认垂直列表
      //reverse: true,//反转列表
      //padding: EdgeInsets.all(20),//内边距
      children: this._getDate(), //内容
    );
  }

```

>listview.biulder加载

```dart
//ListView
class ListViewStu extends StatelessWidget {
  var data = List();
  ListViewStu() {
    for (var i = 0; i < 20; i++) {
      data.add("字段$i条");
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, indext) {
        return ListTile(
          title: Text(this.data[indext]),
        );
      },
    );
  }
}
```

>>加载外部动态数据

```dart
//ListView
class ListViewStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: (context, indext) {
        return ListTile(
          title: Text(listData[indext]['title']),
          subtitle: Text(listData[indext]['author']),
        );
      },
    );
  }
}
```
