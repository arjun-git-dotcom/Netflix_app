import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/Home/custombutton.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

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
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://media.themoviedb.org/t/p/w533_and_h300_bestv2/tRS6jvPM9qPrrnx2KRp3ew96Yot.jpg"),
                            fit: BoxFit.fill)),
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
                  const Text(
                    'The Batman',
                    style: TextStyle(fontSize: 30, letterSpacing: -3),
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
              const Text(
                'The Batman',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Bruce Wayne is a rich orphan who has a big issue which is kept secret,he is always horny.So he decides to solve the problem by buying a product online to make him less horny but the product made him go for a rampage.',
                style: TextStyle(color: Colors.grey),
              ),
              kheight(80)
            ],
          ),
        )
      ],
    );
  }
}
