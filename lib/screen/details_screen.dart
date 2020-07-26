import 'package:covid/constant.dart';
import 'package:covid/widget/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final String effectedNum;

  const DetailsScreen({
    Key key,
    this.title,
    this.effectedNum
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDetailsAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 21),
                    blurRadius: 53,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildTitleWithMoreIcon(title),
                  SizedBox(
                    height: 15.0,
                  ),
                  buildCaseNumber(context, effectedNum),
                  SizedBox(height: 15,),
                  Text(
                    "From Health Center",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        color: kTextMediumColor),
                  ),
                  SizedBox(height: 15,),
                  WeeklyChart(),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      buildInfoTextWithPercentage(percentage: "6.43", title: "From Last Week"),
                      buildInfoTextWithPercentage(percentage: "9.43", title: "Recovery Rate"),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 21),
                    blurRadius: 54,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Global Map",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      ),
                      SvgPicture.asset("assets/icons/more.svg"),
                    ],
                  ),
                  SizedBox(height: 10,),
                  SvgPicture.asset("assets/icons/map.svg"),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  RichText buildInfoTextWithPercentage({String title, String percentage}) {
    return RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "$percentage% \n",
                              style: TextStyle(
                                fontSize: 20,
                                color: kPrimaryColor,
                              ),
                            ),
                            TextSpan(
                              text: title,
                              style: TextStyle(
                                color: kTextMediumColor,
                                height: 1.5,
                              )
                            )
                          ]
                        ));
  }

  Row buildCaseNumber(BuildContext context, String number) {
    return Row(
      children: <Widget>[
        Text(
          number + "",
          style: Theme.of(context)
              .textTheme
              .display3
              .copyWith(color: kPrimaryColor, height: 1.2),
        ),
        Text(
          "5.9%",
          style: TextStyle(color: kPrimaryColor),
        ),
        SvgPicture.asset("assets/icons/increase.svg"),
      ],
    );
  }

  Row buildTitleWithMoreIcon(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
         title,
          style: TextStyle(
            color: kTextMediumColor,
            fontWeight: FontWeight.w600,
            fontSize: 15.0,
          ),
        ),
        SvgPicture.asset("assets/icons/more.svg")
      ],
    );
  }

  AppBar buildDetailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"), onPressed: () {})
      ],
    );
  }
}
