import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';

import 'package:netflix_app/presentation/screen_search/title.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const STitle(title: 'Top Searches'),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Imagecontainer();
                }),
          ),
        )
      ],
    );
  }
}

class Imagecontainer extends StatelessWidget {
  const Imagecontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size widgetsize = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          height: widgetsize.height * 0.14,
          width: widgetsize.width * 0.4,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/H5HjE7Xb9N09rbWn1zBfxgI8uz.jpg'))),
        ),
        const SizedBox(width: 10),
        const Text(
          'Nice Guys',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        const Spacer(),
        const CircleAvatar(
          radius: 30,
          child: CircleAvatar(
            backgroundColor: backgroundColor,
            radius: 25,
            child: Icon(
              Icons.play_arrow,
              color: widgetWhite,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
