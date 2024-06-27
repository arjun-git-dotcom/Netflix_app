import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_app/core/colors.dart';

class Custombutton extends StatelessWidget {
  String title;
  IconData icon;
  Custombutton({required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: widgetWhite,
          size: 20,
        ),
        Text(
          title,
          style: const TextStyle(color: widgetWhite, fontSize: 10),
        )
      ],
    );
  }
}
