import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/screen_search/searchdynamic.dart';
import 'package:netflix_app/presentation/screen_search/searchidel.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CupertinoSearchTextField(
            backgroundColor: Colors.grey,
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.cancel),
          ),
          Expanded(child: SearchIdle()),
          // Expanded(child: Searchdynamic())
        ],
      ),
    );
  }
}
