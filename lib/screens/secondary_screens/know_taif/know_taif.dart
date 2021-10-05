import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/states.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/offers_sections/offer_detailes_screen.dart';
import 'package:taif/screens/secondary_screens/know_taif/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/know_taif/cubit/state.dart';
import 'package:taif/screens/secondary_screens/know_taif/taif_details.dart';


class KnowTaifScreen extends StatefulWidget {
  const KnowTaifScreen({Key? key}) : super(key: key);

  @override
  _KnowTaifScreenState createState() => _KnowTaifScreenState();
}

class _KnowTaifScreenState extends State<KnowTaifScreen> {
  static const LatLng center = const LatLng(21.437273, 40.512714);
  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  int selected=-1;
  List<Marker> markers = [];
  bool showMap=false;
  bool first=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'تعرف على الطائف',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [InkWell(onTap:(){
          Navigator.pushNamed(context, notificationsRoute);


        },child: Image.asset('images/notification_icon.png'))],
      ),


      body: BlocProvider(
        create: (context) => TaifCubit()..getTaif(),
        child: BlocConsumer<TaifCubit, TaifState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = TaifCubit.get(context).taifModel;
            if (state is GetTaifSuccessState) {
              if(first)
                {
                  first=false;
                  for(int i=0;i< cubit.data!.length;i++)
                  { if(cubit.data![i].locationLng !=null)
                    markers.add(Marker(
                      onTap: (){
                        setState(()  {
                          selected=i;
                        });
                      },
                      markerId: MarkerId('Marker$i'),
                      position: LatLng(double.tryParse(cubit.data![i].locationLat!)!,
                          double.tryParse(cubit.data![i].locationLng!)!),
                      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                    ),);
                  }
                }

              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: SizedBox(
                  width: ScreenUtil().screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                          width: 354.w,
                          height: 51.h,
                          child: languagesButton(
                            title:  !showMap
                                ? 'عرض عبر الخريطة'
                                : 'عرض القائمة',
                            function: () {
                              showMap = !showMap;
                              setState(() {});
                            },
                            color:!showMap? Color(0xFF007C9D):Color(0xFFFFBF00),
                          )),
                      SizedBox(
                        height: 16.h,
                      ),
                      if(!showMap)
                      ListView.builder(
                          itemCount: cubit.data!.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              width: 394.w,
                              height: 120.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xffcee3fb)),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x1fd5ddeb),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: taifListViewItem(

                                  section: '${cubit.data![cubit.data!.length-index-1].views??''}',
                                  taifModel: cubit,
                                  index: cubit.data!.length-index-1,
                                  function: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            TaifDetailsScreen(
                                              data: cubit.data![cubit.data!.length-index-1],
                                            ),
                                      ),
                                    );
                                  }),
                            );
                          })
                      else
                        Stack(
                          children: [
                            SizedBox(
                              height: 700.h,

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


                                markers: Set<Marker>.of(markers),
                                gestureRecognizers: Set()
                                  ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                                  ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
                                  ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
                                  ..add(Factory<VerticalDragGestureRecognizer>(
                                          () => VerticalDragGestureRecognizer())),
                                onTap: (latAndLon){
                                  selected=-1;
                                  setState(() {

                                  });

                                },
                                initialCameraPosition: CameraPosition(
                                  target: center,

                                  zoom: 15,
                                ),
                              ),
                            ),
                            if(selected>-1)
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 400.h,),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TaifDetailsScreen(
                                                data: cubit.data![selected],
                                              ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      color: Colors.white,
                                      width: ScreenUtil().screenWidth,
                                      height: 180.h,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          if(cubit.data![selected].image !=null)
                                            Container(
                                              height: 130.h,
                                              width: 130.h,
                                              decoration: BoxDecoration(

                                                  image: DecorationImage(
                                                      image:NetworkImage(
                                                          'https://taif-app.com/storage/app/'+
                                                              cubit.data![selected].image!
                                                      ) ,
                                                      fit: BoxFit.fill
                                                  )
                                              ),
                                            )
                                          else
                                            Container(
                                              height: 130.h,
                                              width: 130.h,
                                              decoration: BoxDecoration(

                                                  image: DecorationImage(
                                                      image:AssetImage(
                                                          'images/estate.jpg'
                                                      ) ,
                                                      fit: BoxFit.fill
                                                  )
                                              ),
                                            ),
                                          Expanded(
                                            child: Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: 7.w),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      SizedBox(),
                                                      Expanded(
                                                        child: Text(
                                                          cubit.data![selected].title!,
                                                          style: TextStyle(
                                                            fontFamily: 'JF Flat',
                                                            fontSize: 14.sp,
                                                            color: const Color(0xff003e4f),
                                                          ),
                                                          textAlign: TextAlign.end,


                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 100.h,
                                                    child: ListView(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            SizedBox(),
                                                            Expanded(
                                                              child: Text(
                                                                cubit.data![selected].content.toString(),
                                                                style: TextStyle(
                                                                  fontFamily: 'JF Flat',
                                                                  fontSize: 14.sp,
                                                                  color: const Color(0xff4CBB17),
                                                                ),
                                                                textAlign: TextAlign.end,

                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),








                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                          ],
                        )
                    ],
                  ),
                ),
              );
            } else if (state is LocationsLoadingState ||
                state is OfferLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}



