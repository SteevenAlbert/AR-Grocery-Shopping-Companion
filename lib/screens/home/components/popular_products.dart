import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ar_grocery_companion/screens/home/components/product_card.dart';
import 'package:ar_grocery_companion/models/product.dart';

class ProductCarousel extends StatelessWidget {
  final Size size;
  const ProductCarousel({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Popular Products",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            TextButton(
                onPressed: () {},
                child: Text("See All", style: TextStyle(fontSize: 15)))
          ],
        ),
        SizedBox(height: 12),
        Container(
            child: CarouselSlider(
          options: CarouselOptions(viewportFraction: 300/MediaQuery.of(context).size.width, height: 180,),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  constraints: BoxConstraints(maxWidth: 300),
                  margin: EdgeInsets.symmetric(horizontal: 0.5),
                  child: ProductCard(
                      sectionID: 0, product: Product.all[i]),
                );
              },
            );
          }).toList(),
        )),
      ],
    );
  }
}
