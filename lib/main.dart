import 'package:flutter/material.dart';

import 'package:netflix_app/core/colors.dart';

import 'package:netflix_app/presentation/main_page/widgets/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: widgetblue,
            scaffoldBackgroundColor: backgroundColor,
           
            textTheme:
                const TextTheme(bodyLarge: TextStyle(color: widgetWhite),bodyMedium: TextStyle(color: widgetWhite) )),
        home:  ScreenmainPage(),
      ),
    );
  }
}
