import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/application/controller/controller_movie.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/Home/custombutton.dart';
import 'package:netflix_app/presentation/Home/screen_home.dart';
import 'package:netflix_app/presentation/NewandHot/widgets/comin_soon_widget.dart';
import 'package:netflix_app/presentation/NewandHot/widgets/everyones_watching.dart';

class Screennewandhot extends StatefulWidget {
  const Screennewandhot({super.key});

  @override
  State<Screennewandhot> createState() => _ScreennewandhotState();
}

class _ScreennewandhotState extends State<Screennewandhot> {
  List popular = [];
  List upcoming = [];
  bool isLoading = true;
  bool isError = false;

  Future upcomingMovies() async {
    try {
      List movies = await MovieServices.getUpcoming();
      List popularMovies =
          await MovieServices.getNowPopular(); // Fix variable shadowing
      if (mounted) {
        setState(() {
          upcoming = movies;
          popular = popularMovies; // Use the correct variable here
          isLoading = false;
        });
      }
    } catch (e) {
      print('The error is $e');
      if (mounted) {
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: backgroundColor,
            title: Row(
              children: [
                kwidth(10),
                Text(
                  'Hot & New',
                  style: GoogleFonts.montserrat(
                      color: widgetWhite,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                const Icon(
                  Icons.cast,
                  color: widgetWhite,
                ),
                const SizedBox(width: 10),
                Container(
                  height: 30,
                  width: 30,
                  color: widgetblue,
                ),
              ],
            ),
            bottom: TabBar(
                dividerHeight: 0,
                indicator: BoxDecoration(
                    color: widgetWhite,
                    borderRadius: BorderRadiusDirectional.circular(8)),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Text('🍿Coming Soon'),
                  Text('👀 Everyones watching')
                ]),
          ),
        ),
        body: TabBarView(children: [
          Buildcomingsoon(upcoming: upcoming),
          BuildEveryone(popular: popular),
        ]),
      ),
    );
  }
}

class Buildcomingsoon extends StatelessWidget {
  final List upcoming;
  const Buildcomingsoon({super.key, required this.upcoming});

  @override
  Widget build(BuildContext context) {
    if (upcoming.isEmpty) {
      return const Center(child: Text('No upcoming movies available.'));
    }
    return ListView.builder(
        itemCount: upcoming.length,
        itemBuilder: (context, index) => ComingSoonWidget(
              image: imageBase + upcoming[index].imagePath,
              title: upcoming[index].title,
              desc: upcoming[index].overview,
             
            ));
  }
}

class BuildEveryone extends StatelessWidget {
  final List popular;
  const BuildEveryone({super.key, required this.popular});

  @override
  Widget build(BuildContext context) {
    if (popular.isEmpty) {
      return const Center(child: Text('No popular movies available.'));
    }
    return ListView.builder(
        itemCount: popular.length,
        itemBuilder: (context, index) => Everyoneswatchingwidget(
              image: imageBase + popular[index].imagePath,
              moviename: popular[index].title,
              desc: popular[index].overview,
            ));
  }
}
