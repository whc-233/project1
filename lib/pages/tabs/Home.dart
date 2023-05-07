import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    videoPlayerController = VideoPlayerController.network(
        'https://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4');

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
  }

  /*销毁*/
  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  Widget _swiperWidget() {
    List<Map> imgList = [
      {
        "url":
            "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV3c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
      },
      {
        "url":
            "https://images.unsplash.com/photo-1504711434969-e33886168f5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bmV3c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
      },
      {
        "url":
            "https://images.unsplash.com/photo-1585776245991-cf89dd7fc73a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bmV3c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
      },
    ];

    return Container(
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                imgList[index]["url"],
                fit: BoxFit.fill,
              );
            },
            itemCount: imgList.length,
            pagination: new SwiperPagination(),
            autoplay: true),
      ),
    );
  }

  Widget _aWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        RaisedButton(
          child: Text('跳转到更多新闻'),
          onPressed: () {
            Navigator.pushNamed(context, '/news');
          },
        ),
        SizedBox(height: 20),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      _swiperWidget(),
      SizedBox(height: 20),
      Center(
          child: Container(
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Chewie(
            controller: chewieController,
          ),
        ),
      )),
      SizedBox(height: 20),
      _aWidget(),
    ]);
  }
}
