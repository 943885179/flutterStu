# 安装sdk [官网](https://dart.dev/get-dart)

## 下载sdk[地址](https://dart.dev/tools/sdk/archive)

>解压加入path
>`dart --verison`查看是否安装成功

## vscode

> 添加插件 `dart`, `code Runner 运行文件用`

## hello world

>创建dart文件（以dart结尾）
>编写代码

```dart
main(){
    print('你好 dart');
}
```

>右键`run code`

## 创建变量 `type key = value;`

>var自动推断变量类型
>明确类型定义 String,int等
>final 和const 定义常量

## dart 的命名规则

>字母下划线数字美元符号组成
>不能为关键字
>不能数字开头
>大小写有区分
>见名思意

## 运算符

>运算符`+ - / *  % ~/`其中~/表示取整

## 方法

> 返回类型 名称 (参数， [可选参数]) {}

## 库

### 自定义库

>直接应用

### 系统库

>import 输入dart:选择本地库

### 第三方库

>托管到pub包管理系统
>>[托管地址1](https://pub.dev/packages)
>>[托管地址2](https://pub.flutter-io.cn/packages)
>>[托管地址3](https://pub.dartlang.org/packages)
>在根目录里面添加文件`pubspec.yaml`

```yarm
name: test //名称
description:  Zheshimiaoshu a. //项目说明
dependencies:  //第三方库
   http: ^0.12.2
```

>cd到项目目录，执行`pub get`此时会下载
>引入import package

### 使用as重命名`improt 'xxx' as d`然后使用`d.yyy`

### 只引入部分功能`import 'xxx' show 方法`标识只引入该方法

### 隐藏部分功能`import 'xxx' hide 方法`
