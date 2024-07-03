import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/Home/custombutton.dart';
import 'package:netflix_app/presentation/Home/screen_home.dart';

class Everyoneswatchingwidget extends StatelessWidget {
  final String image;
  final String moviename;
  final String desc;
  const Everyoneswatchingwidget(
      {super.key,
      required this.image,
      required this.moviename,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            moviename,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          desc,
          style: const TextStyle(color: Colors.grey),
        ),
        kheight(50),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover)),
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
            const Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: backgroundColor,
                child: Icon(
                  Icons.volume_mute,
                  color: widgetWhite,
                ),
              ),
            ),
          ],
        ),
        kheight(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Custombutton(icon: Icons.share, title: 'share'),
            kwidth(10),
            Custombutton(
              icon: Icons.add,
              title: 'My List',
            ),
            kwidth(10),
            Custombutton(
              icon: Icons.play_arrow,
              title: 'Play',
            )
          ],
        )
      ],
    );
  }
}
