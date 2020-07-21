# Flutter_Stack层叠组件

## 基本(只能控制一个组件)

```dart
class StackStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment(0, 1), //  Alignment.center系统指定显示方位 0,1下方，-1-1之间
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          Text("这是文本"),
        ],
      ),
    );
  }
}
```

## 多个子组件 结合Align组件分表指定位置

```dart
class StackStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment(0, 1), //  Alignment.center系统指定显示方位
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text("这是1a本"),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text("这是a本"),
          ),
        ],
      ),
    );
  }
}
```

## 多个子组件 结合Positioned组件分表指定位置

```dart
class StackStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment(0, 1), //  Alignment.center系统指定显示方位
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,//一般写两个方位指定
            child: Text("这是1a本"),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text("这是a本"),
          ),
        ],
      ),
    );
  }
}

```
