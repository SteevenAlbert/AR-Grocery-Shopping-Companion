import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(physics: const NeverScrollableScrollPhysics(), children: [
        CarouselSlider(
          items: [
            Stack(children: [
              Container(
                margin: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: new AssetImage("images/gym.jpeg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.amber,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8, right: 4),
                    child: Text(
                      'Gym Essentials',
                      style: TextStyle(fontSize: 30, fontFamily: 'Recursive'),
                    ),
                  ),
                ),
              )
            ]),
            Stack(children: [
              Container(
                margin: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: new AssetImage("images/bakery.jpeg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.amber,
                    // color: Colors.blue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8, right: 4),
                    child: Text(
                      'Bakery',
                      style: TextStyle(
                          fontSize: 30,
                          backgroundColor: Colors.amber,
                          fontFamily: 'Recursive'),
                    ),
                  ),
                ),
              )
            ]),
            Stack(children: [
              Container(
                margin: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: new AssetImage("images/pets.jpeg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                  // color: Colors.blue,
                ),
                child: Positioned(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8, right: 4),
                    child: Text(
                      'Pets food',
                      style: TextStyle(
                          fontSize: 30,
                          backgroundColor: Colors.amber,
                          fontFamily: 'Recursive'),
                    ),
                  ),
                ),
              )
            ])
          ],
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
      ]),
    );
  }
}
