import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import '../constants/constants.dart';
import '../models/product.dart';

Future<Product> fetchJumiaPrice(Product product) async {
  String serverResponse = "";

  // Establish connection with the server.
  try {
    final socket = await Socket.connect(webscraperVPSAddress, webscraperVPSPort,
        timeout: Duration(seconds: 10));

    // Send the URL to the server.
    socket.write(product.URLs!["Jumia"]);

    // Listen for the server response.
    await socket.listen(
      (Uint8List data) async {
        serverResponse = await String.fromCharCodes(data);
        print('Server: $serverResponse');
      },
      onError: (error) {
        print(error);
        socket.destroy();
      },
      onDone: () {
        print('Server closed.');
        socket.destroy();
      },
    );
  } catch (e) {
    print("Connection to server failed");
    return product;
  }

  // Return the result
  await Future.delayed(const Duration(seconds: 2));
  product.prices["Jumia"] = serverResponse;
  return product;
}



// Future<void> sendMessage(Socket socket, String message) async {
//   print('Client: $message');
//   socket.write(message);
// }