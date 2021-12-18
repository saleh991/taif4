import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/districts_bloc.dart';
import 'package:taif/backEndPe/other/apis.dart';
import 'package:taif/backEndPe/repository/districts.dart';
import 'package:taif/components/components.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/data_districts.dart';
import 'package:taif/models/home_service_categories_model.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/addedd_succefully_screen.dart';

class AddProvidersServices extends StatefulWidget {
 final List<Data> section;
  const AddProvidersServices({Key? key, required this.section}) : super(key: key);

  @override
  _AddProvidersServicesState createState() => _AddProvidersServicesState();
}

class _AddProvidersServicesState extends State<AddProvidersServices> {

  var value = 'إختر النشاط';
  int id = 0;
  String? districts;

  static const LatLng center = const LatLng(21.437273, 40.512714);
  String? long;
  String? lat;
  Map<MarkerId, Marker> markers = {};


  late TextEditingController nameUser = TextEditingController();
  late TextEditingController desServices = TextEditingController();

  Completer<GoogleMapController> _controller = Completer();

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
          'اضافه خدمه',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [InkWell(onTap: () {
          Navigator.pushNamed(context, notificationsRoute);
        }, child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 12.w
          ),
          child: Icon(
            Icons.notifications,
            color: Color(0xFF007C9D),
            size: 35.sp,
          ),
        ),)
        ],
      ),
      body:no2()

    );
  }


  Widget no2(){
    return BlocProvider(
      create:(context)=> DistrictsBloc(DistrictsImpl())..add(getAllDistrictsEvent()),
      child: BlocConsumer<DistrictsBloc, DistrictsState>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = MainCubit.get(context);
          if(state is AllDistrictsStateLoaded){
            // * --------------------------------------------------designScreen
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: designScreen(state.dataDistricts),
            );
          }if(state is AllDistrictsStateError){
            // * -------------------------------------------------Error

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Text(
                'يوجد خطا في التواصل الي البيانت',
                style: TextStyle(
                  fontFamily: fontName,
                  fontSize: 20.sp,
                  color: const Color(0xff007c9d),
                ),
              ),
            );
          }else{
            return Center(
              child:CircularProgressIndicator(),
            );
          }

        },
      ),
    );
  }

  Widget designScreen(DataDistricts? dataDistricts) {
    return SingleChildScrollView(
      child: Column(
        children: [


          SizedBox(
            height: 15.h,
          ),
          Container(
            // width: ScreenUtil().screenWidth,
            // margin: EdgeInsets.only(left: 20, right: 20),
            height: 55.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: const Color(0xffffffff),
              border: Border.all(
                  width: 1.0, color: const Color(0xffd5ddeb)),
            ),
            child: Center(
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      vertical: 2.h, horizontal: 6.w),
                  child: Row(
                    children: [

                      SvgPicture.asset("images/business.svg", height: 30.h,
                        width: 30.w,),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: StatefulBuilder(
                          builder: (context, setState) {
                            return DropdownButton<String>(
                              underline: Container(),
                              isExpanded: true,
                              iconSize: 35,
                              iconEnabledColor:
                              Color(0xFF007C9D),
                              hint: Text(
                                '$value',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 18.sp,
                                  color:
                                  const Color(0xff3a3a3a),
                                ),
                                textAlign: TextAlign.center,
                              ),
// Not necessary for Option 1
                              items: widget
                                  .section
                                  .map((value) {
                                return DropdownMenuItem<String>(
                                  value: value.name,
                                  child:
                                  new Text('${value.name}'),
                                  onTap: () {
                                    id = value.id!;
                                    print(value.id);
                                  },
                                );
                              }).toList(),
                              onChanged: (value1) {
                                setState(() {
                                  value = value1!;
                                });
                                // cubitG.changeValue(id);
                                print('value1 $value1');
                              },
                            );
                          },
                        ),
                      ),

                    ],
                  )),
            ),
          ),



          // * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

          // * اختار الحي

          SizedBox(
            height: 15.h,
          ),

          Container(
            width: MediaQuery.of(context).size.width-40,
            height:50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: const Color(0xffffffff),
              border: Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
            ),
            child: Center(
              child: DropdownButton(
                underline: Container(),
                iconEnabledColor: Color(0xff007c9d),
                items: dataDistricts!.dataDistrictsModule!.districts!.map((item) {
                  return  DropdownMenuItem(
                    child:  Padding(padding: EdgeInsets.only(left: 0,right: 0),child:  Text(item.nameAr??""),),
                    // child: new Text(value),
                    // child: Text(item.nameAr??""),
                    value: item.nameAr.toString(),
                  );
                }).toList(),
                hint: Text(
                  districts??"اختار الحي",
                  style: TextStyle(color: Color(0xFF3A3A3A)),
                ),
                onChanged: (newVal) {
                  setState(() {
                    districts = newVal.toString();
                    debugPrint(newVal.toString());
                  });
                },
                value: districts,
                isExpanded: false,
                // isDense: true,
              ),
            ),
          ),


          SizedBox(
            height: 15.h,
          ),

          contactTextField(
            hint: 'الاسم',
            controller: nameUser,
          ),


          SizedBox(
            height: 15.h,
          ),

          contactTextField(
            hint: 'الوصف',
            controller: desServices,
            line: 3
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
          // SizedBox(
          //   height: 30.h,
          // ),

















          SizedBox(
            height: 25.h,
          ),
          SizedBox(
              width: 354.w,
              height: 51.h,
              child: languagesButton(
                title: 'استمرار',

                function: () {

                  if(id==0){
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.ERROR,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'نقص في المعلومات',
                      desc: 'اختر النشاط ',
                      btnOkText: 'تم',

                      btnOkOnPress: () {},
                    )..show();
                  }
                  else if(districts==null){
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.ERROR,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'نقص في المعلومات',
                      desc: ' اختر الحي ',
                      btnOkText: 'تم',

                      btnOkOnPress: () {},
                    )..show();
                  }
                  else if(nameUser.text.toString().length<3){
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.ERROR,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'نقص في المعلومات',
                      desc: 'اضافه الاسم ',
                      btnOkText: 'تم',

                      btnOkOnPress: () {},
                    )..show();
                  }
                  else if(desServices.text.toString().length<3){
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.ERROR,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'نقص في المعلومات',
                      desc: 'اضافه الوصف ',
                      btnOkText: 'تم',

                      btnOkOnPress: () {},
                    )..show();
                  }
                  else {

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => Center(
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CupertinoActivityIndicator(),
                          ),
                        ),
                      ),
                    );
                    Map<String,dynamic> body={
                      "home_service_category_id":id,
                      "user_id":AppController.instance.getId().toString(),
                      "name":nameUser.text.toString().trim(),
                      "neighborhoods":desServices.text.toString().trim(),
                      "location_lat":lat,
                      "location_lng":long,
                      "district":districts
                    };

                    Future<dynamic?>? getHeraj;
                    getHeraj=Api.addServices(body);
                    getHeraj.then((value)  {
                      setState(() {
                        // Navigator.pop(context);

                        if(value==true){
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (BuildContext context) => AddedSuccefullyScreen(directionScrean: "services",)),
                              ModalRoute.withName('/')
                          );

                        }else{
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'خطا في المعلومات',
                            desc: 'يرجي التاكد من البيانات',
                            btnOkText: 'تم',

                            btnOkOnPress: () {},
                          )..show();
                        }

                      });
                    }).catchError((onError){
                      Navigator.pop(context);
                    });
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) =>
                  //         AddAdScreen3(
                  //             category: category,
                  //             authOption: authOption,
                  //             lat: lat,
                  //             long: long,
                  //             type: type,
                  //             districts: districts,
                  //             payType: widget.payType,
                  //             image: widget.image,
                  //             otherImages: widget.otherImages,
                  //             side:dataDistricts.dataDistrictsModule!.sides
                  //         )),
                  //   );
                  }
                },
                color: Color.fromRGBO(31, 135, 22, 1),
              )),

          SizedBox(
            height: 30.h,
          ),


        ],
      ),
    );
  }
}
