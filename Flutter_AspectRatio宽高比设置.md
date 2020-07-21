# Flutter_AspectRatio宽高比设置 (平铺图片的时候可能用到)

```dart
class AspectRatioStu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: AspectRatio(
        aspectRatio: 2.0 / 1.0, //设置宽高比，让子元素自动铺满
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
```
