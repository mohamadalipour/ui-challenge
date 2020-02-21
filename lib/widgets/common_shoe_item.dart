import 'package:flutter/material.dart';
import 'package:ui_challenge/model/show.dart';
import 'package:meta/meta.dart';

class CommonShoeItem extends StatelessWidget {
  final Shoe shoe;

  const CommonShoeItem({Key key, @required this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 2;

    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.grey.withAlpha(20),
          ),
          child: Column(mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(flex: 10,
                child: Align(
                  alignment: Alignment.topRight,
                  child: shoe.isLiked
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ),
                ),
              ),
              Flexible(flex: 40,child: FadeInImage.assetNetwork(image:shoe.imageUrl,placeholder: "assets/show_image.png")),
              Flexible(flex: 15,
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    shoe.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ),
              Flexible(flex: 10,
                child: Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      shoe.price,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          top: 24,
          left: 24,
          child: RotatedBox(
            quarterTurns: 3,
            child: Container(
              color: Colors.redAccent,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "NEW",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
