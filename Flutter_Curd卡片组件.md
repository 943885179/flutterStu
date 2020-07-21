# Flutter_Curd卡片组件

```dart
class CardStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("张三"),
                subtitle: Text('182000000000'),
              ),
              ListTile(
                title: Text("测试"),
                subtitle: Text('943885179@qq.com'),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("李四"),
                subtitle: Text('182000000000'),
              ),
              ListTile(
                title: Text("测试"),
                subtitle: Text('943885179@qq.com'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
```
