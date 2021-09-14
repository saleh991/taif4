import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/auth_screen/login_screen/cubit/cubit.dart';
import 'package:taif/screens/auth_screen/login_screen/cubit/states.dart';
import 'package:taif/screens/auth_screen/pin_screen.dart';
import 'package:taif/screens/auth_screen/register_screen/cubit/cubit.dart';
import 'package:taif/screens/auth_screen/register_screen/cubit/state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _phoneController;

  bool _checkBoxValue = false;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          var cubit = RegisterCubit.get(context);
          if (state is RegisterSuccessState) {
            if (cubit.registerModel.data!.code != null) {
              print('code isss ${cubit.registerModel.data!.code}');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PinScreen(
                    cubit.registerModel.data!.code!,
                    phone: _phoneController.text,
                  ),
                ),
              );
              Fluttertoast.showToast(
                  msg: '${cubit.registerModel.message ?? ''}',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.greenAccent,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              Fluttertoast.showToast(
                  msg: 'رقم الهاتف مسجل لدينا',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.redAccent,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
            if (state is RegisterErrorState) {
              Fluttertoast.showToast(
                  msg: 'رقم الهاتف مسجل لدينا',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.redAccent,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
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
                            color:
                                Color.fromRGBO(0, 124, 157, 1).withOpacity(.14),
                            spreadRadius: .001,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 431.h,
                      width: 350.w,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 41.h,
                          ),
                          Text(
                            'login_title'.tr(),
                            style: TextStyle(
                              fontFamily: 'JF Flat',
                              fontSize: 18.sp,
                              color: const Color(0xff007c9d),
                              letterSpacing: -0.36,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 37.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: defaultTextField(
                              hint: 'text_field_login'.tr(),
                              controller: _phoneController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            height: 39.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            alignment: Alignment.center,
                            width: 280.w,
                            height: 45.h,
                            child: membershipText(
                                color: Color(0xfffefefe),
                                text: 'note_login'.tr()),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.5),
                              color: Color.fromRGBO(252, 97, 100, 1),
                            ),
                          ),
                          SizedBox(
                            height: 31.h,
                          ),
                          CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _checkBoxValue,
                            onChanged: (value) {
                              setState(() {
                                _checkBoxValue = value!;
                              });
                            },
                            title: membershipText(
                                color: Color(0xff007c9d),
                                text: 'checkbox_login'.tr()),
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          SizedBox(
                            height: 45.h,
                            width: 212.w,
                            child: defaultButton(
                              function: () {
                                if (_checkBoxValue) {
                                  cubit.register(phone: _phoneController.text);
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'يجب الموافقة على سياسة الاستخدام',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 2,
                                      backgroundColor: Colors.redAccent,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }

                                // Navigator.pushReplacementNamed(context, pinRoute);
                              },
                              title: 'تسجيل',
                            ),
                          ),
                          SizedBox(height: 30.h,),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, loginRoute, (route) => false);
                            },
                            child: Text(
                              'تسجيل دخول',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'JF Flat',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
