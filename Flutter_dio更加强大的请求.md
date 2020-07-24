# Flutter Dio插件

>`dio: ^3.0.9`
>`import 'package:dio/dio.dart';`
>get

```dart
  _get() async {
    var resp = await Dio().get('http://192.168.0.106:8080/menu/menuByID?ID=1');
    print(resp.data);
  }
```

>post

```dart
 _post() async {
    var resp = await Dio().post('http://192.168.0.106:8080/user/login',
        data: {"userName": "weixiao2", "password": "123"},
        options: Options(contentType: 'application/json'));
    print(resp.data);
  }
```

>并发请求

```dart

  _get() async {
    //var resp = await Dio().get('http://192.168.0.106:8080/menu/menuByID?ID=1');
    var dio = Dio();
    var resp = await Future.wait([
      dio.get('http://192.168.0.106:8080/menu/menuByID?ID=1'),
      dio.get('http://192.168.0.106:8080/menu/menuByID?ID=2')
    ]);
    print('方法一获取');
    print(resp[0].data);
    print('方法二获取');
    print(resp[1].data);
  }

```

>下载文件
>>先下载一个获取路径的库`path_provider`然后根据andriod还是ios配置获取相应的路径

```dart
 Future<String> _findLocalPath() async {
    //这里根据平台获取当前安装目录
    final directory = Theme.of(context).platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory.path;
  }
```

>>编写下载代码

```dart
  _down() async {
    String _localPath = (await _findLocalPath()) + '/Download';
    Response responce = await Dio().download(
        "http://192.168.0.106:8080/static/upload/test/1595492478050171100.jpg",
        _localPath + "/test.jpg");
    if (responce.statusCode == 200) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("下载成功")));
    }
  }
```

>>在`文件管理>内部存储>Android>data>你的包名>files>Download`下查看是否存在
>文件上传
>>需要额外`image_picker`图片库

```dart
 _upload() async {
    //var file = await ImagePicker().getImage(source: ImageSource.camera);//打开照相机
    var file = await ImagePicker().getImage(source: ImageSource.gallery); //打开相册
    print(file.path);

    //var name =file.path.substring(file.path.lastIndexOf("/") + 1, file.path.length);
    var formData = FormData.fromMap(
        {'path': 'test', 'file': await MultipartFile.fromFile(file.path)});
    var resp = await Dio().post(
      'http://192.168.0.106:8080/file/upload',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
      onSendProgress: (int sent, int total) {//下载进度预览
        print('$sent $total');
      }
    );
    print(resp.data);
  }
```
