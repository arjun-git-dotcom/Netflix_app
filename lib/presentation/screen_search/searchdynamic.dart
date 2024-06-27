import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/screen_search/title.dart';

class Searchdynamic extends StatelessWidget {
  const Searchdynamic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const STitle(title: 'Movies and TV'),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1 / 1.4,
            children: List.generate(18, (index) {
              return const ImageContainer();
            }),
          ),
        )
      ],
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size widgetsize = MediaQuery.of(context).size;
    return Container(
      height: widgetsize.height * 0.8,
      width: widgetsize.width * 0.04,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/aBkqu7EddWK7qmY4grL4I6edx2h.jpg'))),
    );
  }
}
