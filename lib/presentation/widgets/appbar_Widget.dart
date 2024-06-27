import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth(10),
        Text(
          'Downloads',
          style:
              GoogleFonts.montserrat(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          size: 30,
          color: widgetWhite,
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          height: 30,
          width: 30,
          color: widgetblue,
        )
      ],
    );
  }
}
