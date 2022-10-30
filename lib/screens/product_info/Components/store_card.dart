import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget storeCard(String imagepath, double price, Uri _url) {
  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  return InkWell(
    onTap: () => _launchUrl(_url),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40, width: 120, child: Image.asset(imagepath)),
            Text(
              price.toInt().toString() + " EGP",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Image.asset("assets/images/fwdbtn.png"),
          ],
        ),
        SizedBox(
          height: 40,
        ),
      ],
    ),
  );
}
