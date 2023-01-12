import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget storeCard(
    BuildContext context, String imagepath, String? price, String _url) {
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
              price ?? "Not Available",
              style: Theme.of(context).textTheme.bodyLarge,
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
