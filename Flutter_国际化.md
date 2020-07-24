# Flutter_国际化

## pubspec.yaml 中添加如下依赖

```dart
  flutter_localizations:
    sdk: flutter
```

## `flutter packages get`拉取,这个默认是自带的

## main.dart 中 import

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
```

## 在MyApp中写入代码`localizationsDelegates`和`supportedLocales`

```dart
class MaAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去掉debug
      //home: Tabs(),
      title: '学习app',
      initialRoute: '/', //表示初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(primarySwatch: Colors.blue),
      localizationsDelegates: [
        //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        //此处
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
    );
  }
}
```

## 如果手机的操作系统是中文已经改成中文了,如果强制指定,则在相应的位置添加`locale:Locale('zh')`不过我的好像报错了,忽略掉它

## 虚拟机设置中文

>settings>system>language&input>add a language>简体中文>调整到第一项

