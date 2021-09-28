import 'dart:async';
import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_ad_screen3.dart';

// ignore: must_be_immutable
class AddAdScreen2 extends StatefulWidget {
  File image;
  List<File> otherImages;
  String payType;
  AddAdScreen2({
     required this.image,
    required this.payType,
    required this.otherImages,
    });


  @override
  _AddAdScreen2State createState() => _AddAdScreen2State();
}

class _AddAdScreen2State extends State<AddAdScreen2> {
  static const LatLng center = const LatLng(21.437273, 40.512714);
  String? long;
  String? lat;
  Map<MarkerId, Marker> markers = {};
  String type = "فيلا";
  String category = 'عرض عقار';
  String authOption = "الكل";
  late TextEditingController _addressController;


  void currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    late LocationData currentLocation;
    var location = new Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {

    }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
        zoom: 17.0,
      ),
    ));
  }


  @override
  void initState() {
    super.initState();
    lat=center.latitude.toString();
    long=center.longitude.toString();
    MarkerId markerId = MarkerId('orgin');
    Marker marker =
    Marker(markerId: markerId,
        icon: BitmapDescriptor.defaultMarker ,
        position: center);
    markers[markerId] = marker;
    _addressController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _addressController.dispose();
  }

  Completer<GoogleMapController> _controller = Completer();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'أضف إعلان للعقارات',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [InkWell(onTap:(){
          Navigator.pushNamed(context, notificationsRoute);
        },child: Image.asset('images/notification_icon.png'))],      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 180.w,
                  height: 43.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: const Color(0xffffffff),
                    border:
                        Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      iconEnabledColor: Colors.red,
                      hint: Text(
                        category,
                        style: TextStyle(color: Color(0xFF3A3A3A)),
                      ), // Not necessary for Option 1
                      items: <String>['طلب عقار', 'عرض عقار'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value1) {
                        print(value1);
                        category = value1!;
                        setState(() {

                        });
                      },
                    ),
                  ),
                ),
                Container(
                  width: 180.w,
                  height: 43.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: const Color(0xffffffff),
                    border:
                        Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      iconEnabledColor: Colors.red,
                      hint: Text(
                        authOption,
                        style: TextStyle(color: Color(0xFF3A3A3A)),
                      ), // Not necessary for Option 1
                      items: <String>['الكل', 'تجاري', 'سكني'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value1) {
                        print(value1);
                        authOption = value1!;
                        setState(() {

                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              width: 380.w,
              height: 43.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
              ),
              child: Center(
                child: DropdownButton<String>(
                  iconEnabledColor: Colors.red,
                  hint: Text(
                    type,
                    style: TextStyle(color: Color(0xFF3A3A3A)),
                  ), // Not necessary for Option 1
                  items: <String>['فيلا', 'ارض', 'بناء','بيت شعبي',
                    'شاليه','شقة','طابق','مزرعة'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (value1) {
                    print(value1);
                    type = value1!;
                    setState(() {

                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'حدد الموقع على الخريطة',
              style: TextStyle(
                fontFamily: 'JF Flat',
                fontSize: 15,
                color: const Color(0xff3a3a3a),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 19,
            ),
            Image.asset(
              'images/map.png',
              height: 57.h,
              width: 64.w,
            ),
            SizedBox(
              height: 20.h,
            ),

            SizedBox(
              height: 299.h,
              width: ScreenUtil().screenWidth - 40,
              child: GoogleMap(
                mapType: MapType.normal,

                myLocationEnabled: true,
                tiltGesturesEnabled: true,
                compassEnabled: true,
                myLocationButtonEnabled: true,
                scrollGesturesEnabled: true,
                zoomGesturesEnabled: true,

                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },


                markers: Set<Marker>.of(markers.values),
                gestureRecognizers: Set()
                  ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                  ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
                  ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
                  ..add(Factory<VerticalDragGestureRecognizer>(
                          () => VerticalDragGestureRecognizer())),
                onTap: (latAndLon){
                  print(latAndLon);
                  MarkerId markerId = MarkerId('orgin');
                  Marker marker =
                  Marker(markerId: markerId,
                      icon: BitmapDescriptor.defaultMarker ,
                      position: latAndLon);
                  markers[markerId] = marker;
                  lat=latAndLon.latitude.toString();
                  long=latAndLon.longitude.toString();
                  setState(() {

                  });
                },
                initialCameraPosition: CameraPosition(
                  target: center,

                  zoom: 15,
                ),
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            SizedBox(
                width: 354.w,
                height: 51.h,
                child: languagesButtonWithIcon(
                  title: 'موقعي الحالي',
                  icon: Icon(Icons.edit_location_outlined),
                  function: () async{
                    currentLocation();

                  },
                  color: Color(0xFF007C9D),
                )),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
                width: 354.w,
                height: 51.h,
                child: languagesButton(
                  title: 'استمرار',

                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddAdScreen3(
                        category: category,
                        authOption: authOption,
                        lat: lat,
                        long: long,
                        type: type,
                        payType: widget.payType,
                        image: widget.image,
                        otherImages: widget.otherImages,
                      )),
                    );
                  },
                  color: Color.fromRGBO(31, 135, 22, 1),
                )),
          ],
        ),
      ),
    );
  }
}
