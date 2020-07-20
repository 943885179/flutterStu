main() {
  print(123);
  var a = 5;
  var b = 3;
  print(a ~/ b); //取整
  int c;
  c ??= 1; //表示c是否为空不为空的话赋值1
  print(c);
  var s = true;
  String st;
  st = s ? "asd" : "dd";
  print(st);

  //类型转化
  var str = "123";
  var myNum = int.parse(str);
  var myNum1 = double.parse(str);
  print(myNum is int);
  var str1 = myNum.toString();
  print(str1);
  // try catch
  try {
    var str = "";
    if (str.isEmpty) {
      print("空");
    }
    var myNum = int.parse(str);
  } catch (err) {
    print("错误了");
    print(err);
  }
}
