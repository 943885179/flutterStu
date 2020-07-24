# 项目结构

## lib自己的代码

>入口文件main.dart
>入口方法`runApp`
>`fim`快捷引入flutter

## flutter把内容单独抽离成一个组件

>需要继承StatelessWidget/StatefulWidget
>>StatelessWidget 无状态组件，状态不可变的widget

```dart
//无状态组件
class name extends StatelessWidget {
  const name({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
```

>>StatefulWidget 有状态组件，持有的状态可能在widget生命周期改变

```dart
//自定义有状态组件
class StateFulWidgetStu extends StatefulWidget {
  StateFulWidgetStu({Key key}) : super(key: key);

  @override
  _StateFulWidgetStuState createState() => _StateFulWidgetStuState();
}

class _StateFulWidgetStuState extends State<StateFulWidgetStu> {
  int countNum = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 200,
        ),
        Chip(label: Text('${this.countNum}')),
        RaisedButton(
          child: Text("测试"),
          onPressed: () {
            setState(() {
              this.countNum++;
            });
          },
        ),
      ],
    );
  }
}

```

```dart
 class myapp extends StatelessWidget{
     @override
     Widget build(BuildContext context){
         return Conter();
     }
 }
```

## pubspec.yaml 第三方插件

## 夜神模拟器

>cd `D:\Program Files\Nox\bin\`
>执行 `nox_adb.exe connect 127.0.0.1:62001`
>这样才能才vscode中找到第三方模拟器

## 第三方下载

>`pubspec.yaml`添加包`dependencies`下
>执行`flutter packages get`
