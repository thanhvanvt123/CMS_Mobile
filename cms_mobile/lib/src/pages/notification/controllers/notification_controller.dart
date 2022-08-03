import 'package:cms_mobile/src/models/notification.dart';
import 'package:cms_mobile/src/models/paging.dart';
import 'package:cms_mobile/src/pages/notification/views/notification_view.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:cms_mobile/src/services/api/notification_check.dart';
import 'package:cms_mobile/src/services/api/notification_read.dart';
import 'package:cms_mobile/src/services/api/notification_service.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationController extends GetxController {

  // load data of event
  INotificationService notiService = Get.find();
  final listNoti = <NotificationEvent>[].obs;
  // final listNewNoti = <NotificationEvent>[].obs;
  final listNewNoti = <NotificationEvent>[].obs;
  final List<Map<String, dynamic>> listCheck = [] ;
  final eventId = 0.obs;
  final reportId = 0.obs;
  final notiId = 0.obs;
  SharedStates states = Get.find();

  @override
  void onInit() {
    super.onInit();
    getNoti();
    connectAndListen();
    sendNotification();
    // checkNoti();
    // getNotiUnread();
    String? id = Get.parameters['id'];
    if (id == null) return;
    // if(eventId.value != 'null') {
    //   eventId.value = int.parse(id);
    // } else {
    //   reportId.value = int.parse(id);
    // }
    
    // getEventDetail(eventId.value);
    // getNotiUnread();
    
  }
  void sendNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'test_channel',
          title: 'Title of the notification.',
          body: 'Hello! This is the body of the notification.'),
    );

    AwesomeNotifications().actionStream.listen((event) {
      Get.to(NotificationPage());
    });
  }

  // Future<void> getNotiUnread() async {
  //   listNewNoti.clear();
  //   //final events = await eventService.getEvents();
  //   //listEvents.value = events.data ?? [];
  //   listNoti.value = await notiService.getNoti();
  //   // for(int i = 0; i <= listNoti.length; i++) {
  //     // for (Map<String,dynamic> item in listNoti) {
  //     //   if(item.isRead == false) {
  //     //     listNewNoti.add(item);
  //     //   }
  //     //   //listNewSearchEvents.value = listSearchEvents;
  //     // }
  //   // }
  //   print("========= hello " + listNewNoti.string);
  // }


  Future<void> getNoti() async {
    listNewNoti.clear();
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    listNoti.value = await notiService.getNoti();
    print("========= hello " + listNoti.string);
    for (var item in listNoti){
      if(item.isCheck == false) {
        listNewNoti.add(item);
      }
    }
    states.count = listNewNoti.length.toInt();
    print("llllllllll=== " + states.count.toString());
  }

  // Future<void> getNotiDetail(int? id) async {
    
  //   print("========== " + .value.toString());
  //   Event? eventApi = (await eventDetailService.getEventById(eventId.value)) as Event?;
  //   //var event = await eventService.getEventById(eventId.value);
  //   // event!.value = event.toString();
  //   // sharedStates.event = event;
  //   print("api " + eventApi.toString());
  //   event.value = eventApi!;
  //   // if (eventApi != null) {
  //   //   event.value = eventApi;
  //   // }
  //   print("event value " + event.toString());
  // }

  INotificationReadService readService = Get.find();
  Future<void> goToEventDetail(int? id) async { 
    if (id != null) {
      readNoti(states.notiId);
      states.eventId = id.toInt();
      Get.toNamed(Routes.eventDetail, parameters: {"eventId": id.toString()});
    }  
    // readNoti();
  }

  Future<void> goToReportDetail(int? id) async {
    if (id != null) {
      states.reportId = id.toInt();
      Get.toNamed(Routes.reportDetail, parameters: {"reportId": id.toString()});
    }  
    
  }

  Future<void> readNoti(int? id) async {
    if (id != null) {
      
      states.notiId = id.toInt();
      print("notiID==== " + states.notiId.toString());
      Paging? result = await readService.readNoti();
      print("===test " + result.toString());
      getNoti();
    // }
    }  
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    
    // for (var item in listNewNoti){
    //   print(object)
    //   Map<String,dynamic> result = await readService.readNoti(item.notificationId!.toInt());
    // }
    // getNoti();
  }

  // INotificationCheckService checkService = Get.find();

  // Future<void> checkNoti() async {
  //   //final events = await eventService.getEvents();
  //   //listEvents.value = events.data ?? [];
    
  //   for (var item in listNewNoti){
  //     Map<String, List<Map<String, dynamic>>> notifications = {
  //       "notifications": [
  //         {
  //           "notificationId": item.notificationId,
  //         }
          
  //       ]
  //     };
  //     Map<String,dynamic> result = await checkService.checkNoti(notifications);
  //   }
  //   getNoti();
  // }

  // Future<void> getNewNoti() async {
  //   //final events = await eventService.getEvents();
  //   //listEvents.value = events.data ?? [];
  //   listNoti.value = await notiService.getNoti();
  //   print("========= hello " + listNoti.string);
  // }

  late IO.Socket socket;
  void connectAndListen() {
    socket = IO.io("http://13.229.73.115:5505", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
      //'extraHeaders': {'foo': 'bar'},
    });
    socket.connect();
    print(socket.connected);
    socket.onConnect((_) => print('connect'));
    socket.on("notify-event", (_) => getNoti());
    socket.on("notify-report", (_) => getNoti());
    socket.onConnectError((data) => print('error : ' + data.toString()));
  }

  @override
  void onClose() {
    super.onClose();
    //closeShopping();
  }
}
