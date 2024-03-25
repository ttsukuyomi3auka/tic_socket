import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketService extends GetxService {
  static SocketService get to => Get.find();
  late Socket _socket;

  Future<SocketService> init() async {
    _socket = io(
        'http://localhost:3000',
        OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .build());
    _socket.onConnectError((error) {
      print("Connection error: $error");
    });

    _socket.onConnect((data) {
      print("Connected");
    });

    _socket.onDisconnect((data) => print("disconnect"));
    return this;
  }

  void addUser(String name) {
    _socket.emit('addPlayer', name);
  }
}
