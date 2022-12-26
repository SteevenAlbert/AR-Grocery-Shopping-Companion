import 'dart:io';
import 'dart:typed_data';
import "package:http/http.dart" as http;
import '../constants/constants.dart';
import '../models/product.dart';

Future<String> fetchJumiaPrice(Product? product) async {
  String serverResponse = "___";

  // Establish connection with the server.
  final socket = await Socket.connect(webscraperVPSAddress, webscraperVPSPort);

  // Send the URL to the server.
  socket.write(product.URLs!["Jumia"]!);

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

  // Return the result
  await Future.delayed(const Duration(seconds: 2));
  return serverResponse;
}



// Future<void> sendMessage(Socket socket, String message) async {
//   print('Client: $message');
//   socket.write(message);
// }
