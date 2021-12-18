import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/location_services_bloc.dart';
import 'package:taif/backEndPe/repository/location_services.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/DataTourismList.dart';

import 'package:taif/models/location_model.dart';
import 'package:url_launcher/url_launcher.dart';




class AddressDetailsScreen extends StatefulWidget {
  final Data? data;
  DataTourismListMModule? dataItem;
   AddressDetailsScreen({Key? key,  this.data, this.dataItem}) : super(key: key);

  @override
  _AddressDetailsScreenState createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'تفاصيل الموقع',
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
      body: SizedBox(
        width: ScreenUtil().screenWidth,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child:no2()

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     SizedBox(
          //       height: 35,
          //     ),
          //     Container(
          //       height: 54.h,
          //       width: 350.w,
          //       padding: EdgeInsets.symmetric(horizontal: 35),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10.0),
          //         color: const Color(0xa1ffffff),
          //         border: Border.all(width: 1.0, color: const Color(0xa1c5c0c0)),
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //            widget.data.title.toString(),
          //             style: TextStyle(
          //               fontFamily: fontName,
          //               fontSize: 18.sp,
          //               color: const Color(0xff1e8aa8),
          //             ),
          //             textAlign: TextAlign.center,
          //           ),
          //           Text(
          //             DateFormat('yyyy-MM-dd').format(DateTime.parse( widget.data.createdAt.toString())),
          //             style: TextStyle(
          //               fontFamily:fontName,
          //               fontSize: 13.sp,
          //               color: const Color(0xfff92a0a),
          //             ),
          //             textAlign: TextAlign.center,
          //           )
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 23.h,
          //     ),
          //     CachedNetworkImage(
          //       fit: BoxFit.fill,
          //       height: 178.h,
          //       width: 246.w,
          //       imageUrl: "https://taif-app.com/storage/app/${ widget.data.mainImage}",
          //
          //       errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),),
          //
          //     SizedBox(
          //       height: 35.h,
          //     ),
          //    for(int i=0;i<widget.data.images!.length;i++)
          //       Column(
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               CachedNetworkImage(
          //                 fit: BoxFit.fill,
          //                 height: 219.h,
          //                 width: 300.w,
          //                 imageUrl: "https://taif-app.com/storage/app/${ widget.data.images![i].path}",
          //
          //                 errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),),
          //
          //             ],
          //           ),
          //           SizedBox(
          //             height: 35.h,
          //           ),
          //         ],
          //       ),
          //
          //     Text(
          //       widget.data.content.toString(),
          //       style: TextStyle(
          //         fontFamily: fontName,
          //         fontSize: 15.sp,
          //         color: const Color(0xff3897b2),
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //     SizedBox(
          //       height: 75.h,
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }


  Widget no2(){
    return BlocProvider(
      create: (context)=>LocationServicesBloc(LocationServicesRepostoryImpl())..add(getSingleLocationServicesEvent(id: widget.dataItem!.id.toString())),
      child: BlocConsumer<LocationServicesBloc, LocationServicesState>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = EstatesCubit.get(context).myEstateModel;
          if(state is LocationServicesStateLoaded){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                ),
                Container(
                  height: 54.h,
                  width: 350.w,
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color:  Color(0xa1ffffff),
                    border: Border.all(width: 1.0, color: const Color(0xa1c5c0c0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          state.dataSingelLocationService.data!.title.toString(),
                          style: TextStyle(
                            fontFamily: fontName,
                            fontSize: 18.sp,
                            color: const Color(0xff1e8aa8),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Text(
                        DateFormat('yyyy-MM-dd').format(DateTime.parse(state.dataSingelLocationService.data!.createdAt.toString())),

                        style: TextStyle(
                          fontFamily:fontName,
                          fontSize: 13.sp,
                          color: const Color(0xfff92a0a),
                        ),
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: 178.h,
                  width: 246.w,
                  imageUrl: 'https://taif-app.com/storage/app/${state.dataSingelLocationService.data!.mainImage}',

                  errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),),


                SizedBox(
                  height: 35.h,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: 20.w,
                    vertical: 5.w
                  ),
                  child: Text(
                    state.dataSingelLocationService.data!.content.toString(),
                    style: TextStyle(
                      fontFamily: fontName,
                      fontSize: 15.sp,
                      color: const Color(0xff3897b2),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),


                Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: 20.w
                  ),
                  child:Container(
                    height: 170,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff707070).withOpacity(.4),width: 2),
                      borderRadius: BorderRadius.circular(22)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                      Container(
                      height: 43,
                      width: 210,
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.only(top:3.0,bottom: 3,right: 10,left: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff06A1CB),width: 2),
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: InkWell(
                        onTap: (){
                          launch("tel://${state.dataSingelLocationService.data!.phone}");
                        },
                        child:  Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child:  Text(
                              state.dataSingelLocationService.data!.phone.toString(),
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 18,
                                color: const Color(0xff007c9d),
                                letterSpacing: -0.76,
                              ),
                              textAlign: TextAlign.center,
                            ),),

                            SizedBox(
                              width: 5.w,
                            ),
                            // SvgPicture.asset('images/phone2.svg',height: 33,width: 33,)
                            Image.asset('images/phone2.png')
                          ],
                        ),
                        ),
                      ),



                        Container(
                          height: 31,
                          width: 140,
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.only(top:3.0,bottom: 3,right: 10,left: 10),
                          decoration: BoxDecoration(
                            color: Color(0xff2CCE62) ,
                              border: Border.all(color: Color(0xff2CCE62),width: 2),
                              borderRadius: BorderRadius.circular(26)
                          ),
                          child: InkWell(
                            onTap: (){
                              // launch("tel://${state.dataSingelLocationService.data!.phone}");
                              _launchMapsUrl(double.tryParse(state.dataSingelLocationService.data!.locationLat.toString())??0,
                                  double.tryParse(state.dataSingelLocationService.data!.locationLng.toString())??0);
                            },
                            child:  Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child:  Text(
                                  'عرض على الخريطة',
                                  style: TextStyle(
                                    fontFamily: 'JF Flat',
                                    fontSize: 12,
                                    color: Colors.white,
                                    letterSpacing: -0.76,
                                  ),
                                  textAlign: TextAlign.center,
                                ),),


                                // Image.asset('images/phone2.png')
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
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

  void _launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

