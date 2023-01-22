import 'dart:io';
import 'dart:typed_data';
import '../constants/constants.dart';
import '/domain/models/product/product.dart';

Future<String?> fetchLuluPrice(Product product) async {
  String serverResponse = "";
  var socket;

  try {
    // Establish connection with the server.
    socket = (await Socket.connect(webscraperVPSAddress, 5001));
    // Send the URL to the server.
    socket.write(product.storesURLs!["Lulu"]);
  } on SocketException catch (e) {
    print(e);
    return "Not Available";
  }

  // Listen for the server response.
  await socket.listen(
    (Uint8List data) async {
      serverResponse = await String.fromCharCodes(data);
      print('Server: $serverResponse');
      if (serverResponse == "404") {
        return product;
      }
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

  // Return the result
  await Future.delayed(const Duration(seconds: 3));
  if (serverResponse == "") {
    return "Not Available";
  } else {
    String sanitizedResponse =
        serverResponse.trim().replaceAll(RegExp(r'[^\d.]'), '');
    return sanitizedResponse;
  }
}
