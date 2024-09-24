import 'package:flutter/material.dart';

class Festival {
  String festivalName;
  String description;
  String date;
  String region;
  String thumbnail;
  String moral;
  List<String> detailing;
  List<String> images;
  List<String> wishes;

  Festival({
    required this.festivalName,
    required this.description,
    required this.date,
    required this.region,
    required this.moral,
    required this.thumbnail,
    required this.detailing,
    required this.images,
    required this.wishes,
  });

  factory Festival.fromMap({required Map<String, dynamic> data}) => Festival(
        festivalName: data["festivalName"],
        description: data["description"],
        date: data["date"],
        region: data["region"],
        moral: data["moral"],
        thumbnail: data["thumbnail"],
        detailing: data["detailing"],
        images: data["images"],
        wishes: data["wishes"],
      );
}

List<Festival> allFestivalData = [];
late final List<Color> gradientColors;
late final String bgImageUrl;
late final Color shadowColor;
late final double shadowOffset;
