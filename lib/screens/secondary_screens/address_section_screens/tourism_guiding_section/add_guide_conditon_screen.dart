import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/cubit.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/states.dart';

// ignore: must_be_immutable
class AddGuideCondtionsScreen extends StatelessWidget {
   AddGuideCondtionsScreen({Key? key}) : super(key: key);

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
          'شروط إلاشتراك في الارشاد السياحي',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [InkWell(onTap:(){
          Navigator.pushNamed(context, notificationsRoute);
        },child: Image.asset('images/notification_icon.png'))],      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context)=>cu..getTermsAndAgreements(id: 5),
          child: BlocConsumer<EstatesCubit, EstatesState>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = EstatesCubit.get(context).termsModel;
                if(state is GetTermsSuccessState) {
                  return   Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 7,
                        child:Padding(
                          padding:  EdgeInsets.all(16.0.w),
                          child: Column(
                            children: [
                              Text(
                                'يمكنكم إلاشتراك في الارشاد السياحي',
                                style: TextStyle(
                                  fontFamily: fontName,
                                  fontSize: 20.sp,
                                  color: const Color(0xff007c9d),
                                ),
                              ),
                              Text(
                                'ويمكن اضافة مواضيعك او عروض سياحية',
                                style: TextStyle(
                                  fontFamily: fontName,
                                  fontSize: 20.sp,
                                  color: const Color(0xff007c9d),
                                ),
                              ),
                            ],
                          ),
                        ) ,
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Center(child: Image.asset('images/map.png')),
                      SizedBox(
                        height: 122.h,
                      ),
                      Center(
                        child: Container(
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
                      SizedBox(
                        height: 122.h,
                      ),
                      SizedBox(
                          width: 354.w,
                          height: 51.h,
                          child: languagesButton(
                            title: 'أتعهد وأوافق على الشروط',
                            function: () {
                              Navigator.pushNamed(context, addGuideRoute);
                            },
                            color: Color(0xFF007C9D),
                          )),
                      SizedBox(
                        height: 35.h,
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
