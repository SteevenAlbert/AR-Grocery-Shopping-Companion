import 'dart:io';
import 'dart:typed_data';
import '../constants/constants.dart';
import '/domain/models/product/product.dart';

Future<String?> fetchSpinneysPrice(Product product) async {
  String serverResponse = "";
  var socket;

  try {
    // Establish connection with the server.
    socket = (await Socket.connect(webscraperVPSAddress, webscraperVPSPort));
    // Send the URL to the server.
    socket.write(product.storesURLs!["Spinneys"]);
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
  await Future.delayed(const Duration(seconds: 2));
  if (serverResponse == "") {
    return "Not Available";
  } else {
    return serverResponse;
  }
}
