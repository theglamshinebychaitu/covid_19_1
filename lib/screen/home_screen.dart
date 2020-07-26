import 'package:covid/constant.dart';
import 'package:covid/screen/details_screen.dart';
import 'package:covid/widget/info_card.dart';
import 'package:covid/widget/line_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding:
            EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 40.0),
            width: double.infinity,
            decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(.03),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
            child: Wrap(
              runSpacing: 20.0,
              spacing: 20.0,
              children: <Widget>[
                InfoCard(
                  title: "Confirmed Cases",
                  effectedNum: 1062,
                  iconColor: Color(0xFFFF8C00),
                  press: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return DetailsScreen(title: "Confirmed cases",
                      effectedNum: "1062",
                      );
                    }));
                  },
                ),
                InfoCard(
                  title: "Total Deaths",
                  effectedNum: 75,
                  iconColor: Color(0xFFFF2D55),
                  press: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return DetailsScreen(title: "Total Deathss",
                        effectedNum: "75",
                      );
                    }));
                  },
                ),
                InfoCard(
                  title: "Total Recovered",
                  effectedNum: 689,
                  iconColor: Color(0xFF50E3C2),
                  press: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return DetailsScreen(title: "Total Recovered",
                        effectedNum: "689",
                      );
                    }));
                  },
                ),
                InfoCard(
                  title: "New Cases",
                  effectedNum: 52,
                  iconColor: Color(0xFF5856D6),
                  press: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return DetailsScreen(title: "New Cases",
                        effectedNum: "52",
                      );
                    }));
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Preventions",
                    style: Theme
                        .of(context)
                        .textTheme
                        .title
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  buildPrevention(),
                  SizedBox(
                    height: 40.0,
                  ),
                  buildHelpCard(context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildPrevention() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        PreventionCard(
          svgSrc: "assets/icons/hand_wash.svg",
          title: "Wash Hands",
        ),
        PreventionCard(
          svgSrc: "assets/icons/use_mask.svg",
          title: "Use Masks",
        ),
        PreventionCard(
          svgSrc: "assets/icons/Clean_Disinfect.svg",
          title: "Clean Disinfect",
        ),
      ],
    );
  }

  Container buildHelpCard(BuildContext context) {
    return Container(
      height: 150.0,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery
                  .of(context)
                  .size
                  .width * 0.4,
              top: 20.0,
            ),
            height: 130.0,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF60BE93),
                Color(0xFF1B8D59),
              ]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Dial 144 for \nMedical Help!\n",
                    style: Theme
                        .of(context)
                        .textTheme
                        .title
                        .copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: "If any symptoms appear",
                    style:
                    TextStyle(color: Colors.white.withOpacity(0.7)),
                  ),
                ])),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset("assets/icons/nurse.svg"),
          ),
          Positioned(
              top: 30,
              right: 10,
              child: SvgPicture.asset("assets/icons/virus.svg"))
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: () {}),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {}),
      ],
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String svgSrc;
  final String title;

  const PreventionCard({
    Key key,
    this.svgSrc,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(svgSrc),
        SizedBox(
          height: 20.0,
        ),
        Text(
          title,
          style:
          Theme
              .of(context)
              .textTheme
              .body2
              .copyWith(color: kPrimaryColor),
        )
      ],
    );
  }
}
