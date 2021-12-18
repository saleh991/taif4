import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/data_catigry_and_sup_in_heraj.dart';
import 'package:taif/models/haraj_category.dart';
import 'package:taif/models/haraj_category.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/cubit.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/states.dart';

import 'add_haraj_screen.dart';

class HarajCondtionsScreen extends StatelessWidget {
 // final HarajCategory harajCategory;
 final List<DataCataGryAndSu_Haraj>? harajCategory;

   HarajCondtionsScreen({Key? key,required  this.harajCategory,
    // required this.harajCategory
  }) : super(key: key);
 EstatesCubit cu=EstatesCubit();

  @override
  Widget build(BuildContext context) {

    // print(harajCategory.data!.length.toString()+" ??????????????");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'شروط اعلان الحراج',
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
      body:SingleChildScrollView(
        child: BlocProvider(
          create: (context)=>cu..getTermsAndAgreements(id: 3),
          child: BlocConsumer<EstatesCubit, EstatesState>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = EstatesCubit.get(context).termsModel;
                if(state is GetTermsSuccessState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 28.h,
                      ),


                      Padding(
                        padding: EdgeInsets.only(left: 22,right: 22,),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                          child: Padding(
                              padding: EdgeInsets.only(left: 22,right: 22,top: 11,bottom: 11),
                              child: Text("يمكنكم عبر هذه الخدمة إضافة نشاطكم "
                              "التجاري أو موقع سياحي"
                          ,
                            style: TextStyle(
                              color: Color(0xff007C9D),
                              fontSize: 18,
                              fontFamily: 'JF Flat',
                            ),
                                 textAlign: TextAlign.center,
                          ),
                        ),
                        ),
                      ),

                      SizedBox(
                        height: 28.h,
                      ),




                      SizedBox(
                        child: Stack(
                          children: [

                            Padding(
                              padding: EdgeInsets.only(top: 90),
                              child: Column(children: [


                                Center(
                                  child: Container(
                                    width: 383.w,
                                    height: 501.h,
                                    padding: EdgeInsets.symmetric(horizontal: 15),
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
                                        SizedBox(height: 90,),
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
                            ),


                            Center(child: SvgPicture.asset("images/map.svg",height: 128,width: 143,),),
                            // Center(child: Image.asset('images/map.png')),

                          ],
                        ),
                      ),




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
                                MaterialPageRoute(builder: (context) => AddHarajsScreen(
                                  harajCategory: harajCategory,
                                )),
                              );
                            },
                            color: Color(0xFF007C9D),
                          )),
                      SizedBox(
                        height: 35.h,
                      ),


                      SizedBox(
                        height: 28.h,
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
