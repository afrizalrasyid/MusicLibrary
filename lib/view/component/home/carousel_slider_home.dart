import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgCarouselList = [
      'assets/images/carousel_1.jpg',
      'assets/images/carousel_2.jpg',
      'assets/images/carousel_3.jpg',
      'assets/images/carousel_4.jpg',
      'assets/images/carousel_5.jpg',
      'assets/images/carousel_6.jpg',
      'assets/images/carousel_7.jpg',
    ];

    final List<Widget> imageSliders = imgCarouselList
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                  ],
                ),
              ),
            ))
        .toList();

    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
      ),
      items: imageSliders,
    );
  }
}
