import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import '/domain/models/product/product.dart';
import 'package:ar_grocery_companion/constants/keys.dart';
import 'package:http/http.dart' as http;

String baseURL =
    "https://api.rainforestapi.com/request?api_key=$RainForestAPILicenseKey&type=product&url=";

//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^///
//The Function below is commented to perserve our API Calls Quota
//To use in production, uncomment it and comment the function below it
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//

Future<String> fetchAmazonPrice(Product product) async {
  if (product.storesURLs?["Amazon"] == "") return "Not Available";
  final response =
      await http.get(Uri.parse(baseURL + product.storesURLs!["Amazon"]!));

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    String price = "Not Available";

    if (jsonDecode(response.body)["product"] != null) {
      price = jsonDecode(response.body)["product"]["buybox_winner"]["price"]
              ["value"]
          .toString();
    }
    print("Price: " + price);
    return price;
  } else {
    return "Not Available";
  }
}

Future<String> fetchAmazonPriceDummy(Product product) async {
  final String response = await rootBundle.loadString('assets/sample.json');
  final data = await json.decode(response);

  var price = data["product"]["buybox_winner"]["price"]["value"].toString();

  return price;
}
