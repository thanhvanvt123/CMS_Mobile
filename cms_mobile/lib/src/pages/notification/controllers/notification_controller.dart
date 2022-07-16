import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    connectAndListen();
    
  }

  late IO.Socket socket;
  void connectAndListen() {
    socket = IO.io("http://3.0.93.160:5505", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
      //'extraHeaders': {'foo': 'bar'},
    });
    socket.connect();
    print(socket.connected);
    // socket = await IO.io('ip server',
    //     OptionBuilder()
    //         .setTransports(['websocket']).build());
    // socket.onConnect((_) => print('connect'));
    // socket.on("notify-event", (_) => getEvents());
    // socket.onConnectError((data) => print('error : ' + data.toString()));
  }
}
