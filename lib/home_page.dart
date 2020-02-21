import 'package:flutter/material.dart';
import 'package:ui_challenge/utils/utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  PageController controller;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
//    animatedList = Utils.getMockShoeItem(animatedShoeItemCount);
    controller = PageController(
      viewportFraction: 0.7,
    );
    _tabController =
        new TabController(vsync: this, length: Utils.getTabBarTitle().length);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.white),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Discover",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(margin: EdgeInsets.all(4),padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(50), shape: BoxShape.circle),
                  child: Icon(Icons.search)),
              Container(margin: EdgeInsets.all(4),padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(50), shape: BoxShape.circle),
                  child: Icon(Icons.notifications)),

            ],
          ),
          bottom: TabBar(
            isScrollable: true,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            labelColor: Colors.black,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Colors.black.withAlpha(50),
            controller: _tabController,
            tabs: Utils.getTabBarTitle(),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: Utils.getTabBarViewItem(),
        ),
      ),
    );
  }
}
