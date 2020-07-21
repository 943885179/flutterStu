# Flutter_GridView网格列表

## 基本网格

```dart

class GridViewStu extends StatelessWidget {
  List<Widget> _getData() {
    var result = List<Widget>();
    for (var i = 0; i < 20; i++) {
      result.add(Container(
        height: 100,
        alignment: Alignment.center, //设置内容居中
        color: Colors.blue,
        child: Text(
          'data$i测试',
          textAlign: TextAlign.center,
        ),
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3, //每行显示多少列
        crossAxisSpacing: 20, //左右的距离
        mainAxisSpacing: 20, //上下的距离
        childAspectRatio: 1, //宽度和高度的比例
        padding: EdgeInsets.all(20), //距离外部边框的距离
        children: this._getData());
  }
}
```

> 外部动态参数

```dart

class GridViewStu extends StatelessWidget {
  List<Widget> list = goods
      .map((e) => Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Image.network(e['imgUrl']),
                SizedBox(
                  height: 20,
                ),
                Text(
                  e['name'],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ))
      .toList();
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3, //每行显示多少列
        crossAxisSpacing: 20, //左右的距离
        mainAxisSpacing: 20, //上下的距离
        padding: EdgeInsets.all(20), //距离外部边框的距离
        //childAspectRatio: 1, //宽度和高度的比例
        children: this.list);
  }
}
```

## GuidView.builder()构建

```dart
class GridViewStu extends StatelessWidget {
  Widget _getData(contenxt, index) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Image.network(goods[index]['imgUrl']),
          Text(goods[index]['name'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: goods.length, //数量
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //配置gridview基本配置
        crossAxisCount: 2, //设置每行显示数量
      ),
      itemBuilder: this._getData,
    );
  }
}

```
