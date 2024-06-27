import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/Home/custombutton.dart';

class Everyoneswatchingwidget extends StatelessWidget {
  const Everyoneswatchingwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Friends',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const Text(
          'This sitcom follows six 20 plus something friends who have diarrhea.',
          style: TextStyle(color: Colors.grey),
        ),
        kheight(50),
        Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://media.themoviedb.org/t/p/w533_and_h300_bestv2/tRS6jvPM9qPrrnx2KRp3ew96Yot.jpg"),
                      fit: BoxFit.fill)),
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
