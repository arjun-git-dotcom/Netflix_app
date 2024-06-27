import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/Fast_Laugh/video_list.dart';

class Screenfastlaugh extends StatelessWidget {
  const Screenfastlaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(10, (index) {
            return VideoList(
              index: index,
            );
          }),
        ),
      ),
    );
  }
}
