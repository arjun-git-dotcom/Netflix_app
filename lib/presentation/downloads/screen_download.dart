import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/presentation/widgets/appbar_Widget.dart';

class Screendownloads extends StatelessWidget {
  Screendownloads({super.key});
  final List imageList = [
    "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
    "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/lW6IHrtaATxDKYVYoQGU5sh0OVm.jpg",
    "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/AcKVlWaNVVVFQwro3nLXqPljcYA.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    Size widgetsize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: AppbarWidget()),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.settings,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Smart Downloads',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Introducing Downloads for You',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 27),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            textAlign: TextAlign.center,
            "We'll download a personalised selection of movies and shows for you,so there's always something to watch on your device",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 182, 177, 177)),
          ),
          Container(
              height: widgetsize.width,
              width: widgetsize.width,
              color: backgroundColor,
              child: Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(217, 141, 137, 137),
                      radius: widgetsize.width * 0.39,
                    ),
                  ),
                  Positioned(
                    right: widgetsize.width * 0.09,
                    top: widgetsize.height * 0.1,
                    child: CircleContainer(
                        size: widgetsize,
                        imageList: imageList,
                        i: 0,
                        radian: 15,
                        scale: 0.9),
                  ),
                  Positioned(
                    top: widgetsize.height * 0.1,
                    left: widgetsize.height * 0.03,
                    child: CircleContainer(
                      size: widgetsize,
                      imageList: imageList,
                      radian: -15,
                      i: 2,
                      scale: 0.9,
                    ),
                  ),
                  Positioned(
                    left: widgetsize.width * 0.3,
                    top: widgetsize.height * 0.08,
                    child: CircleContainer(
                      size: widgetsize,
                      imageList: imageList,
                      i: 1,
                      radian: 0,
                      scale: 1,
                    ),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SizedBox(
              height: widgetsize.height * 0.06,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 55, 86, 198),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: const Text(
                  'Set Up',
                  style: TextStyle(color: widgetWhite, fontSize: 18),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: widgetsize.width * 0.05,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {},
                  child: const Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'See What You can Download',
                        style: TextStyle(
                            color: backgroundColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      ),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class CircleContainer extends StatelessWidget {
  final Size size;
  final List imageList;
  final int i;
  final int radian;
  final double scale;

  const CircleContainer(
      {Key? key,
      required this.size,
      required this.imageList,
      required this.radian,
      required this.i,
      required this.scale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size widgetsize = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: radian * pi / 180,
      child: Container(
        width: widgetsize.width * 0.4 * scale,
        height: widgetsize.height * 0.3 * scale,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: NetworkImage(imageList[i]))),
      ),
    );
  }
}
