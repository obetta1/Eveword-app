import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/models/category_model.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 1.5,
          viewportFraction: 0.9,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height),
      items: Category.categories
          .map((category) => HeroCarousel(category: category))
          .toList(),
    );
  }
}
