import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: [
          Stack(children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: new AssetImage("assets/images/gym.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ]),
        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height*0.2,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}
