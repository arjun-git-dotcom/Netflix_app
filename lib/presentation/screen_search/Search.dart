import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/screen_search/searchdynamic.dart';
import 'package:netflix_app/presentation/screen_search/searchidel.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isListview = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CupertinoSearchTextField(
            backgroundColor: Colors.grey,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.cancel),
            onTap: () {
              setState(() {
                isListview = false;
              });
            },
            onSubmitted: (value) {
              if (value.isEmpty) {
                isListview = true;
              }
            },
          ),
          Expanded(
              child: isListview == true
                  ? const SearchIdle()
                  : const Searchdynamic()),
        ],
      ),
    );
  }
}
