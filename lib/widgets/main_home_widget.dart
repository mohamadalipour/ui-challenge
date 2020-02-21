import 'package:flutter/material.dart';
import 'package:ui_challenge/model/show.dart';
import 'package:ui_challenge/utils/utils.dart';

import 'animated_shoe_Item.dart';
import 'common_shoe_item.dart';

class MainHomeWidget extends StatefulWidget {
  const MainHomeWidget({Key key}) : super(key: key);

  @override
  _MainHomeWidgetState createState() => _MainHomeWidgetState();
}

class _MainHomeWidgetState extends State<MainHomeWidget>
    with TickerProviderStateMixin {
  var controller;

  TabController sideBarTabController;

  int animatedShoeCount = 10;

  List<Shoe> commonShoeList;
  List<Shoe> animatedShoeList;

  get featureStyle => TextStyle(fontSize: 10);

  int currentEnablePageView = 0;

  @override
  void initState() {
    super.initState();

    commonShoeList = Utils.getMockShoeItem(animatedShoeCount);
    animatedShoeList = Utils.getMockAnimatedShoeItem(animatedShoeCount);
    controller = PageController(
      viewportFraction: 0.7,
    );

    sideBarTabController =
        TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
//      key: key,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Stack(
              children: <Widget>[
                Center(
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        currentEnablePageView = index;
                      });
                    },
                    itemCount: animatedShoeCount,
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return AnimatedShoeItem(
                        shoe: animatedShoeList[index],
                        doAnimatedPadding: currentEnablePageView != index,
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: RotatedBox(
                    quarterTurns: 3,
//                      angle: -pi / 2.0,
//                      angle: pi / 8.0,
                    child: TabBar(
                      controller: sideBarTabController,
                      labelStyle: TextStyle(),
                      labelColor: Colors.black,
                      indicatorColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: EdgeInsets.symmetric(horizontal: 2),
//                      indicatorColor: Colors.transparent,
                      unselectedLabelColor: Colors.black.withAlpha(50),
                      tabs: <Widget>[
                        Text(
                          "New",
                          maxLines: 1,
                          style: featureStyle,
                        ),
                        Text("Featured", maxLines: 1, style: featureStyle),
                        Text("Upcpmming", maxLines: 1, style: featureStyle)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
              flex: 0,
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "More",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward)
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ))),
          Expanded(
            flex: 4,
            child: Container(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: animatedShoeCount,
                  itemBuilder: (context, index) {
                    return CommonShoeItem(
                      shoe: commonShoeList[index],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
