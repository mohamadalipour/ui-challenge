import 'package:flutter/material.dart';

class Shoe {
  int id;
  String brandName;
  bool isLiked;
  String title;
  String price;
  String imageUrl;
  ShoeStatus status;
  Color color;

  Shoe(
      {this.id,
      this.price,
      this.title,
      this.brandName,
      this.isLiked,
      this.imageUrl,
      this.status,
      this.color});
}

enum ShoeStatus { newShoe, old }
