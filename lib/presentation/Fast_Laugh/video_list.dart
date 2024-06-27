import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';

class VideoList extends StatelessWidget {
  final int index;
  const VideoList({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    Size widgetsize = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        color: Colors.accents[index % Colors.accents.length],
      ),
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
