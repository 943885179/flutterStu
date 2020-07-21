# Flutter_Container容器组件

```dart
//ContainerStu
class ContainerStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //容器
      child: Text("hello home"), //内容
      height: 300, //高度
      width: 300, //长度
      padding: EdgeInsets.all(10), //内边距
      margin: EdgeInsets.fromLTRB(10, 30, 20, 0), //外边距EdgeInsets.all(20)
      //transform: Matrix4.rotationZ(0.3), //Matrix4.translationValues(10, 10, 90), //位移，旋转等
      alignment: Alignment.center, //设置内容位置,居右居中等
      decoration: BoxDecoration(
        //背景色设置
        color: Colors.yellow, //颜色
        border: Border.all(
          //边框设置
          color: Colors.blue, //边框颜色
          width: 2, //边框线的宽度
        ),
        borderRadius: BorderRadius.all(//设置圆角
            Radius.circular(8) //设置圆角
            ),
      ),
    );
  }
}
```
