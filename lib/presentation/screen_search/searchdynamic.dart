import 'package:flutter/material.dart';
import 'package:netflix_app/application/controller/controller_movie.dart';
import 'package:netflix_app/presentation/Home/screen_home.dart';
import 'package:netflix_app/presentation/screen_search/title.dart';

class Searchdynamic extends StatefulWidget {
  const Searchdynamic({super.key});

  @override
  State<Searchdynamic> createState() => _SearchdynamicState();
}

class _SearchdynamicState extends State<Searchdynamic> {
  List idealposters = [];
  Future idealmovies() async {
    idealposters = await MovieServices.getNowPopular();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idealmovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Align(
            alignment: Alignment.topLeft,
            child: STitle(title: 'Movies and TV')),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1 / 1.4,
            children: List.generate(idealposters.length, (index) {
              return ImageContainer(
                image: imageBase + idealposters[index].imagePath,
              );
            }),
          ),
        )
      ],
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String image;
  const ImageContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final Size widgetsize = MediaQuery.of(context).size;
    return Container(
      height: widgetsize.height * 0.8,
      width: widgetsize.width * 0.04,
      decoration:
          BoxDecoration(image: DecorationImage(image: NetworkImage(image))),
    );
  }
}
