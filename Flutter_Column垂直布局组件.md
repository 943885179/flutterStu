# Flutter_Column水平布局组件

```dart
class ColumnStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment
          .spaceEvenly, //水平方向居中 end :居右 center居中 spaceEvenly 间隔一致
      crossAxisAlignment: CrossAxisAlignment.end, //垂直方向调整
      children: <Widget>[
        IconStu(Icons.image),
        IconStu(Icons.settings),
      ],
    );
  }
}

class IconStu extends StatelessWidget {
  double size = 32;
  Color color = Colors.blue;
  IconData data;
  IconStu(this.data, {this.size, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.yellow,
      child: Icon(
        this.data,
        size: this.size,
        color: this.color,
      ),
    );
  }
}

```
