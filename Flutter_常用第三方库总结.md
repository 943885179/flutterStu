# Flutter常用第三方库

## flutter_splash_screen 启动屏

>[文档](https://pub.dev/packages/flutter_splash_screen/install)
>>`flutter_splash_screen: ^0.1.0`
>>`flutter pub get`
>>`import 'package:flutter_splash_screen/flutter_splash_screen.dart';`

## 路径获取库`path_provider`

>[文档](https://pub.dev/packages/path_provider/install)

```dart
import 'package:path_provider/path_provider.dart';
var documentsDir = await getTemporaryDirectory();//获取临时目录
print(documentsDir.path);
var xx=await getApplicationDocumentsDirectory();//获取应用文档目录
var xx=await getExternalStorageDirectory();//获取外部存储目录,ios不支持
```

>用途:文件下载等

## image_picker 相册选择图片和相机拍照

>[文档](https://pub.dev/packages/image_picker/install)

```dart
    import 'package:image_picker/image_picker.dart';
    var file1 = await ImagePicker().getImage(source: ImageSource.camera);//打开照相机
    var file2 = await ImagePicker().getImage(source: ImageSource.gallery); //打开相册
```

>用途：图片上传需要打开相机或者相册
