# 项目结构

## lib自己的代码

>入口文件main.dart
>入口方法`runApp`
>`fim`快捷引入flutter

## flutter把内容单独抽离成一个组件

>需要继承StatelessWidget/StatefulWidget
>>StatelessWidget 无状态组件，状态不可变的widget
>>StatefulWidget 有状态组件，持有的状态可能在widget生命周期改变

```
 class myapp extends StatelessWidget{
     @override
     Widget build(BuildContext context){
         return Conter();
     }
 }
```

## pubspec.yaml 第三方插件
