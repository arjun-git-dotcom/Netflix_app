import 'package:flutter/material.dart';
import 'package:netflix_app/application/controller/controller_movie.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/presentation/Home/screen_home.dart';

import 'package:netflix_app/presentation/screen_search/title.dart';

class SearchIdle extends StatefulWidget {
  const SearchIdle({super.key});

  @override
  State<SearchIdle> createState() => _SearchIdleState();
}

class _SearchIdleState extends State<SearchIdle> {
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
                itemCount: idealposters.length,
                itemBuilder: (context, index) {
                  return Imagecontainer(
                    image: imageBase + idealposters[index].imagePath,
                    title: idealposters[index].title,
                  );
                }),
          ),
        )
      ],
    );
  }
}

class Imagecontainer extends StatelessWidget {
  final String image;
  final String title;
  const Imagecontainer({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    final Size widgetsize = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          height: widgetsize.height * 0.14,
          width: widgetsize.width * 0.4,
          decoration:
              BoxDecoration(image: DecorationImage(image: NetworkImage(image))),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
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
