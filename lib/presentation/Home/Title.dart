import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String title;
  const MyWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
    );
  }
}
