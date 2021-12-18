
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/event_taif_bloc.dart';
import 'package:taif/backEndPe/repository/event_taif_repository.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/states.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/events_sections/event_detailes_screen.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
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
          'فعاليات الطائف',
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
      body:
      no2()

      // BlocProvider(
      //   create: (context) => LocationsCubit()..getEventSections(),
      //   child: BlocConsumer<LocationsCubit, LocationsState>(
      //     listener: (context, state) {},
      //     builder: (context, state) {
      //
      //       var eventCubit = LocationsCubit.get(context).eventModel;
      //       if (state is EventSectionsSuccessState && eventCubit.data != null) {
      //         if(first)
      //         {
      //           first=false;
      //           for(int i=0;i< eventCubit.data!.length;i++)
      //           { if(eventCubit.data![i].locationLng !=null)
      //             markers.add(Marker(
      //               onTap: (){
      //                 setState(()  {
      //                   selected=i;
      //                 });
      //               },
      //               markerId: MarkerId('Marker$i'),
      //               position: LatLng(double.tryParse(eventCubit.data![i].locationLat!)!,
      //                   double.tryParse(eventCubit.data![i].locationLng!)!),
      //               icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      //             ),);
      //           }
      //         }
      //         return SingleChildScrollView(
      //           physics: BouncingScrollPhysics(),
      //           child: SizedBox(
      //             width: ScreenUtil().screenWidth,
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 SizedBox(
      //                   height: 16.h,
      //                 ),
      //                 SizedBox(
      //                     width: 354.w,
      //                     height: 51.h,
      //                     child: languagesButton(
      //                       title:  !showMap
      //                           ? 'عرض عبر الخريطة'
      //                           : 'عرض القائمة',
      //                       function: () {
      //                         showMap = !showMap;
      //                         setState(() {});
      //                       },
      //                       color:!showMap? Color(0xFF007C9D):Color(0xFFFFBF00),
      //                     )),
      //                 SizedBox(
      //                   height: 16.h,
      //                 ),
      //                 if(!showMap)
      //                 ListView.builder(
      //                     itemCount: eventCubit.data!.length,
      //                     shrinkWrap: true,
      //                     physics: NeverScrollableScrollPhysics(),
      //                     itemBuilder: (context, index) {
      //                       return Container(
      //                         width: 394.w,
      //                         height: 120.h,
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(8.0),
      //                           border: Border.all(
      //                               width: 1.0, color: const Color(0xffcee3fb)),
      //                           boxShadow: [
      //                             BoxShadow(
      //                               color: const Color(0x1fd5ddeb),
      //                               offset: Offset(0, 3),
      //                               blurRadius: 6,
      //                             ),
      //                           ],
      //                         ),
      //                         child: eventListViewItem(
      //
      //                             eventModel: eventCubit,
      //                             index: eventCubit.data!.length-index-1,
      //                             function: () {
      //                               Navigator.push(
      //                                 context,
      //                                 MaterialPageRoute(
      //                                   builder: (context) =>
      //                                       EventDetailsScreen(
      //                                         data: eventCubit.data![eventCubit.data!.length-index-1],
      //                                       ),
      //                                 ),
      //                               );
      //                             }),
      //                       );
      //                     })
      //                 else
      //                   Stack(
      //                     children: [
      //                       SizedBox(
      //                         height: 700.h,
      //
      //                         child: GoogleMap(
      //                           mapType: MapType.normal,
      //
      //                           myLocationEnabled: true,
      //                           tiltGesturesEnabled: true,
      //                           compassEnabled: true,
      //                           myLocationButtonEnabled: true,
      //                           scrollGesturesEnabled: true,
      //                           zoomGesturesEnabled: true,
      //
      //                           onMapCreated: (GoogleMapController controller) {
      //                             _controller.complete(controller);
      //                           },
      //
      //
      //                           markers: Set<Marker>.of(markers),
      //                           gestureRecognizers: Set()
      //                             ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
      //                             ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
      //                             ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
      //                             ..add(Factory<VerticalDragGestureRecognizer>(
      //                                     () => VerticalDragGestureRecognizer())),
      //                           onTap: (latAndLon){
      //                             selected=-1;
      //                             setState(() {
      //
      //                             });
      //
      //                           },
      //                           initialCameraPosition: CameraPosition(
      //                             target: center,
      //
      //                             zoom: 15,
      //                           ),
      //                         ),
      //                       ),
      //                       if(selected>-1)
      //                         Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             SizedBox(height: 400.h,),
      //                             GestureDetector(
      //                               onTap: (){
      //                                 Navigator.push(
      //                                   context,
      //                                   MaterialPageRoute(
      //                                     builder: (context) =>
      //                                         EventDetailsScreen(
      //                                           data: eventCubit.data![selected],
      //                                         ),
      //                                   ),
      //                                 );
      //                               },
      //                               child: Container(
      //                                 color: Colors.white,
      //                                 width: ScreenUtil().screenWidth,
      //                                 height: 180.h,
      //                                 child: Row(
      //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                   crossAxisAlignment: CrossAxisAlignment.start,
      //                                   children: [
      //                                     if(eventCubit.data![selected].image !=null)
      //                                       Container(
      //                                         height: 130.h,
      //                                         width: 130.h,
      //                                         decoration: BoxDecoration(
      //
      //                                             image: DecorationImage(
      //                                                 image:NetworkImage(
      //                                                     'https://taif-app.com/storage/app/'+
      //                                                         eventCubit.data![selected].image!
      //                                                 ) ,
      //                                                 fit: BoxFit.fill
      //                                             )
      //                                         ),
      //                                       )
      //                                     else
      //                                       Container(
      //                                         height: 130.h,
      //                                         width: 130.h,
      //                                         decoration: BoxDecoration(
      //
      //                                             image: DecorationImage(
      //                                                 image:AssetImage(
      //                                                     'images/estate.jpg'
      //                                                 ) ,
      //                                                 fit: BoxFit.fill
      //                                             )
      //                                         ),
      //                                       ),
      //                                     Expanded(
      //                                       child: Padding(
      //                                         padding:  EdgeInsets.symmetric(horizontal: 7.w),
      //                                         child: Column(
      //                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                                           children: [
      //                                             Row(
      //                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                               children: [
      //                                                 SizedBox(),
      //                                                 Expanded(
      //                                                   child: Text(
      //                                                     eventCubit.data![selected].title!,
      //                                                     style: TextStyle(
      //                                                       fontFamily: 'JF Flat',
      //                                                       fontSize: 14.sp,
      //                                                       color: const Color(0xff003e4f),
      //                                                     ),
      //                                                     textAlign: TextAlign.end,
      //
      //
      //                                                     overflow: TextOverflow.ellipsis,
      //                                                   ),
      //                                                 ),
      //                                               ],
      //                                             ),
      //                                             SizedBox(
      //                                               height: 100.h,
      //                                               child: ListView(
      //                                                 children: [
      //                                                   Row(
      //                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                                     children: [
      //                                                       SizedBox(),
      //                                                       Expanded(
      //                                                         child: Text(
      //                                                           eventCubit.data![selected].content.toString(),
      //                                                           style: TextStyle(
      //                                                             fontFamily: 'JF Flat',
      //                                                             fontSize: 14.sp,
      //                                                             color: const Color(0xff4CBB17),
      //                                                           ),
      //                                                           textAlign: TextAlign.end,
      //
      //                                                         ),
      //                                                       ),
      //                                                     ],
      //                                                   ),
      //                                                 ],
      //                                               ),
      //                                             ),
      //
      //
      //
      //
      //
      //
      //
      //
      //                                           ],
      //                                         ),
      //                                       ),
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ),
      //                             ),
      //
      //                           ],
      //                         ),
      //                     ],
      //                   )
      //               ],
      //             ),
      //           ),
      //         );
      //       } else if (state is LocationsLoadingState ||
      //           state is EventLoadingState) {
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       } else {
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //     },
      //   ),
      // ),
    );
  }


  Widget no2(){
    return BlocProvider(
      create: (context)=>EventTaifBloc(EventTaifRepositoryImpl())..add(getEventTaifEventeEvent()),
      child: BlocConsumer<EventTaifBloc, EventTaifState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(state is EventTaifLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is EventTaifStateError){
            return Center(
              child: Text("يوجد خطا في الوصول البيانات"),
            );
          }else if(state is EventTaifStateLoaded){
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: SizedBox(
                width: ScreenUtil().screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 16.h,
                    // ),
                    // SizedBox(
                    //     width: 354.w,
                    //     height: 51.h,
                    //     child: languagesButton(
                    //       title:  !showMap
                    //           ? 'عرض عبر الخريطة'
                    //           : 'عرض القائمة',
                    //       function: () {
                    //         showMap = !showMap;
                    //         setState(() {});
                    //       },
                    //       color:!showMap? Color(0xFF007C9D):Color(0xFFFFBF00),
                    //     )),
                    SizedBox(
                      height: 16.h,
                    ),
                    if(!showMap)
                      ListView.builder(
                          itemCount: state.dataEventModel.data!.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              width: 394.w,
                              height: 120.h,
                              margin: EdgeInsets.all(5),
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
                              child: eventListViewItem(

                                  eventModel: state.dataEventModel,
                                  index: state.dataEventModel.data!.length-index-1,
                                  function: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EventDetailsScreen(
                                              data: state.dataEventModel.data![state.dataEventModel.data!.length-index-1],
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
                                            EventDetailsScreen(
                                              data: state.dataEventModel.data![selected],
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
                                        if(state.dataEventModel.data![selected].image !=null)
                                          Container(
                                            height: 130.h,
                                            width: 130.h,
                                            decoration: BoxDecoration(

                                                image: DecorationImage(
                                                    image:NetworkImage(
                                                        'https://taif-app.com/storage/app/'+
                                                            state.dataEventModel.data![selected].image!
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
                                                        state.dataEventModel.data![selected].title!,
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
                                                              state.dataEventModel.data![selected].content.toString(),
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
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }

        },
      ),
    );
  }
}




