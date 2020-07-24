import 'dart:convert';

main() {
  var maps = {'name': "weixiao", 'email': '943885179@qq.com'};
  var jsonStr = '{"name":"mzj"}';
  print(json.encode(maps)); //map转json字符串
  print(json.decode(jsonStr)); //json字符串转map
}
