import 'package:flutter/material.dart';
import 'package:flutter_jdshop/pages/tabs/Home.dart';
import '../pages/Tabs.dart';
import '../pages/News.dart';
import '../pages/NewsContent.dart';
import '../pages/tabs/Category.dart';
import '../pages/Login.dart';
import '../pages/tabs/Setting.dart';

//配置路由
final Map<String, Function> routes = {
  '/': (context) => Tabs(),
  '/news': (context) => NewsPage(),
  '/newscontent': (context, {arguments}) => NewsContent(arguments: arguments),
  '/user': (context) => SettingPage(),
  '/message': (context) => CategoryPage(),
  '/login': (context) => LoginPage(),
};
//固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
