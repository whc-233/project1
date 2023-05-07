import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<SettingPage> {
  List menuTitles = [
    '我的消息',
    '阅读记录',
    '我的博客',
    '我的问答',
    '我的活动',
    '我的团队',
    '邀请好友',
  ];
  List menuIcons = [
    Icons.message,
    Icons.print,
    Icons.error,
    Icons.phone,
    Icons.send,
    Icons.people,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(children: <Widget>[
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
            ]);
          }
          index -= 1;
          return ListTile(
            leading: Icon(menuIcons[index]), //左图标
            title: Text(menuTitles[index]), //中间标题
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        }, //分隔线
        itemCount: menuTitles.length + 1);
  }
}
