import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../models/product/product.dart';

const String APIKey = "619EB9AC27F94152828E0F81F4E88411";
const String baseURL =
    "https://api.rainforestapi.com/request?api_key=$APIKey&type=product&url=";

//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^///
//The Function below is commented to perserve our API Calls Quota
//To use in production, uncomment it and comment the function below it
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//

// Future<Product> fetchAmazonPrice(Product product) async {
//   final response =
//       await http.get(Uri.parse(baseURL + product.URLs!["Amazon"]!));

//   if (response.statusCode == 200) {
//     print(jsonDecode(response.body));
//     String price = "0";

//     if (jsonDecode(response.body)["product"] != null) {
//       price = jsonDecode(response.body)["product"]["buybox_winner"]["price"]
//               ["value"]
//           .toString();
//     }
//     print("Price: " + price);
//     product.prices["Amazon"] = price;
//   } else {
//     throw Exception('Failed to retrieve data');
//   }

//   return product;
// }

Future<Product> fetchAmazonPrice(Product product) async {
  final String response = await rootBundle.loadString('assets/sample.json');
  final data = await json.decode(response);

  product.prices["Amazon"] =
      data["product"]["buybox_winner"]["price"]["value"].toString();

  return product;
}
