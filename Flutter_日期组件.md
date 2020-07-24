# 日期组件

## Flutter日期时间戳

> 获取时间戳

```dart
  var date = DateTime.now();
  print(date.millisecondsSinceEpoch);//单位毫秒,13位时间戳
```

>时间戳转日期

```dart
var date = DateTime.now();
var a = date.millisecondsSinceEpoch; //单位毫秒,13位时间戳
print(DateTime.fromMillisecondsSinceEpoch(a));
```

## 内置时间日期组件

```dart
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var nowdate = DateTime.now();
  _showDatePicker() {
    showDatePicker(
      context: context, //组件,默认写context就好了
      initialDate: nowdate, //选中日期
      firstDate: DateTime(1991), //最小值
      lastDate: DateTime(2100), //最大值
    ).then((v) => {print(v)}); //获取值(第一种方法)
  }

  _showDatePicker2() async {
    var result = await showDatePicker(
      context: context, //组件,默认写context就好了
      initialDate: nowdate, //选中日期
      firstDate: DateTime(1991), //最小值
      lastDate: DateTime(2100), //最大值
    ); //获取值(第一种方法)
    print(result);
    setState(() {
      this.nowdate = result;
    });
  }

  var time = TimeOfDay(hour: 9, minute: 30);
  _showTimePicker() async {
    var result = await showTimePicker(context: context, initialTime: time);
    print(result);
    setState(() {
      this.time = result;
    });
  }

  @override
  void initState() {
    var now = DateTime.now();
    var tp = now.millisecondsSinceEpoch;
    print(tp); //时间戳
    print(DateTime.fromMillisecondsSinceEpoch(tp));
    print(formatDate(DateTime(1989, 2, 21), [yyyy, '-', mm, '-', dd]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('登录'), //标题
          centerTitle: true, //标题居中显示
          /*bottom: TabBar(tabs: <Widget>[
            Text('标签一'),
            Text('标签二')
          ],),*/
          leading: IconButton(
            //左上角内容
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          actions: <Widget>[
            //右上角内容，可以设置多个
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              //水墨纹,可点击,row无点击事件,需要配合他
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${formatDate(this.nowdate, [
                    yyyy,
                    '年',
                    mm,
                    '月',
                    dd,
                    '日'
                  ])}'),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              onTap: () {
                _showDatePicker2();
              },
            ),
            InkWell(
              //水墨纹,可点击,row无点击事件,需要配合他
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${this.time.hour}:${this.time.minute}'),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              onTap: () {
                _showTimePicker();
              },
            )
          ],
        ),
      ),
    );
  }
}

```

## [国际化](./Flutter_国际化.md)

## 使用第三方库 flutter_datetime_picker

>添加到pubspec.yaml `flutter_datetime_picker: ^1.3.8`
>`flutter packages get`一般ctrl+s保存时候vscode会自动下载
>import `import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';`

```dart
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var nowdate = DateTime.now();

//十二个小时显示(选中上下午)
  _showTimePicker12() {
    DatePicker.showTime12hPicker(
      context,
      showTitleActions: true, //是否显示头部
      locale: LocaleType.zh,
      onChanged: (time) => {print(time)},
      onConfirm: (time) => {print(time)},
      onCancel: () => {print('取消')},
    );
  }

//二十四小时显示
  _showTimePicker() {
    DatePicker.showTimePicker(
      context,
      showSecondsColumn: false, //是否显示秒
      showTitleActions: true, //是否显示头部
      locale: LocaleType.zh,
      currentTime: nowdate,
      onChanged: (time) => {print(time)},
      onConfirm: (time) => {print(time)},
      onCancel: () => {print('取消')},
    );
  }

  //显示时间+日期
  _showDateTimePicker() {
    DatePicker.showDateTimePicker(context,
        showTitleActions: true, //是否显示确定按钮
        minTime: DateTime.parse('1990-01-01'), //最小日期
        maxTime: DateTime(2200), //最大日期
        locale: LocaleType.zh, //语言
        currentTime: nowdate, //当前日期
        theme: DatePickerTheme(
            backgroundColor: Colors.white, //背景色
            headerColor: Colors.blue, //头部颜色
            containerHeight: 250, //弹出层高度
            titleHeight: 50, //头部高度
            itemHeight: 80, //内容高度
            cancelStyle: TextStyle(color: Colors.red), //取消按钮样式
            doneStyle: TextStyle(color: Colors.red), //确认按钮样式
            itemStyle: TextStyle(
              //内容样式
              color: Colors.black,
            )), onConfirm: (v) {
      //确定按钮触发
      print(v);
    }, onCancel: () {
      //取消按钮触发
      print('取消选中');
    }, onChanged: (v) {
      //改变时候就该值,可以不显示确定
      setState(
        () {
          this.nowdate = v;
        },
      );
    });
  }

  //显示日期
  _showDatePicker() {
    DatePicker.showDatePicker(context,
        showTitleActions: true, //是否显示确定按钮
        minTime: DateTime.parse('1990-01-01'), //最小日期
        maxTime: DateTime(2200), //最大日期
        locale: LocaleType.zh, //语言
        currentTime: nowdate, //当前日期
        theme: DatePickerTheme(
            backgroundColor: Colors.white, //背景色
            headerColor: Colors.blue, //头部颜色
            containerHeight: 250, //弹出层高度
            titleHeight: 50, //头部高度
            itemHeight: 80, //内容高度
            cancelStyle: TextStyle(color: Colors.red), //取消按钮样式
            doneStyle: TextStyle(color: Colors.red), //确认按钮样式
            itemStyle: TextStyle(
              //内容样式
              color: Colors.black,
            )), onConfirm: (v) {
      //确定按钮触发
      print(v);
    }, onCancel: () {
      //取消按钮触发
      print('取消选中');
    }, onChanged: (v) {
      //改变时候就该值,可以不显示确定
      setState(
        () {
          this.nowdate = v;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('登录'), //标题
          centerTitle: true, //标题居中显示
          /*bottom: TabBar(tabs: <Widget>[
            Text('标签一'),
            Text('标签二')
          ],),*/
          leading: IconButton(
            //左上角内容
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          actions: <Widget>[
            //右上角内容，可以设置多个
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${formatDate(this.nowdate, [yyyy, '-', mm, '-', dd])}')
                ],
              ),
              onTap: () {
                _showTimePicker();
              },
            )
          ],
        ),
      ),
    );
  }
}

```
