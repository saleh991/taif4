import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart'as easy_localization;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/tourism_bloc.dart';
import 'package:taif/backEndPe/repository/tourism_repostory.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/DataCarTourism.dart';
import 'package:taif/models/DataTourismList.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/address_detailes_screen.dart';

class AddsTourism extends StatefulWidget {
  const AddsTourism({Key? key}) : super(key: key);

  @override
  _AddsTourismState createState() => _AddsTourismState();
}

class _AddsTourismState extends State<AddsTourism> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          "الاعلانات السياحية",
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
        ),)],
      ),


      body: no2()

    );
  }


  List<DataTourismModule>? catList;
  List<DataTourismListMModule>? productList;
  bool loading=false;
  Widget no2(){
    return BlocProvider(
      create: (context)=>TourismBloc((TourismRepostoryImpl()))
        // ..add(getTourismListEvent(idCat:"")),
        ..add(getTourismCatEvent()),
      child: BlocConsumer<TourismBloc, TourismState>(
        listener: (context, state) {},
        builder: (ctx, state) {
          // var cubit = MainCubit.get(context).favoriteModel;

          if(state is TourismStateLoading){
            loading=true;
          }

          if(state is TourismStateCatLoaded){
            catList=state.dataTourism.data;
            BlocProvider.of<TourismBloc>(ctx).add(
                getTourismListEvent(idCat:"")
            );
            loading=false;

          }
          if(state is TourismStateListLoaded){
            productList=state.dataTourismList.data;
            loading=false;
          }



          return Column(
            children: [

              SizedBox(height: 15,),

              Container(
                height: 120,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,

                child: ListView.builder(
                    itemCount: catList?.length??0,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          setState(() {
                            productList=[];
                          });

                          BlocProvider.of<TourismBloc>(ctx).add(
                              getTourismListEvent(idCat:"${catList?[index].id}")
                          );
                        },
                        child: Container(
                            height: 150,
                            // padding: EdgeInsets.only(left: 10,right: 10),
                            margin: EdgeInsets.only(left: 5,right: 5),
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //     width: 1,
                              //     color: Colors.red
                              // ),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              children: [

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(1000),
                                  child: Container(
                                    height: 80.w,
                                    width: 80.w,
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl: "https://taif-app.com/storage/app/${catList?[index].icon??""}",

                                      errorWidget: (context, url, error) =>
                                          Image.asset('images/ee.png', fit: BoxFit.fill,),
                                      imageBuilder: (context,
                                          imageProvider) { // you can access to imageProvider
                                        return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                                          backgroundImage: imageProvider,
                                        );
                                      },
                                    ),
                                  ),
                                ),

                                SizedBox(height: 8,),

                                Text(
                                  "${catList?[index].name??""}",
                                  style: TextStyle(
                                    fontFamily: fontName,
                                    fontSize: 15.sp,
                                    color: const Color(0xff007c9d),
                                  ),
                                ),
                              ],
                            )
                        ),
                      );
                    }),
              ),



              loading==true?SizedBox(
                height: MediaQuery.of(context).size.width,
                child: Center(child: CircularProgressIndicator(),),
              )
                  :
              productList==null?
              Container(
                padding: EdgeInsets.only(top: 50),
                child:  Text(
                "لايجد بيانات  حاليا",
                style: TextStyle(
                  fontFamily: fontName,
                  fontSize: 20.sp,
                  color: const Color(0xff007c9d),
                ),
              ),)
                  :
              productList!.isEmpty?
              Container(
                padding: EdgeInsets.only(top: 50),
                child:  Text(
                "لايجد بيانات  حاليا",
                style: TextStyle(
                  fontFamily: fontName,
                  fontSize: 20.sp,
                  color: const Color(0xff007c9d),
                ),
              ),)
                  :
              Expanded(child: ListView.builder(
                  itemCount: productList?.length??0,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        // BlocProvider.of<TourismBloc>(ctx).add(
                        //     getTourismListEvent(idCat:"${productList?[index].id}")
                        // );

                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>AddressDetailsScreen(dataItem:productList?[index])));
                      },
                      child: itemsListView2(productList?[index])


                    );
                  })
              )

            ],
          );
        },
      ),
    );
  }

   itemsListView2(DataTourismListMModule? productList) {
    return Container(
      height: 125.h,
      // width: 394.w,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0x1fd5ddeb),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      padding: EdgeInsets.only(right: 15),
      child: Row(
          children: [

            // * ------------------------------------Image
            Container(
              height: 80.w,
              width: 80.w,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: "https://taif-app.com/storage/app/${productList?.mainImage??""}",

                errorWidget: (context, url, error) =>
                    Image.asset('images/ee.png', fit: BoxFit.fill,),
                imageBuilder: (context,
                    imageProvider) { // you can access to imageProvider
                  return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                    backgroundImage: imageProvider,
                  );
                },
              ),


            ),

            // * ------------------------------------All

            SizedBox(
              width: 30.w,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 13.h,
                  ),


                  // * ------------------------------------Title
                  Text(
                    '${productList?.title??""}',
                    style: TextStyle(
                      fontFamily: 'JF Flat',
                      fontSize: 18.sp,
                      color: const Color(0xff003e4f),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),


                  // * ------------------------------------Fiirst
                  Expanded(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Expanded(
                          child:Row(
                            children: [
                              SvgPicture.asset(
                                "images/save.svg", height: 14, width: 12,),
                              SizedBox(
                                width: 7.h,
                              ),

                              Text(
                                productList?.category?.name??'',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 15,
                                  color: const Color(0xFF007C9D),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child:Row(
                            children: [
                              SvgPicture.asset(
                                "images/person.svg", height: 14, width: 12,),
                              SizedBox(
                                width: 7.h,
                              ),

                              Text(
                                productList?.user?.name??'',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 15,
                                  color: const Color(0xFF007C9D),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),


                  // * ------------------------------------2
                  Expanded(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Expanded(
                          child:Row(
                            children: [
                              SvgPicture.asset(
                                "images/save.svg", height: 14, width: 12,),
                              SizedBox(
                                width: 7.h,
                              ),

                              Text(
                                productList?.phone??'',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 15,
                                  color: const Color(0xFF007C9D),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child:Row(
                            children: [
                              Icon(Icons.access_time_outlined,color: Color(0xff007c9d),size: 22,),
                              // SvgPicture.asset(
                              //   "images/person.svg", height: 14, width: 12,),
                              SizedBox(
                                width: 7.h,
                              ),

                              Text(
                                easy_localization.DateFormat('yyyy-MM-dd', 'en').format(DateTime.parse(productList?.createdAt.toString()??"")),
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 13.sp,
                                  color: const Color(0xff007c9d),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 13.h,
                  ),
                ],
              ),
            ),


            SizedBox(
              width: 20.w,
            ),
          ],
        ),
    );
  }


}
