import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black26,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TabBar(
                    isScrollable: true, //如果多个按钮的话可以滑动
                    indicatorColor: Colors.yellow,
                    labelColor: Colors.yellow,
                    unselectedLabelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,

                    tabs: <Widget>[
                      Tab(text: "关注的作品推荐"),
                      Tab(text: "粉丝"),
                      Tab(text: "关注的人"),
                      Tab(text: "评论回复"),
                      Tab(text: "作品点赞"),
                      Tab(text: "作品评论"),
                      Tab(text: "评论点赞"),
                      Tab(text: "私信")
                    ],
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  ListTile(title: Text("第一条作品")),
                  ListTile(title: Text("第二条作品")),
                  ListTile(title: Text("第三条作品"))
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(title: Text("第一个粉丝")),
                  ListTile(title: Text("第二个粉丝")),
                  ListTile(title: Text("第三个粉丝"))
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(title: Text("第一个关注")),
                  ListTile(title: Text("第二个关注")),
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(title: Text("第一个评论回复")),
                  ListTile(title: Text("第二个评论回复"))
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(title: Text("第一个作品点赞")),
                  ListTile(title: Text("第二个作品点赞")),
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(title: Text("第一个作品评论")),
                  ListTile(title: Text("第二个作品评论")),
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(title: Text("第一个评论点赞")),
                  ListTile(title: Text("第二个评论点赞"))
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(title: Text("第一个私信")),
                  ListTile(title: Text("第二个私信"))
                ],
              )
            ],
          )),
    );
  }
}
