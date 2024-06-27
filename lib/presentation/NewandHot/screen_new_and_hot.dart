import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/Home/custombutton.dart';
import 'package:netflix_app/presentation/NewandHot/widgets/comin_soon_widget.dart';
import 'package:netflix_app/presentation/NewandHot/widgets/everyones_watching.dart';

class Screennewandhot extends StatelessWidget {
  const Screennewandhot({super.key});

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
          _buildcomingsoon(context),
          _buildeveryonewatching(context)
        ]),
      ),
    );
  }
}

_buildeveryonewatching(BuildContext context) {
  return ListView.builder(
      itemBuilder: (context, index) => const Everyoneswatchingwidget());
}

_buildcomingsoon(BuildContext context) {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) => const ComingSoonWidget(),
  );
}
