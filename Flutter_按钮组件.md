# Flutter_按钮组件

```dart
import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  MePage({Key key}) : super(key: key);

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text('普通按钮'),
              ),
              SizedBox(
                width: 10,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('有色按钮'),
                color: Colors.blue, //背景色
                textColor: Colors.white, //文字颜色
              ),
              SizedBox(
                width: 10,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('阴影按钮'),
                color: Colors.blue, //背景色
                textColor: Colors.white, //文字颜色
                elevation: 20, //阴影
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 100,
                height: 50,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('自定义高度宽度按钮'),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('自适应按钮'),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text('圆角按钮'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              RaisedButton(
                  onPressed: () {},
                  child: Text('圆形按钮'),
                  shape: CircleBorder(side: BorderSide(color: Colors.white))),
              RaisedButton(
                onPressed: () {},
                child: Text('长按水波纹修改按钮'),
                splashColor: Colors.red, //长按水波纹颜色
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: null,
                child: Text('扁平按钮'),
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              OutlineButton(
                onPressed: () => {},
                child: Text('没有背景色'),
                color: Colors.orange,
              ),
              IconButton(icon: Icon(Icons.settings), onPressed: null) //图标按钮
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonBar(
                children: <Widget>[
                  OutlineButton(
                    onPressed: () => {},
                    child: Text('按钮组一'),
                    color: Colors.orange,
                  ),
                  OutlineButton(
                    onPressed: () => {},
                    child: Text('按钮组二'),
                    color: Colors.orange,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

//自定义按钮组
class MyButton extends StatelessWidget {
  String text;
  MyButton({this.text = '测试'});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      child: Text(this.text),
    );
  }
}

```