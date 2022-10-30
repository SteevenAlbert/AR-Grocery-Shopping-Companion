import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:like_button/like_button.dart';

import 'Components/tab_bar.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String assetName = 'assets/images/blob.svg';
    final Widget blobSVG = SvgPicture.asset(assetName, semanticsLabel: 'Blob');
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          alignment: Alignment.center,
          child: Stack(alignment: Alignment.topCenter, children: <Widget>[
            Transform.scale(
              scaleX: 2.8,
              scaleY: 1.8,
              child: SizedBox(
                height: 370,
                width: 500,
                child: blobSVG,
              ),
            ),
            Center(
                child: Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () => context.go('/'),
                              icon: Image.asset('assets/images/backbtn.png')),
                          LikeButton()
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: MediaQuery.of(context).size.height / 2 -
                          MediaQuery.of(context).size.height / 6,
                      child:
                          Image.asset('assets/images/kinder_bueno_6sticks.png'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Kinder Bueno 6 Sticks",
                      style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(205, 32, 69, 83)),
                    ),
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "325 cal.",
                            style: TextStyle(
                                fontFamily: "Ubuntu",
                                fontSize: 16,
                                color: Color.fromARGB(125, 0, 0, 0)),
                          ),
                          // Text(
                          //   "130g",
                          //   style: TextStyle(
                          //       fontFamily: "Ubuntu",
                          //       fontSize: 16,
                          //       color: Color.fromARGB(125, 0, 0, 0)),
                          // ),
                        ]),
                    SizedBox(height: 15),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      RatingBar.builder(
                        itemSize: 20,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Color.fromARGB(152, 255, 193, 7),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Row(
                        children: [
                          Text(
                            "3.5",
                            style: TextStyle(
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            "/5",
                            style: TextStyle(
                                fontFamily: "Ubuntu",
                                color: Color.fromARGB(126, 0, 0, 0),
                                fontSize: 16),
                          ),
                        ],
                      )
                    ]),
                    Expanded(
                      child: ProductTabBar(),
                    )
                  ]),
            )),
          ]),
        ),
      ),
    );
  }
}
