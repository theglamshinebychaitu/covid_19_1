import 'package:covid/constant.dart';
import 'package:covid/widget/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  final Function press;

  const InfoCard({
    Key key,
    this.title,
    this.effectedNum,
    this.iconColor,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: press,
          child: Container(
            width: constraints.maxWidth / 2 - 10,
            //Here Constraints.maxWidth provide us the available width for the widget
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: iconColor.withOpacity(0.12),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/running.svg",
                          height: 12.0,
                          width: 12.0,
                          color: iconColor,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "$effectedNum \n",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .title
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                    text: "People",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      height: 2,
                                    ))
                              ],
                              style: TextStyle(color: kTextColor),
                            )),
                      ),
                      Expanded(child: LineReportChart())
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}