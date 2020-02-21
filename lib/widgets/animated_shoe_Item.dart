import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ui_challenge/model/show.dart';
import 'package:meta/meta.dart';

class AnimatedShoeItem extends StatefulWidget {
  final Shoe shoe;
  final bool doAnimatedPadding;

  const AnimatedShoeItem(
      {Key key, @required this.shoe, @required this.doAnimatedPadding})
      : super(key: key);

  @override
  _AnimatedShoeItemState createState() => _AnimatedShoeItemState();
}

class _AnimatedShoeItemState extends State<AnimatedShoeItem>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation flipAnim;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    flipAnim = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.5, curve: Curves.linear)));

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 2;
    return AnimatedPadding(
      padding: EdgeInsets.all(widget.doAnimatedPadding ? 16 : 0),
      duration: Duration(milliseconds: 300),
      child: Stack(
        children: <Widget>[
          AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget child) {
//              return
//                Transform(
//                transform: Matrix4.identity()..rotateY(45),alignment: Alignment.center,
//                child:
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: widget.shoe.color,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            widget.shoe.brandName,
                            style: TextStyle(color: Colors.white),
                          )),
                          widget.shoe.isLiked
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                        ],
                      ),
                      Container(
                        child: Text(
                          widget.shoe.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                          child: Text(
                        widget.shoe.price,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )),
                      Expanded(
                        flex: 1,
                        child: Container(
                            constraints: BoxConstraints.expand(),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ))),
                      )
                    ],
                  ),
                );
//              );
              }),
          Positioned(
              top: 0,
              bottom: 0,
              width: width * 1.2,
              child: AnimatedPadding(
                padding: EdgeInsets.all(widget.doAnimatedPadding ? 8 : 0),
                duration: Duration(milliseconds: 300),
                child: Container(
                  margin: EdgeInsets.only(left: 32),
                  child: FadeInImage.assetNetwork(
                    image: widget.shoe.imageUrl,
                    placeholder: "assets/show_image.png",
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
