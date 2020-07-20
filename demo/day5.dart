import 'dart:convert';

import 'day5_1.dart';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

main() async {
  var x = new Stu();
  x.name = "asd";
  print(x.getName);
  print(await test());
  var url = 'https://www.googleapis.com/books/v1/volumes?q={http}';

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var itemCount = jsonResponse['totalItems'];
    print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

test() async {
  var cli = new HttpClient();
  var url = new Uri.http("www.baidu.com", "/app");
  var req = await cli.getUrl(url);
  var resp = await req.close();
  return await resp.transform(utf8.decoder).join();
}
