# Flutter_Wrap组件 (相当于流的布局)

```dart
class WrapStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10, //横向间距
      runSpacing: 10, //纵轴间距
      alignment: WrapAlignment.center, //换行对齐方式(一般用不到)
      children: <Widget>[
        MyButton('测试'),
        MyButton('测试'),
        MyButton('测试'),
        MyButton('测试'),
        MyButton('测试'),
        MyButton('测试'),
        MyButton('测试'),
        MyButton('测试'),
        MyButton('测试'),
      ],
    );
  }
}

//MyButton 自定义
// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  String text;
  MyButton(this.text, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.text),
      textColor: Theme.of(context).accentColor,
      onPressed: () {},
    );
  }
}

```
