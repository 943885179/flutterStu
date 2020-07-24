# HTTP请求

>使用http库
>get

```dart

  _get() async {
    print('获取get数据');
    var url = 'http://192.168.0.106:8080/menu/menuByID?ID=1';
    print(url);
    var result = await http.get(url);
    if (result.statusCode == 200) {
      var mp = json.decode(result.body);
      print(mp);
    } else {
      print(result.statusCode);
    }
  }
```

>post

```dart
  _postData() async {
    print('post请求');
    /* 特别注意,需要跟后端一起确定是否可以传，我后端使用go gin，设置得是只能接受application/json，所以这个传过去是没用的
    var result = await http.post('http://192.168.0.106:8080/user/login',
        body: {"userName": "weixiao2", "password": "123"}
        );
    if (result.statusCode == 200) {
      print(result.body);
    } else {
      print('请求失败');
    }*/
    var body =
        utf8.encode(json.encode({"userName": "weixiao2", "password": "123"}));
    var result = await http.post('http://192.168.0.106:8080/user/login',
        body: body, headers: {'Content-Type': 'application/json'});
    if (result.statusCode == 200) {
      //Utf8Decoder utf8decoder = Utf8Decoder();
      //print(json.decode(utf8decoder.convert(result.bodyBytes)));
      print(result.body);
    } else {
      print('请求失败');
    }
  }
```

## 特别注意，如果使用application/json格式就需要用uft8.encode(json.encode(map))来转换下map的格式，否则会报错，如果不设置头那么body也可以直接传map

## 特别注意，不能使用127.0.0.1等本地链接，需要在同一局域网内的ip，然后电脑防火墙打开对应的端口才能方位
