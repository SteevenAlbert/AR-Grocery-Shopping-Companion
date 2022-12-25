import 'dart:io';
import 'dart:typed_data';
import "package:http/http.dart" as http;

Future<String> getPrice(String? URL) async {
  String serverResponse = "..";
  final socket = await Socket.connect('159.65.48.19', 5000);
  print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');
  sendMessage(socket, URL!);
  await socket.listen(
    (Uint8List data) async {
      serverResponse = await String.fromCharCodes(data);
      print('Server: $serverResponse');
    },

    // handle errors
    onError: (error) {
      print(error);
      socket.destroy();
    },

    // handle server ending connection
    onDone: () {
      print('Server left.');
      socket.destroy();
    },
  );
  await Future.delayed(const Duration(seconds: 2));
  return serverResponse;
}

Future<void> sendMessage(Socket socket, String message) async {
  print('Client: $message');
  socket.write(message);
}
