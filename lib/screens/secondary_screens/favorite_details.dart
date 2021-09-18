import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/estate_model.dart';
import 'package:taif/models/favorite_model.dart';
import 'package:taif/models/user_data_model.dart' as us;

import 'address_section_screens/cubit/cubit.dart';
import 'address_section_screens/cubit/states.dart';

class FavoriteDetailsScreen extends StatefulWidget {
  final AppModelsEstate favoriteData;

  FavoriteDetailsScreen(this.favoriteData);

  @override
  _FavoriteDetailsScreenState createState() => _FavoriteDetailsScreenState();
}

class _FavoriteDetailsScreenState extends State<FavoriteDetailsScreen> {
  int _current = 0;

  final CarouselController _controller = CarouselController();
  late TextEditingController _detailsController;
  late TextEditingController _commentController;
  late TextEditingController _causeController;

  @override
  void initState() {
    super.initState();
    _detailsController = TextEditingController();
    _commentController = TextEditingController();
    _causeController=TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _detailsController.dispose();
    _commentController.dispose();
    _causeController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create:
          (context) => LocationsCubit()..getUserData(),
      child: BlocConsumer<LocationsCubit,LocationsState>(
        listener: (context, state) {},
        builder: (context, state) {
          us.UserDataModel user=LocationsCubit.get(context).userDataModel;
          return  Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFEFF2F7),
              elevation: 0,
              iconTheme: IconThemeData(color: Color(0xFF003E4F)),
              centerTitle: false,
              title: Text(
                '${widget.favoriteData.favorite!.price} ريال',
                style: TextStyle(
                  fontFamily: fontName,
                  fontSize: 20.sp,
                  color: const Color(0xff007c9d),
                ),
              ),
              actions: [Image.asset('images/notification_icon.png')],
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.network(
                    'https://opencart3.const-tech.biz/tf/storage/app/${widget.favoriteData.favorite!.image}',
                    height: 230.h,
                    width: 414.w,
                  ),
                  Container(
                    width: ScreenUtil().screenWidth,
                    height: 43.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff06a1cb),
                    ),
                    child: Center(
                      child: Text(
                        '${widget.favoriteData.favorite!.title}',
                        style: TextStyle(
                          fontFamily: 'JF Flat',
                          fontSize: 23,
                          color: const Color(0xffffffff),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  listTileItem(
                    Image.asset('images/area.png'),
                    'المساحة ',
                    Text(
                      '${widget.favoriteData.favorite!.area} م',
                      style: TextStyle(
                        fontFamily: 'JF Flat',
                        fontSize: 21.sp,
                        color: const Color(0xff003e4f),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  listTileItem(
                    Image.asset('images/road.png'),
                    'عرض الشارع ',
                    Text(
                      '١٥ متر',
                      style: TextStyle(
                        fontFamily: 'JF Flat',
                        fontSize: 21.sp,
                        color: const Color(0xff003e4f),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 41.h,
                        width: 113.w,
                        child: languagesButton(
                            title: 'سكني', function: () {}, color: Color(0xFF1F8716)),
                      ),
                      SizedBox(
                        height: 41.h,
                        width: 113.w,
                        child: languagesButton(
                            title: 'تجاري',
                            function: () {},
                            color: Color(0xFF06A1CB)),
                      ),
                      SizedBox(
                        height: 41.h,
                        width: 113.w,
                        child: languagesButton(
                            title: 'الكل', function: () {}, color: Color(0xFF007C9D)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 197.h,
                      width: 389.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(211, 203, 203, 1),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                          child: Text(
                            '${widget.favoriteData.favorite!.description}',
                            style: TextStyle(
                              fontFamily: 'JF Flat',
                              fontSize: 15.sp,
                              color: const Color(0xff010d10),
                              height: 1.8.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.WARNING,
                              animType: AnimType.SCALE,

                              body: Padding(
                                padding:  EdgeInsets.all(12.0.w),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [

                                        Text(
                                          'سبب البلاغ',
                                          style: TextStyle(
                                            fontFamily: 'JF Flat',
                                            fontSize: 16.sp,
                                            color: const Color(0xff003e4f),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.h,),
                                    contactTextFieldWithHintColor(
                                        hint: '',
                                        controller: _causeController
                                    ),
                                    SizedBox(height: 12.h,),
                                    Row(
                                      children: [
                                        Text(
                                          'تفاصيل البلاغ',
                                          style: TextStyle(
                                            fontFamily: 'JF Flat',
                                            fontSize: 16.sp,
                                            color: const Color(0xff003e4f),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),


                                      ],
                                    ),
                                    SizedBox(height: 4.h,),
                                    contactTextFieldWithHintColor(
                                        hint: '',
                                        controller: _detailsController
                                    ),
                                  ],
                                ),
                              ),
                              btnCancelOnPress: () {

                              },
                              btnOkText: 'ابلاغ',
                              btnCancelText: 'الغاء',
                              btnOkOnPress: () {
                                LocationsCubit()..addReportTourism(report_title: _causeController.text,
                                    report_content: _detailsController.text
                                    ,user_id: user.data!.id.toString()
                                );
                              },
                            )..show();
                          },
                          child: Container(
                            height: 31.h,
                            width: 31.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: const Color(0x5c06a1cb)),
                            ),
                            child: Image.asset('images/flag.png'),
                          ),
                        ),
                        SizedBox(
                          width: 17.w,
                        ),
                        Container(
                          height: 31.h,
                          width: 31.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0, color: const Color(0x5c06a1cb)),
                          ),
                          child: Image.asset('images/heart.png'),
                        ),
                        SizedBox(
                          width: 17.w,
                        ),
                        Container(
                          height: 31.h,
                          width: 31.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0, color: const Color(0x5c06a1cb)),
                          ),
                          child: Image.asset('images/share.png'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                ],
              ),
            ),
          );
        },

      ),
    );
  }
}
