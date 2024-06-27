import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/presentation/Home/screen_home.dart';

class Numbercard extends StatelessWidget {
  final Size widgetsize;
  final int index;

  const Numbercard({required this.widgetsize, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            ImageContainer(widgetsize: widgetsize),
          ],
        ),
        Positioned(
          left: -3,
          bottom: -50,
          child: BorderedText(
            strokeWidth: 5,
            strokeColor: widgetWhite,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                  color: backgroundColor),
            ),
          ),
        ),
      ],
    );
  }
}
