// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart'as geolocator3 ;
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:location/location.dart';
//
// import 'package:flutter/cupertino.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:testprestige/itemFoodDetails/ItemDetailes.dart';
// import 'package:progress_dialog/progress_dialog.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../URL_LOGIC.dart';
// import '../homeWite.dart';
//
//
// import 'dart:ui' as ui;
// import 'dart:typed_data';
//
// class Map_new extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return UnMap_new();
//   }
//
// }
//
// class UnMap_new extends State<Map_new> {
//   BitmapDescriptor customIcon;
//   geolocator3.Position position_Map;
//   @override
//   void initState() {
//     super.initState();
//       setState(() {
//         geolocator3.Geolocator
//             .getCurrentPosition(desiredAccuracy: geolocator3.LocationAccuracy.best)
//             .then((geolocator3.Position position) {
//           setState(() {
//             print(position);
//             position_Map=position;
//             print(""+position_Map.latitude.toString()+"   &&&&   "+position_Map.longitude.toString());
//             setState(() {
//               _sendItemData();
//             });
//           });
//         }).catchError((e) {
//           print("error map GeoLocation   "+e.toString());
//         });
//       });
//   }
//   LatLng currentPostion;
//   // void _getUserLocation() async {
//   //   var position = await geolocator3.GeolocatorPlatform.instance
//   //       .getCurrentPosition(desiredAccuracy: geolocator3.LocationAccuracy.high);
//   //
//   //   setState(() {
//   //     currentPostion = LatLng(position.latitude, position.longitude);
//   //   });
//   // }
//
//
//   // check permeation
//   bool _serviceEnabled;
//   PermissionStatus _permissionGranted;
//   Location location = new Location();
//   addpermation() async {
//     print("addpermation>>>>>>>");
//     _permissionGranted = await location.requestPermission();
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       print("_serviceEnabled>>>>>>>");
//       print(_serviceEnabled);
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         print("<<<<_serviceEnabled>>>>>>>");
//         print(">>>>>>$_serviceEnabled");
//         return;
//       }
//     }
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//   }
//
//
//   Map data;
//   List userData;
//
//   String satesTest="0";
//
//   Future getRefrich() async {
//     if(data!=null) {
//       data.clear();
//       userData.clear();
//     }
//     _sendItemData();
//     await Future.delayed(Duration(seconds: 3));
//   }
//
//   Future<List> _sendItemData() async {
//     print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
//     print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String iduserS = prefs.getString('idUser');
//     String lang = prefs.getString('lang');
//     //to send order
//     ProgressDialog pr = new ProgressDialog(context);
//     pr = new ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: true, showLogs: true);
// //    pr.show();
// //    Map<String,String> timeOutMessage = {'state':'timeout','content':'server is not responding'};
//     try {
//       print(URL_LOGIC.map);
//       Map<String, dynamic> body =
// //      {"lang":"en","userid":"81","lat":"7.08594109039762","lon":"286.95225338731285"};
//       {
//         "lang": lang,
//         "userid": iduserS,
//         "lat": position_Map.latitude.toString(),
//         "lon": position_Map.longitude.toString()
//       };
//
//       debugPrint("?????????");
//       print("body is :" + body.toString());
//
//       final encoding = Encoding.getByName('utf-8');
//       String jsonBody = json.encode(body);
//       final headers = {'Content-Type': 'application/json'};
//       final response = await http.post(URL_LOGIC.map,
//         body: jsonBody,
//         encoding: encoding,
//         headers: headers,
//       );
//       //"message":"You Logined To Your Account ."
//       data = json.decode(response.body);
//       debugPrint(data.toString());
//
//
//       setState(() {
//         Future.delayed(Duration(seconds: 1)).then((value) async {
//           pr.hide();
//           data = json.decode(response.body);
//           print(data.toString());
//           if (data["nearestme"][0]["message"] == null) {
//             setState(() {
//               userData = data["nearestme"];
//             });
//
//           } else {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: null,
//                   content: Text(data["nearestme"][0]["message"].toString(),
//                     textAlign: TextAlign.center,),
//                   actions: [
// //            okButton,
//                   ],
//                 );
//               },
//             );
//             Future.delayed(Duration(seconds: 2)).then((value) async {
// //                  Navigator.pop(context);
//             });
//           }
//         });
//       });
//     }catch(exception){
//       Future.delayed(Duration(seconds: 1)).then((value) async {
//         pr.hide();
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return   AlertDialog(
//               title: null,
//               content: Text("يرجي التاكد من الاتصال بل النترنت"),
//               actions: [
// //            okButton,
//               ],
//             );
//           },
//         );
//         print("object ??"+exception.toString());
//       });
//     }
//   }
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//
//       body:
//       position_Map==null?HomeWiting()
//       :
//       Stack(
//         children: <Widget>[
//           userData==null?Center(child: CircularProgressIndicator(),)
//           :
//           _buildGoogleMap(context),
// //          _zoomminusfunction(),
// //          _zoomplusfunction(),
// //          Padding(padding: EdgeInsets.only(bottom: 40),
// //            child:  _buildContainer(),
// //          )
//         ],
//       ),
//     );
//   }
//
//
//   ///  use to zoom in and out
//   Completer<GoogleMapController> _controller = Completer();
//   double zoomVal=5.0;
//   Widget _zoomminusfunction() {
//     return Align(
//       alignment: Alignment.topLeft,
//       child: IconButton(
//           icon: Icon(FontAwesomeIcons.searchMinus,color:Color(0xff6200ee)),
//           onPressed: () {
//             zoomVal--;
//             _minus( zoomVal);
//           }),
//     );
//   }
//   Widget _zoomplusfunction() {
//
//     return Align(
//       alignment: Alignment.topRight,
//       child: IconButton(
//           icon: Icon(FontAwesomeIcons.searchPlus,color:Color(0xff6200ee)),
//           onPressed: () {
//             zoomVal++;
//             _plus(zoomVal);
//           }),
//     );
//   }
//
//   Future<void> _minus(double zoomVal) async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
//   }
//   Future<void> _plus(double zoomVal) async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
//   }
//
//
//   final Set<Marker> _markers = {};
//   Widget _buildGoogleMap(BuildContext context)  {
//
//
//     print(">>>>>>>>>>>>>>");
//     // for(int i =0 ;i<userData.length ;i++){
//     //   setState(() {
//     //          //userData[i]["photo"],
//     //     setMarkersPoint(
//     //          userData[i]["logo"],
//     //         double.parse(userData[i]["latitude"]),
//     //         double.parse(userData[i]["longitude"]),
//     //         userData[i]["id"].toString()
//     //     );
//     //   });
//     // }
//
//     _markers.add(Marker(
//       markerId: MarkerId("11111"),
//       icon: BitmapDescriptor.defaultMarker,
//       position: LatLng(position_Map.latitude,position_Map.longitude),
//
//     ));
//
//     print( "loction now > ${position_Map.latitude} +  ${position_Map.longitude}");
//     return Container(
//
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child:
//       // position_Map.latitude!=null? Text("${position_Map.latitude} +  ${position_Map.longitude}"):
//       GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition:  CameraPosition(
//             target: LatLng(position_Map.latitude, position_Map.longitude),
//             zoom: 7,
//         ),
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//         markers: _markers,//>>> add all markers
//       ),
//     );
//   }
//
//
//   //>>>>>>>>>>
//   Uint8List markerIcon;
//
//
//
//
//
//   //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//   Future setMarkersPoint(image,lat,log,id_oofer) async {
//     var icon = image;
//     Uint8List dataBytes;
//     var request = await http.get(icon);
//     var bytes = await request.bodyBytes;
//
//     setState(() {
//       dataBytes = bytes;
//     });
//
//      Uint8List markerIcoenter;
//      markerIcoenter = await getBytesFromCanvasss(150, 150, dataBytes);
//
//     var myLatLong = LatLng(lat, log);
// //    var myLatLong = LatLng(30.2588244, 31.3238236);
//
//     _markers.add(Marker(
//       markerId: MarkerId(myLatLong.toString()),
//       icon: BitmapDescriptor.fromBytes(markerIcoenter),
//       position: myLatLong,
//       onTap: ()=>{
//         print("i>>>>> $lat ---&--- $log -----> id offer$id_oofer "),
//
//             Navigator.push(context,MaterialPageRoute(builder: (context) => ItemDetailes(id: id_oofer,)))
//       },
// //      infoWindow: InfoWindow(
// //        title: 'Name of location',
// //        snippet: 'Marker Description',
// //      ),
//     ));
//   }
//
//
//
//
//   Future<Uint8List> getBytesFromCanvasss(int width, int height, Uint8List dataBytes) async {
//     final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
//     final Canvas canvas = Canvas(pictureRecorder);
//     final Paint paint = Paint()..color = Colors.transparent;
//     final Radius radius = Radius.circular(120.0);
//     canvas.drawRRect(
//         RRect.fromRectAndCorners(
//           Rect.fromLTWH(120.0, 120.0, width.toDouble(), height.toDouble()),
//           topLeft: radius,
//           topRight: radius,
//           bottomLeft: radius,
//           bottomRight: radius,
//         ),
//         paint);
//     //canvas.drawCircle(Offset(200, 200), 100, paint);
//
//     //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start to change design image
// //    final Path clipPath = Path();
// //    clipPath.addRRect(RRect.fromRectAndRadius(
// //        Rect.fromLTWH(0, 0, 100, 100),
// //        Radius.circular(10)));
// //
// //    clipPath.addRRect(RRect.fromRectAndRadius(
// //        Rect.fromLTWH(0, 100 * 8 / 10, 100, 100 * 3 / 10),
// //        Radius.circular(10)));
// //    canvas.clipPath(clipPath);
//     //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> end to change design image
//
//     var imaged = await loadImage(dataBytes.buffer.asUint8List());
//     canvas.drawImageRect(
//       imaged,
//       Rect.fromLTRB(
//           0.0, 0.0, imaged.width.toDouble(), imaged.height.toDouble(),),
//       Rect.fromLTRB(0.0, 0.0, width.toDouble(), height.toDouble()),
//       new Paint(),
//     );
//
//     final img = await pictureRecorder.endRecording().toImage(width, height);
//     final data = await img.toByteData(format: ui.ImageByteFormat.png);
//     return data.buffer.asUint8List();
//   }
//
//   Future<ui.Image> loadImage(List<int> img) async {
//     final Completer<ui.Image> completer = new Completer();
//     ui.decodeImageFromList(img, (ui.Image img) {
//       return completer.complete(img);
//     });
//     return completer.future;
//   }
//
//
//
//
//
//
//
//
//
//
//
//
//
//   icon()  async{
//     markerIcon = await getBytesFromCanvas(200, 100);
//     setState(()  {
//
// //      final Marker marker = Marker(icon: BitmapDescriptor.fromBytes(markerIcon));
//       _markers.add(Marker(
//         // This marker id can be anything that uniquely identifies each marker.
//         markerId: MarkerId("1"),
//         position: LatLng(double.parse("40.712776"),
//             double.parse("-74.005974")),
//         infoWindow: InfoWindow(
//           title: "diaa1",
//           snippet: 'boop',
//           onTap: ()=>print("object?????"),
// //        anchor: Offset(133, 133)
//         ),
// //        icon: BitmapDescriptor.fromBytes( getMarkerIcon("path/to/your/image.png", Size(150.0, 150.0))  ),
//         icon: BitmapDescriptor.fromBytes(markerIcon),
// //      icon: customIcon,
//         //BitmapDescriptor.fromAsset("assets/fac.png",)
// //      icon: BitmapDescriptor.defaultMarker,
//       ));
//
//     });
//
//   }
//   Future<Uint8List> getBytesFromCanvas(int width, int height) async {
//     final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
//     final Canvas canvas = Canvas(pictureRecorder);
//     final Paint paint = Paint()..color = Colors.blue;
//     final Radius radius = Radius.circular(120.0);
//     canvas.drawRRect(
//         RRect.fromRectAndCorners(
//           Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
//           topLeft: radius,
//           topRight: radius,
//           bottomLeft: radius,
//           bottomRight: radius,
//         ),
//         paint);
//     TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
//     painter.text = TextSpan(
//       text: 'Hello world',
//       style: TextStyle(fontSize: 25.0, color: Colors.white),
//     );
//     painter.layout();
//     painter.paint(canvas, Offset((width * 0.5) - painter.width * 0.5, (height * 0.5) - painter.height * 0.5));
//     final img = await pictureRecorder.endRecording().toImage(width, height);
//     final data = await img.toByteData(format: ui.ImageByteFormat.png);
//     return data.buffer.asUint8List();
//   }
// }