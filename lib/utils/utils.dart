import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge/model/show.dart';
import 'package:ui_challenge/widgets/main_home_widget.dart';

class Utils {
  static List<Widget> getTabBarTitle() {
    var list = List<Widget>();

    list.add(Text("nike"));
    list.add(Text("tanTak"));
    list.add(Text("puma"));
    list.add(Text("addidas"));
    list.add(Text("361"));
    list.add(Text("eco"));
    list.add(Text("rebooke"));
    list.add(Text("meli"));
    list.add(Text("viena"));
    list.add(Text("cr7"));
    list.add(Text("levise"));
    list.add(Text("skechers"));
    return list;
  }

  static List<Shoe> getMockAnimatedShoeItem(int itemCount) {
    return List<Shoe>.generate(
        itemCount,
        (int index) => Shoe(
            id: index,
            brandName: "brand $index",
            isLiked: false,
            price: Random().nextInt(113 * 10).toString(),
            title: "title $index",
            status: ShoeStatus.newShoe,color: randomColors[Random().nextInt(1000)%randomColors.length],
            imageUrl:
                "https://www.pinclipart.com/picdir/big/401-4015722_nike-shoes-clipart.png"));
  }

  static List<Shoe> getMockShoeItem(int itemCount) {
    return List<Shoe>.generate(
        itemCount,
        (int index) => Shoe(
            id: index,
            brandName: "brand $index",
            isLiked: false,
            price: Random().nextInt(113 * 10).toString(),
            title: "title $index",
            status: ShoeStatus.newShoe,
            imageUrl:
                "https://www.pinclipart.com/picdir/big/401-4015722_nike-shoes-clipart.png"));
  }

  static List<Widget> getTabBarViewItem() {
    var list = List<Widget>();

    list.add(MainHomeWidget(
      key: Key("key1"),
    ));
    list.add(MainHomeWidget(
      key: Key("key2"),
    ));
    list.add(MainHomeWidget(
      key: Key("key3"),
    ));
    list.add(MainHomeWidget(
      key: Key("key4"),
    ));
    list.add(MainHomeWidget(
      key: Key("key5"),
    ));
    list.add(MainHomeWidget(
      key: Key("key6"),
    ));
    list.add(MainHomeWidget(
      key: Key("key7"),
    ));
    list.add(MainHomeWidget(
      key: Key("key8"),
    ));
    list.add(MainHomeWidget(
      key: Key("key9"),
    ));
    list.add(MainHomeWidget(
      key: Key("key10"),
    ));
    list.add(MainHomeWidget(
      key: Key("key11"),
    ));
    list.add(MainHomeWidget(
      key: Key("key12"),
    ));
    return list;
  }

  static List<Color> randomColors = [
    Colors.redAccent,
    Colors.green,
    Colors.amberAccent,
    Colors.blue,
    Colors.indigo,
    Colors.purpleAccent,
    Colors.lightGreen,



  ];
}
