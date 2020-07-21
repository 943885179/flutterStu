# Flutter_Expanded

```dart
class ExpandedStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: IconStu(Icons.image), flex: 2, //权重
        ),
        Expanded(
          child: IconStu(Icons.settings), flex: 1, //权重
        )
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
