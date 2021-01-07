import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keva_health/UI/surveyPage.dart';
import 'package:video_player/video_player.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(12),
            child: Text.rich(
              TextSpan(
                  text: 'keva health',
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: screen.height * 0.0375,
                    color: Color(0xFF426CB4),
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screen.height * 0.125),
            child: DemoVideo(),
          ),
        ]),
      ),
    );
  }
}

class DemoVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: VideoPlayerRemote(
          url: "assets/keva.mp4",
        ),
      ),
    );
  }
}

class VideoPlayerRemote extends StatefulWidget {
  final String url;
  VideoPlayerRemote({this.url});
  @override
  _VideoPlayerRemoteState createState() => _VideoPlayerRemoteState();
}

class _VideoPlayerRemoteState extends State<VideoPlayerRemote> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      widget.url, //to access its parent class constructor or variable
    );
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true); //loop through video
    _controller.initialize(); //initialize the VideoPlayer
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose(); //dispose the VideoPlayer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  _PlayPauseOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: screen.height * 0.25),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(
                  horizontal: screen.width * 0.125,
                  vertical: screen.height * 0.01),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () => [
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return SurveyPage();
                })),
                _controller.pause()
              ],
              color: Color(0xFF426CB4),
              child: Text("Ok, let's do it!",
                  style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      color: Colors.white,
                      fontSize: screen.height * 0.025)),
            ),
          )
        ],
      ),
    );
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
          },
        ),
      ],
    );
  }
}
