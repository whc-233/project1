import 'package:flutter/material.dart';
import 'tabs/Home.dart';
import 'tabs/Category.dart';
import 'tabs/Setting.dart';

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key? key, this.index = 0}) : super(key: key);

  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  int _currentIndex;
  _TabsState(this._currentIndex);

  List _pageList = [
    HomePage(),
    CategoryPage(),
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex, //配置对应的索引值选中
        onTap: (int index) {
          setState(() {
            //改变状态
            this._currentIndex = index;
          });
        },
        iconSize: 36.0, //icon的大小
        fixedColor: Colors.red, //选中的颜色
        type: BottomNavigationBarType.fixed, //配置底部tabs可以有多个按钮
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "个人")
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: UserAccountsDrawerHeader(
                  accountName: Text("用户3303"),
                  accountEmail: Text("3303.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.itying.com/images/flutter/3.png"),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                        "https://www.itying.com/images/flutter/2.png"),
                    fit: BoxFit.cover,
                  )),
                  otherAccountsPictures: <Widget>[
                    Image.network(
                        "https://www.itying.com/images/flutter/4.png"),
                    Image.network(
                        "https://www.itying.com/images/flutter/5.png"),
                  ],
                ))
              ],
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.home)),
              title: Text("我的消息"),
              onTap: () {
                Navigator.of(context).pop(); //隐藏侧边栏
                Navigator.pushNamed(context, '/message');
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.people)),
              title: Text("用户中心"),
              // onTap: () {
              //   Navigator.of(context).pop(); //隐藏侧边栏
              //   Navigator.pushNamed(context, '/user');
              // },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.settings)),
              title: Text("退出登录"),
              onTap: () {
                Navigator.of(context).pop(); //隐藏侧边栏
                Navigator.pushNamed(context, '/login');
              },
            ),
            Divider(),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.settings)),
              title: Text("设置"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.border_clear)),
              title: Text("我的二维码"),
            ),
            Divider(),
            ListTile(
              leading:
                  CircleAvatar(child: Icon(Icons.access_time_filled_outlined)),
              title: Text("观看历史"),
              // onTap: () {
              //   Navigator.of(context).pop(); //隐藏侧边栏
              //   Navigator.pushNamed(context, '/login');
              // },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.timelapse_sharp)),
              title: Text("时间管理"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.people)),
              title: Text("创作者服务中心"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.quick_contacts_dialer)),
              title: Text("客服"),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
