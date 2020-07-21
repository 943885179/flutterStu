# Flutter_Text文本组件

```dart
//Text
class TextStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 300,
        color: Colors.red,
        child: Text(
          "xuexxxxxxx测测试xuexxxxxxx测测试xuexxxxxxx测测试", //内容
          maxLines: 3, //最大显示几行
          textAlign: TextAlign.center, //文字居中，居左右
          textDirection: TextDirection.ltr,
          textScaleFactor: 2, //字体放大倍数
          overflow:
              TextOverflow.ellipsis, //文本过长设置，ellipsis表示溢出有几个点clip(直接裁剪)fade隐藏
          style: TextStyle(
            //样式设置
            fontSize: 40.0, //字体大小设置
            color: Color.fromARGB(255, 255, 255, 255), //字体颜色
            fontWeight: FontWeight.w200, //加粗
            fontStyle: FontStyle.italic, //设置倾斜
            decoration: TextDecoration.lineThrough, //设置线 lineThrough（穿过线）
            decorationColor: Colors.black, //设置线颜色
            decorationStyle: TextDecorationStyle.dashed, //设置实线虚线
            letterSpacing: 5, //字间距
            wordSpacing: 2, //单词间距
          ),
        ));
  }
}
```
