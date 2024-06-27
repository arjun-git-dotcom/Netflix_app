import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/presentation/Fast_Laugh/screen_fast_laugh.dart';
import 'package:netflix_app/presentation/Home/screen_home.dart';
import 'package:netflix_app/presentation/NewandHot/screen_new_and_hot.dart';
import 'package:netflix_app/presentation/downloads/screen_download.dart';

import 'package:netflix_app/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_app/presentation/screen_search/Search.dart';

class ScreenmainPage extends StatelessWidget {
  ScreenmainPage({super.key});
  final pages = [
    const ScreenHome(),
    const Screennewandhot(),
    const Screenfastlaugh(),
    const Search(),
    Screendownloads()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ValueListenableBuilder(
          valueListenable: navnotifier,
          builder: (context, index, _) {
            return pages[index];
          }),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
