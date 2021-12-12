import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/estates_bloc.dart';
import 'package:taif/backEndPe/repository/estates.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/estate_model.dart';
import 'estate_details2_screen.dart';
import 'package:geolocator/geolocator.dart';

class EstateMap extends StatefulWidget {
  EstateModel estateModels;
   EstateMap({Key? key,required this.estateModels}) : super(key: key);

  @override
  _EstateMapState createState() => _EstateMapState();
}

class _EstateMapState extends State<EstateMap> {
  static const LatLng center = const LatLng(21.437273, 40.512714);
  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  int selected=-1;
  int indexId=-1;
  List<Marker> markers = [];

  List catAr=["شراء فيلا","شراء ارض","شراء عمارة","شراء بيت شعبي","شراء استراحة","شراء شقة تمليك",
    "شراء دور تمليك", "شراء مزرعة","بيع فيلا","بيع ارض","بيع عمارة","بيع بيت شعبي","بيع استراحة","بيع شقة تمليك",
    "بيع دور تمليك","بيع مزرعة","ايجار فيلا", "ايجار ارض","ايجار عمارة","ايجار بيت شعبي","ايجار استراحة",
    "ايجار شقة تمليك","ايجار دور تمليك","ايجار مزرعة","فيلا للإيجار", "ارض للإيجار", "عمارة للإيجار",
    "بيت شعبي للإيجار", "استراحة للإيجار", "شقة تمليك للإيجار","دور تمليك للإيجار","مزرعة للإيجار"
  ];

  List catEn=["buy_villa","buy_land","buy_building","buy_folk_house","buy_chalet","buy_apartment",
    "buy_floor","buy_farm","sell_villa","sell_land","sell_building","sell_folk_house","sell_chalet",
    "sell_apartment","sell_floor","sell_farm", "rent_villa", "rent_land","rent_building", "rent_folk_house",
    "rent_chalet", "rent_apartment", "rent_floor","rent_farm", "leasing_villa", "leasing_land", "leasing_building",
    "leasing_folk_house", "leasing_chalet", "leasing_apartment","leasing_floor","leasing_farm"
  ];



  @override
  void dispose() {
    super.dispose();
    // _controller.
  }
  @override
  void initState() {
    // for(int i=0;i< widget.estateModel.data!.length;i++)
    //   { if(widget.estateModel.data![i].locationLng !=null)
    //     markers.add(Marker(
    //       onTap: (){
    //        // List<Placemark>  addresses = await  placemarkFromCoordinates(
    //         //  double.tryParse(widget.estateModel.data![i].locationLat!)!,
    //        //   double.tryParse(widget.estateModel.data![i].locationLng!)!,
    //          //   localeIdentifier: "en"
    //     //    );
    //       //  location=addresses[0].first.addressLine;
    //         //print(addresses[0].name);
    //         setState(()  {
    //           selected=i;
    //
    //
    //         });
    //       },
    //       markerId: MarkerId('Marker$i'),
    //       position: LatLng(double.tryParse(widget.estateModel.data![i].locationLat!)!,
    //           double.tryParse(widget.estateModel.data![i].locationLng!)!),
    //       infoWindow: InfoWindow(title: widget.estateModel.data![i].price.toString()+' ريال '),
    //
    //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    //     ),);
    //   }
    super.initState();
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
          'العقارات',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [
          InkWell(onTap:(){
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
          ),)
        ],
      ),


