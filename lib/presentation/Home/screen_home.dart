import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/application/controller/controller_movie.dart';
import 'package:netflix_app/application/model/movie_model.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/Home/Title.dart';
import 'package:netflix_app/presentation/Home/custombutton.dart';
import 'package:netflix_app/presentation/Home/numberCard.dart';
import 'package:netflix_app/presentation/screen_search/title.dart';

const String imageBase = 'https://image.tmdb.org/t/p/w500/';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List nowplaying = [];
  List toprated = [];
  List popular = [];
  List upcoming = [];

  Future getAllmovies() async {
    nowplaying = await MovieServices.getNowPlaying();
    toprated = await MovieServices.getTopRated();
    popular = await MovieServices.getNowPopular();
    upcoming = await MovieServices.getUpcoming();
    setState(() {});
  }

  @override
  void initState() {
    getAllmovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
    final Size widgetsize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ValueListenableBuilder(
              valueListenable: scrollNotifier,
              builder: (context, index, _) {
                return NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;

                    if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false;
                    } else if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true;
                    }
                    return true;
                  },
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: widgetsize.height * 0.7,
                                width: widgetsize.width,
                                decoration: const BoxDecoration(
                                    color: widgetWhite,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://media.themoviedb.org/t/p/w220_and_h330_face/woznEiocvx8HMYKB2KloHATrDji.jpg'),
                                        fit: BoxFit.fill)),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Custombutton(
                                        title: 'My List', icon: Icons.add),
                                    SizedBox(
                                      height: 33,
                                      width: 100,
                                      child: TextButton.icon(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                            backgroundColor: widgetWhite,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .zero)),
                                        label: const Text(
                                          'Play',
                                          style:
                                              TextStyle(color: backgroundColor),
                                        ),
                                      ),
                                    ),
                                    Custombutton(
                                        title: 'info', icon: Icons.info)
                                  ],
                                ),
                              )
                            ],
                          ),
                          const MyWidget(title: 'Released in the Past year'),
                          RefactorPoster(
                              widgetsize: widgetsize,
                              movies: nowplaying,
                              title: 'Released in the Past year'),
                          const MyWidget(title: 'Trending Now'),
                          RefactorPoster(
                            widgetsize: widgetsize,
                            title: 'Trending Now',
                            movies: popular,
                          ),
                          const MyWidget(title: 'Top 10 shows in TV'),
                          LimitedBox(
                            maxHeight: 200,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                    popular.length,
                                    (index) => Numbercard(
                                          widgetsize: widgetsize,
                                          index: index,
                                          url: imageBase +
                                              popular[index].imagePath,
                                        ))),
                          ),
                          const MyWidget(title: 'Tense Dramas'),
                          RefactorPoster(
                            widgetsize: widgetsize,
                            title: 'Tense Dramas',
                            movies: upcoming,
                          ),
                          const MyWidget(title: 'South Indian Movies'),
                          RefactorPoster(
                            widgetsize: widgetsize,
                            title: 'South Indian Movies',
                            movies: upcoming,
                          ),
                        ],
                      ),
                      scrollNotifier.value == true
                          ? Container(
                              width: double.infinity,
                              height: 90,
                              color: Colors.black.withOpacity(0.3),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        height: 65,
                                        width: 65,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.vox-cdn.com%2Fthumbor%2FtDepA4mL6z91gmGzhqflNMINUy0%3D%2F0x0%3A3840x2560%2F1200x800%2Ffilters%3Afocal(1613x973%3A2227x1587)%2Fcdn.vox-cdn.com%2Fuploads%2Fchorus_image%2Fimage%2F67710150%2Fnetflix_n_icon_logo_3840.0.jpg&f=1&nofb=1&ipt=119fd17c72fd67ba6e2cf04a7861c193e545cd1d270fa53b2aabf9f85d052984&ipo=images'))),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.cast,
                                        size: 40,
                                      ),
                                      kwidth(10),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpng.pngtree.com%2Fpng-clipart%2F20210727%2Fourmid%2Fpngtree-smiling-blue-square-geometric-emoji-png-image_3716651.jpg&f=1&nofb=1&ipt=863c3dc603b733118831018222e75205cbf4a6516bc7d6ba04de002573393bf8&ipo=images'),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'TV Shows',
                                        style: TextStyle(
                                            color: widgetWhite,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text('Movies',
                                          style: TextStyle(
                                              color: widgetWhite,
                                              fontWeight: FontWeight.w900)),
                                      Text('Categories',
                                          style: TextStyle(
                                              color: widgetWhite,
                                              fontWeight: FontWeight.w900))
                                    ],
                                  )
                                ],
                              ),
                            )
                          : kheight(10)
                    ],
                  ),
                );
              })),
    );
  }
}

class RefactorPoster extends StatelessWidget {
  const RefactorPoster(
      {super.key,
      required this.widgetsize,
      required this.movies,
      required this.title});

  final Size widgetsize;
  final List movies;
  final String title;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 200,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
              movies.length,
              (index) => ImageContainer(
                    widgetsize: widgetsize,
                    image: imageBase + movies[index].imagePath,
                  ))),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {super.key, required this.widgetsize, required this.image});

  final Size widgetsize;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widgetsize.height * 0.4,
      width: widgetsize.width * 0.4,
      decoration:
          BoxDecoration(image: DecorationImage(image: NetworkImage(image))),
    );
  }
}
