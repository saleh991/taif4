import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/cubit.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/states.dart';

import 'add_ad_screen1.dart';

// ignore: must_be_immutable
class AdsConditionScreen extends StatelessWidget {
   String payType;
   AdsConditionScreen({Key? key,required this.payType}) : super(key: key);

  EstatesCubit cu=EstatesCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'شروط اضافة اعلان للعقارات',
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
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context)=>cu..getTermsAndAgreements(id: 2),
          child: BlocConsumer<EstatesCubit, EstatesState>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = EstatesCubit.get(context).termsModel;
                if(state is GetTermsSuccessState) {
                  return Stack(
                    children: [




                   Padding(padding: EdgeInsets.only(top: 80,bottom: 50),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         SizedBox(
                           height: 28.h,
                         ),
                         Column(
                             children: [



                               Center(
                                 child: Container(
                                   width: 383.w,
                                   height: 501.h,
                                   padding: EdgeInsets.only(left: 15,right: 15,top: 80),
                                   // padding: EdgeInsets.symmetric(horizontal: 35),
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25.0),
                                     color: Colors.white,
                                     boxShadow: [
                                       BoxShadow(
                                         color: const Color(0xffd5ddeb),
                                         offset: Offset(0, 3),
                                         blurRadius: 6,
                                       ),
                                     ],
                                   ),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       Text(
                                         'دفع الرسوم والشروط',
                                         style: TextStyle(
                                           fontFamily: 'JF Flat',
                                           fontSize: 22,
                                           color: const Color(0xff002a36),
                                           decoration: TextDecoration.underline,
                                         ),
                                         textAlign: TextAlign.right,
                                       ),
                                       SizedBox(
                                         height: 15.h,
                                       ),
                                       Text(
                                         cubit.data!.content!,
                                         style: TextStyle(
                                           fontFamily: 'JF Flat',
                                           fontSize: 16,
                                           color: const Color(0xff003e4f),
                                         ),
                                         textAlign: TextAlign.right,
                                       )
                                     ],
                                   ),
                                 ),
                               ),

                             ]),

                         SizedBox(
                           height: 28.h,
                         ),



                         SizedBox(
                             width: 354.w,
                             height: 51.h,
                             child: languagesButton(
                               title: 'أتعهد وأوافق على الشروط',
                               function: () {
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) => AddAdScreen1(
                                     payType: payType,
                                   )),
                                 );
                               },
                               color: Color.fromRGBO(31, 135, 22, 1),
                             )),



                         SizedBox(
                           height: 48.h,
                         ),
                       ],
                     ),
                   ),




                      Padding(padding: EdgeInsets.only(top: 48.h),
                        child:Center(
                            child: SvgPicture.asset("images/termesAdd.svg",height: 120,width: 120,)
                        ),
                      ),


                    ],
                  );
                }
                else{
                  return Container(
                    height: 700.h,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }

          ),
        ),
      ),
    );
  }
}