      body: no2(),
    );
    
  }

  int removemap=0;
  getlicon(EstatesStateLoaded state) async{
    // Marker marker = Marker(icon: BitmapDescriptor.fromBytes(markerIcon));

    try{
      setState(() {
        // markers.removeLast();
        // _controller.;
        // if(removemap==0){
        //   markers.clear();
        //   removemap++;
        // }
        // markers.clear();

        // _controller.removeMarker(markers);
        // markers.remove(markers);

        // _controller.markers.forEach((marker){
        //   mapController.removeMarker(marker);
        // });

      });
    }catch(r){
      print(r);
    }

    print(state.estateModel.data!.length.toString()+"--------");
    if(state.estateModel.data!.length>0){
    for(int i=0;i< state.estateModel.data!.length;i++)
    { if(state.estateModel.data![i].locationLng !=null) {
      //
      // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      //
      // var _distanceInMeters = await Geolocator.distanceBetween(
      //     double.tryParse(position.latitude.toString())??0,
      //     double.tryParse(position.longitude.toString())??0,
      //     double.tryParse(state.estateModel.data![i].locationLat!)!,
      //     double.tryParse(state.estateModel.data![i].locationLng!)!
      // );
      //
      // int? x =_distanceInMeters.toInt();

      // print(x);
      final Uint8List markerIcon = await getBytesFromCanvas(
          200, 100, state.estateModel.data![i].price.toString()+" رس ");

      markers.add(Marker(
          onTap: () {
            setState(() {
              selected = i;
            });
          },
          markerId: MarkerId('Marker$i'),
          position: LatLng(
              double.tryParse(state.estateModel.data![i].locationLat!)!,
              double.tryParse(state.estateModel.data![i].locationLng!)!),
          infoWindow: InfoWindow(
              title: state.estateModel.data![i].price.toString() + ' ريال '),

          icon: BitmapDescriptor.fromBytes(markerIcon)

        // BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
      );
    }

    addlatLong=1;

    try{
      setState(() {
      });
    }catch(e){}

    }
  }
  }



  dilog(context){
    // AwesomeDialog(
    //   context: context,
    //   dialogType: DialogType.INFO,
    //   animType: AnimType.BOTTOMSLIDE,
    //   title: 'الاشتراك',
    //   desc:
    //   'غير مشترك حتى تتمكن من اضافة مواضيع في العقار يجب الاشتراك بأحد الباقات او البيع مقابل نسبة',
    //   btnCancelOnPress: () {
    //     Navigator.pop(context);
    //   },
    //   btnOkText: 'الاشتراك الان',
    //   btnOkOnPress: () {
    //     Navigator.pop(context);
    //   },
    //   btnCancelText: 'البيع مقابل نسبة',
    // )..show();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'What do you want to remember?'),
                    ),
                    SizedBox(
                      width: 320.0,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color(0xFF1BC0C5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
  int addlatLong=0;
  Widget no2(){
    return BlocProvider(
      create: (context)=>EstatesBloc(EstatesRepostoryImpl())..add(getAllEstatesEventData(url: "https://taif-app.com/api/estates")),
      child: BlocConsumer<EstatesBloc, EstatesState>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = EstatesCubit.get(context).myEstateModel;
          if(state is EstatesStateLoading){
            try{
              addlatLong=0;
              print(markers.length.toString()+":::::::::::::::::::::::::::::::");
              print(markers[0].toString()+":::::::::::::::::::::::::::::::");
              print(":::::::::::::::::::::::::::::::");
              print(":::::::::::::::::::::::::::::::");
              print(":::::::::::::::::::::::::::::::");
              markers.clear();
            }catch(e){

            }
          }
          if(state is EstatesStateLoaded){

            print(markers.length.toString()+":::::::::::::::::::::::::::::::");
            print(":::::::::::::::::::::::::::::::");
            print(":::::::::::::::::::::::::::::::");
            print(":::::::::::::::::::::::::::::::");
            removemap=0;
            if(state.estateModel.data!.isEmpty){
              addlatLong=1;
              // dilog(context);

            }else{
              if(addlatLong==0){
                getlicon(state);
              }
            }


            // final Uint8List markerIcon = await getBytesFromCanvas(200, 100);


            return
                Directionality(
                    textDirection: TextDirection.rtl,

                    child: Stack(
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
                          Padding(padding: EdgeInsets.only(left: 22,right: 22),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 100.h,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EstateDetailsScreen(state.estateModel.data![selected]),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    color: Colors.white,
                                    width: ScreenUtil().screenWidth,
                                    height: 130.h,
                                    child: Row(

                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        if(state.estateModel.data![selected].mainImage !=null)
                                          Container(
                                            height: 130.h,
                                            width: 130.h,
                                            decoration: BoxDecoration(

                                                image: DecorationImage(
                                                    image:NetworkImage(
                                                        'https://taif-app.com/storage/app/'+
                                                            state.estateModel.data![selected].mainImage!
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
                                          child: Padding(padding: EdgeInsets.all(22),

                                            child:Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [

                                                SizedBox(),
                                                Expanded(
                                                  child: Text(
                                                    state.estateModel.data![selected].title!,
                                                    style: TextStyle(
                                                      fontFamily: 'JF Flat',
                                                      fontSize: 14.sp,
                                                      color: const Color(0xff003e4f),
                                                    ),
                                                    textAlign: TextAlign.end,


                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),


                                                    SizedBox(),
                                                    Expanded(
                                                      child: Text(
                                                        state.estateModel.data![selected].price.toString()+' ريال',
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



                                              SizedBox(),
                                                    Expanded(
                                                      child: Text(
                                                        "مساحه : "+
                                                        state.estateModel.data![selected].area!+'م ',
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
                                                    Expanded(
                                                      child: Text(
                                                        "تفاصيل : "+
                                                        state.estateModel.data![selected].description!+' ',
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),





                        Align(
                            alignment: Alignment.topCenter,
                            child:Container(
                              height: 40,
                              margin: EdgeInsets.only(top: 19),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                  itemCount: catAr.length,
                                  itemBuilder: (context,index){
                                    return InkWell(
                                      onTap: (){
                                        print(catEn[index]);
                                        setState(() {
                                          selected=-1;
                                          indexId=index;
                                        });
                                        BlocProvider.of<EstatesBloc>(context, listen: false).add(
                                            getAllEstatesEventData(url:"https://taif-app.com/api/estates?type="+catEn[index] ));

                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color:
                                          indexId==index?Color(0xFF007C9D):
                                          Colors.white,
                                          border: Border.all(color:  Color(0xFF007C9D),width: 2),
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        padding: EdgeInsets.only(left: 15,right: 15),
                                        margin: EdgeInsets.only(left: 5,right: 5),
                                        height: 35,
                                        child: Center(
                                          child: Text(catAr[index]),
                                        ),
                                      ),
                                    );
                                  }),
                            )
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Visibility(
                            visible: state.estateModel.data!.isEmpty?true:false,
                              child: Container(
                                height: 70,
                                margin: EdgeInsets.only(left: 22,right: 22),
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                  color:
                                  Color(0xFF007C9D),
                                  border: Border.all(color:  Color(0xFF007C9D),width: 2),
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Text("لايوجد عقارات في هذا القسم",
                                    style: TextStyle(
                                      fontFamily: 'JF Flat',
                                      fontSize: 18.sp,
                                      color: const Color(0xffffffff),
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                          ),
                        ),

                      ],
                    )
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

  Future<Uint8List> getBytesFromCanvas(int width, int height,String space) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Color(0xff0B8400);
    final Radius radius = Radius.circular(20.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: space,
      style: TextStyle(fontSize: 25.0, color: Colors.white),
    );
    painter.layout();
    painter.paint(canvas, Offset((width * 0.5) - painter.width * 0.5, (height * 0.5) - painter.height * 0.5));
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data!.buffer.asUint8List();
  }
}
