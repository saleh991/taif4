import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddHarajsScreen extends StatefulWidget {
  const AddHarajsScreen({Key? key}) : super(key: key);
  static const LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  _AddHarajsScreenState createState() => _AddHarajsScreenState();
}

class _AddHarajsScreenState extends State<AddHarajsScreen> {
  late TextEditingController _detailsController;

  @override
  void initState() {
    super.initState();

    _detailsController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _detailsController.dispose();
  }

  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'إضافة موقع',
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              addFromGalleryItems(
                  title: 'أرفق صورة', icon: Icons.camera_alt, function: () {}),
              SizedBox(
                height: 10.h,
              ),
              addFromGalleryItems(
                  title: 'أرفق صور إضافية',
                  icon: Icons.photo_library_sharp,
                  function: () {}),
              SizedBox(
                height: 10.h,
              ),
              addFromGalleryItems(
                  title: 'أرفق فيديو',
                  icon: Icons.video_call_outlined,
                  function: () {}),
              SizedBox(
                height: 45.h,
              ),
              Center(
                child: defaultCheckBox(title: 'لا يوجد صور ليتم أرفاقها'),
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'إضافة التفاصيل',
                  style: TextStyle(
                    fontFamily: 'JF Flat',
                    fontSize: 15.sp,
                    color: const Color(0xff003e4f),
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              contactTextField(
                hint: '',
                controller: _detailsController,
                line: 10,
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                height: 82.h,
                width: 378.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.0),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffd5ddeb),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'مطلوب إضافة الموقع على الخريطةلكي يصل الزوار للموقع',
                    style: TextStyle(
                      fontFamily: 'JF Flat',
                      fontSize: 18,
                      color: const Color(0xff007c9d),
                      height: 1.5,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(
                height: 299.h,
                width: ScreenUtil().screenWidth - 40,
                child: GoogleMap(
                  mapType: MapType.normal,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: AddHarajsScreen._center,
                    zoom: 11.0,
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(
                  width: 354.w,
                  height: 51.h,
                  child: languagesButton(
                    title: 'إضافة ونشر',
                    function: () {
                      Navigator.pushReplacementNamed(
                          context, addedSuccefullyRoute);
                    },
                    color: Color(0xFF007C9D),
                  )),
              SizedBox(
                height: 35.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
