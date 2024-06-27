import 'package:flutter/material.dart';

class STitle extends StatelessWidget {
  final String title;
  const STitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
    );
  }
}
