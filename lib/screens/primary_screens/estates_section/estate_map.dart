import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taif/models/estate_model.dart';
import 'package:taif/models/map_model.dart';

import 'estate_details_screen.dart';
class EstateMap extends StatefulWidget {
  EstateModel estateModel;
   EstateMap({Key? key,required this.estateModel}) : super(key: key);

  @override
  _EstateMapState createState() => _EstateMapState();
}

class _EstateMapState extends State<EstateMap> {
  static const LatLng center = const LatLng(21.437273, 40.512714);
  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  int selected=-1;
  List<Marker> markers = [];
  String location='';

  @override
  void initState() {
    for(int i=0;i< widget.estateModel.data!.length;i++)
      { if(widget.estateModel.data![i].locationLng !=null)
        markers.add(Marker(
          onTap: (){
           // List<Placemark>  addresses = await  placemarkFromCoordinates(
            //  double.tryParse(widget.estateModel.data![i].locationLat!)!,
           //   double.tryParse(widget.estateModel.data![i].locationLng!)!,
             //   localeIdentifier: "en"
        //    );
          //  location=addresses[0].first.addressLine;
            //print(addresses[0].name);
            setState(()  {
              selected=i;


            });
          },
          markerId: MarkerId('Marker$i'),
          position: LatLng(double.tryParse(widget.estateModel.data![i].locationLat!)!,
              double.tryParse(widget.estateModel.data![i].locationLng!)!),
          infoWindow: InfoWindow(title: widget.estateModel.data![i].price.toString()+' ريال '),

          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),);
      }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        GoogleMap(
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
        if(selected>-1)
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.h,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EstateDetailsScreen(widget.estateModel.data![selected]),
                  ),
                );
              },
              child: Container(
                color: Colors.white,
                width: ScreenUtil().screenWidth,
                height: 130.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if(widget.estateModel.data![selected].mainImage !=null)
                    Container(
                      height: 130.h,
                      width: 130.h,
                      decoration: BoxDecoration(

                        image: DecorationImage(
                          image:NetworkImage(
                          'https://taif-app.com/storage/app/'+
                              widget.estateModel.data![selected].mainImage!
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              Expanded(
                                child: Text(
                                  widget.estateModel.data![selected].title!,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              Expanded(
                                child: Text(
                                  widget.estateModel.data![selected].price.toString()+' ريال',
                                  style: TextStyle(
                                    fontFamily: 'JF Flat',
                                    fontSize: 14.sp,
                                    color: const Color(0xff4CBB17),
                                  ),
                                  textAlign: TextAlign.end,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              Expanded(
                                child: Text(
                                  widget.estateModel.data![selected].area!+'م ',
                                  style: TextStyle(
                                    fontFamily: 'JF Flat',
                                    fontSize: 14.sp,
                                    color: const Color(0xff003e4f),
                                  ),
                                  textAlign: TextAlign.end,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
      ],
    );
  }
}
