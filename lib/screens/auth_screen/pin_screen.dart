import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/auth_screen/activation_screen.dart';

class PinScreen extends StatefulWidget {
final int code;
final String phone;

  PinScreen(this.code,{required this.phone});

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/3screen.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsetsDirectional.only(top: 90.h),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 124, 157, 1).withOpacity(.14),
                      spreadRadius: .001,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: 431.h,
                width: 350.w,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Column(
                    children: [
                      Image.asset(
                        'images/msg_img.png',
                        height: 177.h,
                        width: 177.w,
                      ),
                      PinCodeTextField(
                        keyboardType: TextInputType.number,
                        textStyle: TextStyle(
                          fontFamily: fontName,
                          fontSize: 35.sp,
                          color: Color.fromRGBO(5, 145, 184, 1),
                        ),
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(23),
                          fieldHeight: 70.h,
                          fieldWidth: 70.w,
                          activeFillColor: Colors.white,
                          errorBorderColor: Colors.grey,
                          inactiveColor: Color(0xffCECBCB),
                          inactiveFillColor: Colors.white,
                          activeColor: Color(0xffCECBCB),
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        enableActiveFill: false,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                            print('current code $currentText');
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                        appContext: context,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'dont_receive'.tr(),
                            style: TextStyle(
                              fontFamily: 'JF Flat',
                              color: Colors.red,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            width: 19.w,
                          ),
                          Text(
                            'resend'.tr(),
                            style: TextStyle(
                              fontFamily: 'JF Flat',
                              fontSize: 21,
                              color: Color(0xff399432),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      SizedBox(
                        height: 45.h,
                        width: 212.w,
                        child: defaultButton(
                            title: "login_btn".tr(),
                            function: () {
                              if(currentText == '${widget.code}'){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ActivationScreen(widget.phone)));
                                Fluttertoast.showToast(
                                    msg: 'تم التفعيل بنجاح',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.greenAccent,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }else{
                                Fluttertoast.showToast(
                                    msg: 'الكود غير صحيح',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.redAccent,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }

                            }),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
