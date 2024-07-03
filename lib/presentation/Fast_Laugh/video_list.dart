import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:video_player/video_player.dart';

class VideoList extends StatelessWidget {
  final int index;
  final String videoUrl;
  const VideoList({required this.index, required this.videoUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      VideoPlayerWidget(videoUrl: videoUrl),
      const Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: backgroundColor,
                child: Icon(
                  Icons.volume_mute,
                  color: widgetWhite,
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 25,
                ),
                kheight(20),
                const VideoActionWidgets(
                  icon: Icon(
                    Icons.emoji_emotions,
                    color: widgetWhite,
                    size: 30,
                  ),
                  title: '',
                ),
                const VideoActionWidgets(
                  icon: Icon(
                    Icons.add,
                    color: widgetWhite,
                    size: 30,
                  ),
                  title: '',
                ),
                const VideoActionWidgets(
                    icon: Icon(
                      Icons.share,
                      color: widgetWhite,
                      size: 30,
                    ),
                    title: ''),
                const VideoActionWidgets(
                    icon: Icon(
                      Icons.play_arrow,
                      color: widgetWhite,
                      size: 30,
                    ),
                    title: ''),
              ],
            ),
          ],
        ),
      )
    ]);
  }
}

class VideoActionWidgets extends StatelessWidget {
  final Icon icon;
  final String title;
  const VideoActionWidgets(
      {required this.icon, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        Text(
          title,
        ),
      ],
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerWidget({required this.videoUrl, super.key});

  @override
  State<VideoPlayerWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _controller!.initialize().then((_) => setState(() {
          _controller!.play();
        }));
    _controller!.setLooping(true);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: Stack(
          children: [VideoPlayer(_controller!)],
        ),
      ),
    );
  }
}
