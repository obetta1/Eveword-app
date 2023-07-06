import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/category/bloc/category_bloc.dart';
import 'widgets.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const SizedBox(
            height: 300,
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoryLoaded) {
          return CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height),
            items: state.categories
                .map((category) => HeroCarousel(category: category))
                .toList(),
          );
        } else {
          return const Text("Something went wrong");
        }
      },
    );
  }
}
