main() {
  test4("123");
  test5();
  test6(a: "aaa");
  test7(fu1);
}

//设置返回值类型
int test() {
  return 1;
}

//返回值类型不确定
test1(i) {
  return i;
}

//设置输入和返回值类
int test2(int i) {
  return i;
}

//无返回值
void test3() {}
//可选参数
void test4(String a, [String b]) {
  print(a);
  print(b);
}

//默认参数
void test5([String a = "123s"]) {
  print(a);
}
//命名参数 ，必须指定名称

void test6({String a, String b = "123"}) {
  print(a);
}

//方法做参数
fu1() {
  print(1231);
}

test7(fn) {
  fn();
}
