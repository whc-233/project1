import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
//注意：Flutter2.2.0之后的版本需要引入下面几个包
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:html/dom.dart' as dom;

// ignore: must_be_immutable
class NewsContent extends StatefulWidget {
  Map arguments;
  NewsContent({Key? key, required this.arguments}) : super(key: key);
  _NewsContentState createState() => _NewsContentState(this.arguments);
}

class _NewsContentState extends State<NewsContent> {
  Map arguments;
  List _list = [];

  _NewsContentState(this.arguments);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(this.arguments);
    this._getData();
  }

  _getData() async {
    var apiUrl =
        "http://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=${this.arguments["aid"]}";
    var response = await Dio().get(apiUrl);

    setState(() {
      this._list = json.decode(response.data)["result"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("新闻详情"),
          backgroundColor: Colors.red.shade300,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_match%2F0%2F11958660244%2F0.jpg&refer=http%3A%2F%2Finews.gtimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1652256130&t=4f7eff8020e2be0fc4df1c611b83b6ca"),
                      fit: BoxFit.fill)),
            ),
            Text(
              "${this._list.length > 0 ? this._list[0]["title"] : ''}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36),
            ),
            // Text("${this._list.length>0?this._list[0]["content"]:''}")
            Padding(
                padding: EdgeInsets.all(10),
                child: Html(
                    data: """
              ${this._list.length > 0 ? this._list[0]["content"] : ''}
            """,
                    onLinkTap: (String? url, RenderContext context,
                        Map<String, String> attributes, dom.Element? element) {
                      //open URL in webview, or launch URL in browser, or any other logic here
                    },
                    style: {
                      "html": Style(
                        backgroundColor: Colors.white,
                      ),
                      "p": Style(fontSize: FontSize.large),
                      "table": Style(
                        backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                      ),
                      "tr": Style(
                        border: Border(bottom: BorderSide(color: Colors.grey)),
                      ),
                      "th": Style(
                        padding: EdgeInsets.all(6),
                        backgroundColor: Colors.grey,
                      ),
                      "td": Style(
                        padding: EdgeInsets.all(6),
                        alignment: Alignment.topLeft,
                      ),
                    },
                    onImageTap: (String? url, RenderContext context,
                        Map<String, String> attributes, dom.Element? element) {
                      //open image in webview, or launch image in browser, or any other logic here
                    })),
            SizedBox(
              height: 50,
            ),
          ],
        ));
  }
}
