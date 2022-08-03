//import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';
//import 'package:permission_handler/permission_handler.dart';

class PDFViewer extends StatefulWidget {
  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  String _pdf =
      "https://pdftron.s3.amazonaws.com/downloads/pl/PDFTRON_mobile_about.pdf";
  //String _document = "https://file-examples-com.github.io/uploads/2017/02/file-sample_100kB.doc";
  String _document =
      "https://docs.google.com/document/d/1G-5s6uoP1H_7f_ByLrvCVcoFXYZ80CixkMbbHMsMCag/edit#heading=h.pub7jnop54q0";

  @override
  void initState() {
    super.initState();
    initPlatformState();

    if (Platform.isIOS) {
    } else {
      // Request for permissions for android before opening document
      //launchWithPermission();
    }
  }

  // Future<void> launchWithPermission() async {
  //   Map<Permission, PermissionStatus> permissions =await [Permission.storage,].request();

  //   if (granted(permissions[Permission.storage])) {

  //   }
  // }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String version;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      PdftronFlutter.initialize(
          "Insert commercial license key here after purchase");
      version = await PdftronFlutter.version;
    } on PlatformException {
      version = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  void showViewer(file) {
    PdftronFlutter.openDocument(file);
  }

  // bool granted(PermissionStatus? status) {
  //   return status == PermissionStatus.granted;
  // }

  @override
  Widget build(BuildContext context) {
    return 
        Center(
          child: Column(
            // gridDelegate:
            //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: [
              Card(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black.withOpacity(0.2)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                    fixedSize: MaterialStateProperty.all(Size.fromHeight(80),),
                  ),
                  //clipBehavior: Clip.hardEdge,
                  onPressed: () {
                    showViewer(_document);
                  },
                  child: ListTile(
                        leading: Icon(Icons.description_outlined),
                        title: Text('Kế hoạch'),
                        subtitle: Text(
                            '50kb'),
                      ),
                  
                ),

                // InkWell(
                //   splashColor: Colors.blue.withAlpha(30),
                //   onLongPress: () {
                //     showViewer(_document);
                //   },
                //   child: const SizedBox(
                //     width: 50,
                //     height: 20,
                //     // child: Card(child: Icon(Icons.description_outlined)),
                //   ),
                // ),
              ),
              //elevation: 10,
              // child: FlatButton(child: Text("View Doc",style: TextStyle(fontSize: 20),),color:Colors.blueGrey,textColor:Colors.white,highlightColor: Colors.red,onPressed: (){
              //   showViewer(_document);
              // },),

              Card(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black.withOpacity(0.2)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                    fixedSize: MaterialStateProperty.all(Size.fromHeight(80),),
                  ),
                  //clipBehavior: Clip.hardEdge,
                  onPressed: () {
                    showViewer(_pdf);
                  },
                  child: ListTile(
                        leading: Icon(Icons.description_outlined),
                        title: Text('Tổ chức sự kiện'),
                        subtitle: Text(
                            '20kb'),
                      ),
                  
                ),
              )
            ],
          ),
          /*,*/
        );
      
  }
}
