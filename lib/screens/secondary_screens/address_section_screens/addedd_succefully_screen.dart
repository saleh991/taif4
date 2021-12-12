import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/harajs_section/harajs_screen_new.dart';
import 'package:taif/screens/secondary_screens/public_services_screens/services_providers_screen.dart';

import 'harajs_section/harajs_screen.dart';
//
// class AddedSuccefullyScreen extends StatefulWidget {
//   const AddedSuccefullyScreen({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }


// }


class AddedSuccefullyScreen extends StatefulWidget {


  final String? directionScrean;

  const AddedSuccefullyScreen({Key? key, this.directionScrean}) : super(key: key);

  @override
_AddedSuccefullyScreenState createState() => _AddedSuccefullyScreenState();
}

class _AddedSuccefullyScreenState extends State<AddedSuccefullyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(children: [
            SizedBox(height: 130.h,),
            Container(
                height: 180.h,
                child: Center(child: Image.asset('images/checked.png'))),
            SizedBox(height: 20.h,),
            Center(
              child: Container(
                width: 383.w,
                height: 392.h,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(31.0),
                  color: const Color(0xffffffff),
                  border:
                  Border.all(width: 1.0, color: const Color(0xff007c9d)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffd5ddeb),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.directionScrean!=null?
                      'تم إضافة موضوعك بنجاح ..':"تم إضافة موضوعك بنجاح ويجري مراجعتة من قبل الادارة ونشرة",
                      style: TextStyle(
                        fontFamily: 'JF Flat',
                        fontSize: 25,
                        color: const Color(0xff007c9d),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    // Text(
                    //   'يتم الآن مراجعة الطلب وسيتم نشرة بعد المراجعة شكراً لكم',
                    //   style: TextStyle(
                    //     fontFamily: 'JF Flat',
                    //     fontSize: 18,
                    //     color: const Color(0xff2f4552),
                    //     letterSpacing: -0.36,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                    // SizedBox(
                    //   height: 25.h,
                    // ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       '0506499275',
                    //       style: TextStyle(
                    //         fontFamily: 'JF Flat',
                    //         fontSize: 38,
                    //         color: const Color(0xff007c9d),
                    //         letterSpacing: -0.76,
                    //       ),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //     SizedBox(
                    //       width: 5.w,
                    //     ),
                    //     Image.asset('images/phone2.png')
                    //   ],
                    // ),
                    SizedBox(
                      height: 35.h,
                    ),
                    SizedBox(
                        width: 252.w,
                        height: 51.h,
                        child: defaultButton(
                            function: () {

                              Navigator.pushReplacementNamed(
                                  context, bottomNavRoute);



                              if(widget.directionScrean=="estate"){
                                Navigator.pushNamed(context, estateRoute);
                              }
                              if(widget.directionScrean=="haraj"){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HarajsScreenNew()),
                                );
                              }
                              if(widget.directionScrean=="services"){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ServicesProviderScreen()),
                                );
                              }

                            },
                            title: 'العودة للرئيسية'))
                  ],
                ),
              ),
            ),

          ]),
        ),
      ),
    );
  }
}
