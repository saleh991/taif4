import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/services_model.dart';
import 'package:taif/screens/secondary_screens/chat_screen/private_chat_screen_subject.dart';

class ServicesProviderDetailsScreen extends StatelessWidget {
  Data? data;
  ServicesProviderDetailsScreen({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'مقدم الخدمة',
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
      body:Directionality(textDirection: TextDirection.rtl,
          child: ListView(

        children: [

          Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              Container(
                // padding: EdgeInsets.symmetric(vertical: 20.h),

                // width: 394.w,
                height: 60,
                margin: EdgeInsets.only(left: 15,right: 15),
                padding: EdgeInsets.only(left: 15,right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x63d5ddeb),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Expanded(child: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset('images/man.svg'),
                    ),),



                    Expanded(
                      flex: 3,
                      child: Text(
                        data!.name.toString(),
                        style: TextStyle(
                          fontFamily: 'JF Flat',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff007C9D),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),


                    Expanded(child: Text(
                      data!.category!.name.toString(),
                      style: TextStyle(
                        fontFamily: 'JF Flat',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xfffd6164),
                      ),
                      textAlign: TextAlign.end,
                    ),
                    ),

                  ],
                ),

                // Center(
                //   child: listTileItem(
                //     SvgPicture.asset('images/man.svg'),
                //     // Image.asset('images/man.png'),
                //     data!.name.toString(),
                //     Text(
                //       data!.category!.name.toString(),
                //       style: TextStyle(
                //         fontFamily: 'JF Flat',
                //         fontSize: 15.sp,
                //         color: const Color(0xfffd6164),
                //       ),
                //     ),
                //   ),
                // ),
              ),


              SizedBox(
                height: 25.h,
              ),
              // Image.asset(
              //   'images/map.png',
              //   height: 102.h,
              //   width: 101.h,
              // ),
              //
              SvgPicture.asset(
                "images/map2.svg",
                height: 102.h,
                width: 101.h,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'الاحياء التي يخدمها الفني',
                style: TextStyle(
                  fontFamily: 'JF Flat',
                  fontSize: 20.sp,
                  color: const Color(0xff003e4f),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25,
              ),
              // GridView.builder(
              //   itemCount:data!.neighborhoods!.length,
              //   physics: NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   padding: const EdgeInsets.all(10),
              //   itemBuilder: (BuildContext context, int index) {
              //     return servicesPlacesItem(data!.neighborhoods![index]);
              //   },
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     mainAxisSpacing: 10.0,
              //     crossAxisSpacing: 10.0,
              //     crossAxisCount: 3,
              //     childAspectRatio: 3.0,
              //   ),
              // ),


              ListView(
                padding: EdgeInsets.only(left: 11,right: 11),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 15.0,
                          runSpacing: 15.0,
                          children: List.generate(
                            data!.neighborhoods!.length, (index) => Container(

                            padding: EdgeInsets.all(10),
                            child: Text(
                              data!.neighborhoods![index],
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 17.sp,
                                color: const Color(0xffffffff),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(6),
                              color:  Color(0xff007c9d),
                              boxShadow: [
                                BoxShadow(color:Color(0xff007c9d), spreadRadius: 2),
                              ],
                            ),

                          ),)
                      ),
                    ),
                  ),
                ],
              ),


              SizedBox(
                height: 15.h,
              ),

              Padding(
                padding: EdgeInsets.only(left: 30,right: 30),
                child: Column(
                  children: [



                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child:
                          Text(
                            data!.phone.toString(),
                            style: TextStyle(
                              fontFamily: 'JF Flat',
                              fontSize: 22.sp,
                              color: const Color(0xff007c9d),
                              letterSpacing: -0.76,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),

                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                            flex: 1,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child:SvgPicture.asset('images/call2.svg',width: 40,height: 40,))
                        )
                        // Image.asset('images/phone2.png')
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PrivateChatSubjectScreen(
                            subjectId: data!.id!,
                            model: 'App\\Models\\HomeService',
                          )),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child:Text(
                              'إرسال رسالة خاصة',
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 18.sp,
                                color: const Color(0xff003e4f),
                              ),
                              textAlign: TextAlign.end,

                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              flex: 1,
                              child:
                              Align(
                                alignment: Alignment.centerRight,
                                child: SvgPicture.asset(
                                  'images/chat.svg',
                                  height: 25,
                                  width: 25,
                                ),
                              )
                          ),
                        ],
                      ),
                    )


                  ],
                ),
              ),


            ],
          )


        ],
      )
      ),
    );
  }
}
