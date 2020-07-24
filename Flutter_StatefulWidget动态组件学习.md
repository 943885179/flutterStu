# Flutter_StatefulWidget动态组件学习

```dart

class ListHome extends StatefulWidget {
  ListHome({Key key}) : super(key: key);

  @override
  _ListHomeState createState() => _ListHomeState();
}

class _ListHomeState extends State<ListHome> {
  var list = List();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: this
              .list
              .map((e) => ListTile(
                    title: Text(e),
                  ))
              .toList(),
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              this.list.add('新增数据');
            });
          },
          child: Text('添加'),
        )
      ],
    );
  }
}

```
