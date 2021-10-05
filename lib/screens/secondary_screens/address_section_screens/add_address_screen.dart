import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/states.dart';
import 'package:video_player/video_player.dart';

class AddAddressScreen extends StatefulWidget {


  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  late TextEditingController _detailsController;
  late TextEditingController _titleController;
  VideoPlayerController? _videoPlayerController;
   File? profileImage;
  File? video;
  String? long;
  String? lat;
  late List<File> otherImage;
  var picker = ImagePicker();
  static const LatLng center = const LatLng(21.437273, 40.512714);
  Map<MarkerId, Marker> markers = {};
  LocationsCubit cu=LocationsCubit();

  Future<void> getImage() async {
    final pickerFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickerFile != null) {
      profileImage = File(pickerFile.path);

    } else {
      print('No Image Selected');

    }
  }

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

  Future<void> selectImages() async {
    var pickerFile = await picker.pickMultiImage(

    );
    if (pickerFile != null) {
      for(var im in pickerFile)
        {
          File file = File(im.path);
          otherImage.add(file);
        }
      print(' Image Selected');
      print(otherImage);
      print(' Image Selected');


    } else {
      print('No Image Selected');

    }
  }


  Future<void> getVideo() async {
    final pickerFile = await picker.pickVideo(
      source: ImageSource.gallery,

    );
    if (pickerFile != null) {
      video = File(pickerFile.path);
      _videoPlayerController=VideoPlayerController.file(video!)..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {

        });
      });

    } else {
      print('No video Selected');

    }
  }

  @override
  void initState() {
    lat=center.latitude.toString();
    long=center.longitude.toString();
    otherImage=[];
    super.initState();
    MarkerId markerId = MarkerId('orgin');
    Marker marker =
    Marker(markerId: markerId,
        icon: BitmapDescriptor.defaultMarker ,
        position: center);
    markers[markerId] = marker;
    _detailsController = TextEditingController();
    _titleController=TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _detailsController.dispose();
    _titleController.dispose();
    _videoPlayerController!.dispose();
  }

  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();



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
        },child: Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: 12.w
          ),
          child: Icon(
            Icons.notifications,
            color: Color(0xFF007C9D),
            size: 35.sp,
          ),
        ),)],      ),
      body: BlocProvider(
        create:
            (context) => cu,
        child: BlocConsumer<LocationsCubit,LocationsState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    if(profileImage==null)
                      addFromGalleryItems(
                          title: 'صورة شخصية', icon: Icons.camera_alt, function: () async {
                        print(profileImage);
                        await getImage();
                        print(profileImage);
                        setState(() {

                        });
                      })
                    else
                      Column(
                        children: [
                          Container(
                            height: 130.h,
                            width: 130.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: FileImage(profileImage!,
                                    ),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          SizedBox(
                            width: 150.w,
                            child: languagesButtonWithIcon(
                              title:  "تغير الصورة ",
                              icon: Icon(
                                Icons.camera_alt_outlined,
                              ),
                              function: () async {
                                print(profileImage);
                                await getImage();
                                print(profileImage);
                                setState(() {

                                });
                              },
                              color: Color(0xff25afff),
                            ),
                          )
                        ],
                      ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    if(otherImage.isEmpty)
                    addFromGalleryItems(
                        title: 'أرفق صور إضافية',
                        icon: Icons.photo_library_sharp,
                        function: () async {
                        await  selectImages();
                        setState(() {

                        });
                        })else
                      Column(
                        children: [
                          SizedBox(
                            height: 150.h,
                            child: ListView.builder(
                              itemCount: otherImage.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                              return  Padding(
                                padding:  EdgeInsets.only(
                                  left: 8.w
                                ),
                                child: Container(
                                  height: 130.h,
                                  width: 130.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: FileImage(otherImage[index],
                                          ),
                                          fit: BoxFit.fill
                                      )
                                  ),
                                ),
                              );
                            },),
                          ),
                          SizedBox(
                            width: 150.w,
                            child: languagesButtonWithIcon(
                              title:  "تغير الصور ",
                              icon: Icon(
                                Icons.camera,
                              ),
                              function: () async {
                                await selectImages();
                                setState(() {

                                });
                              },
                              color: Color(0xff25afff),
                            ),
                          )
                        ],
                      ),

                    SizedBox(
                      height: 10.h,
                    ),
                    if(video==null)
                    addFromGalleryItems(
                        title: 'أرفق فيديو',
                        icon: Icons.video_call_outlined,
                        function: () async{
                        await  getVideo();
                        print("video");
                        print(video);
                        print("video");
                        setState(() {

                        });
                        })else
                      Column(
                        children: [
                          Container(
                            height: 300.h,
                            width: ScreenUtil().screenWidth*0.9,
                            child: _videoPlayerController!.value.isInitialized
                                ? InkWell(
                              onTap: (){
                                _videoPlayerController!.value.isPlaying
                                    ? _videoPlayerController!.pause()
                                    : _videoPlayerController!.play();
                              },
                                  child: AspectRatio(
                              aspectRatio: _videoPlayerController!.value.aspectRatio,
                              child: VideoPlayer(_videoPlayerController!),
                            ),
                                )
                                : Container(),
                          ),
                          SizedBox(
                            width: 150.w,
                            child: languagesButtonWithIcon(
                              title:  "تغير الفيديو ",
                              icon: Icon(
                                Icons.video_call_outlined,
                              ),
                              function: () async {
                                print(video);
                                await getVideo();
                                print(video);
                                setState(() {

                                });
                              },
                              color: Color(0xff25afff),
                            ),
                          )
                        ],
                      ),

                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'العنوان',
                        style: TextStyle(
                          fontFamily: 'JF Flat',
                          fontSize: 15.sp,
                          color: const Color(0xff003e4f),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    contactTextField(
                      hint: '',
                      controller: _titleController,

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
                      height: 25.h,
                    ),
                    SizedBox(
                        width: 354.w,
                        height: 51.h,
                        child: languagesButton(
                          title: 'إضافة ونشر',
                          function: () {
                            if(profileImage==null)
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.INFO,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'نقص في المعلومات',
                                desc: 'يجب اضافة صورة شخصية',
                                btnOkText: 'تم',

                                btnOkOnPress: () {},
                              )..show();
                            else   if(_titleController.text.length==0||_titleController.text.trim()=='')
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.INFO,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'نقص في المعلومات',
                                desc: 'يجب اضافة عنوان',
                                btnOkText: 'تم',

                                btnOkOnPress: () {},
                              )..show();
                            else   if(_detailsController.text.length==0||_detailsController.text.trim()=='')
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.INFO,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'نقص في المعلومات',
                                desc: 'يجب اضافة تفاصيل',
                                btnOkText: 'تم',

                                btnOkOnPress: () {},
                              )..show();
                            LocationsCubit()..addLocation(
                                title: _titleController.text,
                                phone: '1234',
                                content: _detailsController.text,
                                location_service_category_id: '1',
                                location_lat: lat!,
                                location_lng: long!,
                                image: profileImage!);
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
            );
          },

        ),
      ),

    );
  }
}
