import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/Home/custombutton.dart';

class ComingSoonWidget extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  const ComingSoonWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 300,
              height: 400,
              child: const Column(
                children: [
                  Text(
                    'FEB ',
                    style: TextStyle(color: widgetWhite, fontSize: 15),
                  ),
                  Text(
                    '15',
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
            )
          ],
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.cover)),
                    height: 200,
                    width: 300,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 30, letterSpacing: -3),
                    ),
                  ),
                  kwidth(70),
                  Row(
                    children: [
                      Custombutton(
                        title: 'Remind Me',
                        icon: Icons.add_alert,
                      ),
                      kwidth(10),
                      Custombutton(title: 'info', icon: Icons.info)
                    ],
                  ),
                ],
              ),
              const Text('coming on friday'),
              kheight(10),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                desc,
                style: const TextStyle(color: Colors.grey),
              ),
              kheight(80)
            ],
          ),
        )
      ],
    );
  }
}
