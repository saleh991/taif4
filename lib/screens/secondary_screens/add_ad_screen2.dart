import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAdScreen2 extends StatefulWidget {
  static const LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  _AddAdScreen2State createState() => _AddAdScreen2State();
}

class _AddAdScreen2State extends State<AddAdScreen2> {
  String value = "";
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();

    _addressController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _addressController.dispose();
  }

  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  static final CameraPosition _currentPosition = CameraPosition(
    target: LatLng(21.365147, 40.459258),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'أضف إعلان',
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
            SizedBox(
              height: 22.h,
            ),
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
                        'إختر القسم',
                        style: TextStyle(color: Color(0xFF3A3A3A)),
                      ), // Not necessary for Option 1
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value1) {
                        value = value1!;
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
                        'اختر القسم الفرعي',
                        style: TextStyle(color: Color(0xFF3A3A3A)),
                      ), // Not necessary for Option 1
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value1) {
                        value = value1!;
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
                    'النوع',
                    style: TextStyle(color: Color(0xFF3A3A3A)),
                  ), // Not necessary for Option 1
                  items: <String>['A', 'B', 'C', 'D'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (value1) {
                    value = value1!;
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: contactTextField(
                hint: '',
                controller: _addressController,
              ),
            ),
            SizedBox(
              height: 299.h,
              width: ScreenUtil().screenWidth - 40,
              child: GoogleMap(
                initialCameraPosition: _currentPosition,
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                // initialCameraPosition: CameraPosition(
                //   target: AddAdScreen2._center,
                //   zoom: 11.0,
                // ),
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            SizedBox(
                width: 354.w,
                height: 51.h,
                child: languagesButton(
                  title: 'استمرار',
                  function: () {
                    Navigator.pushNamed(context, addAdRoute3);
                  },
                  color: Color.fromRGBO(31, 135, 22, 1),
                )),
          ],
        ),
      ),
    );
  }
}
