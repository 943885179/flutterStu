/*
//入口方法
main(){
    print('你好 dart');
}
*/
//或者

void main() {
  print("hello world");

//变量定义
  var str = "123";
  String s = "cs"; //字符串类型
  var tt = '''
    摸索
    阿斯达
让我去
  ''';
  int i = 0; //数组类型
  double b = 11.24;
  b = 22.1;
  print(str);
  print(s);
  print(i);
  print(tt);
  print("$str $i $b");
  //list
  var l1 = [1, '123', true];
  var l2 = new List();
  var l3 = new List<int>();
  l3.add(1);
  print(l3);
  l2.add(l1);
  print(l2);
  print(l1);
  print(l1.length);
  print(l1[1]);
  print("item");
  for (var item in l1) {
    print(item);
  }
  var x = l1.reversed.toList(); //反转
  print(x);
  l1.addAll(x); //增加多个数据
  l1.add("value");
  print('删除');
  l1.remove('123');
  print('是否存在');
  print(l1.indexOf('123')); //查询是否存在
  print('输出');
  print(l1);
  //map
  var person = {"name": "张三", "arg": 20};
  print(person);
  print(person["name"]);
  var p = new Map();
  p["name"] = "weixiao";
  p["arg"] = 21;
  print(p);
  //类型判断 is
  if (str is String) {
    print("这个是一个string类型");
  }
}

void name(args) {}
