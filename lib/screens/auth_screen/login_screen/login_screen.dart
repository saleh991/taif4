import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taif/components/components.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/auth_screen/login_screen/cubit/cubit.dart';
import 'package:taif/screens/auth_screen/login_screen/cubit/states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          var cubit = LoginCubit.get(context);
          if (state is LoginSuccessState) {
            if (cubit.userDataModel.code != 433) {
              AppController.instance.setId(cubit.userDataModel.data!.id!);
              AppController.instance.hasLogin(true);
              Navigator.pushReplacementNamed(context, bottomNavRoute);
            }else{
              Fluttertoast.showToast(
                  msg: 'تأكد من البيانات المدخلة',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.redAccent,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
          if(state is LoginErrorState){
            Fluttertoast.showToast(
                msg: 'تأكد من البيانات المدخلة',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.redAccent,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
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
                            height: 15.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: defaultTextField(
                              function: () {
                                cubit.changeVisibility();
                              },
                              hint: 'كلمة المرور',
                              controller: _passwordController,
                              hasSuffix: true,
                              obscureText: cubit.visibility ? true : false,
                              suffixIcon: Icon(
                                cubit.visibility
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color(0xFF007C9D),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 39.h,
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          SizedBox(
                            height: 45.h,
                            width: 212.w,
                            child: defaultButton(
                              function: () {
                                if(checkData()){
                                  cubit.login(
                                      phone: _phoneController.text,
                                      password: _passwordController.text);
                                }else{
                                  Fluttertoast.showToast(
                                      msg: 'جميع البيانات مطلوبة',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 2,
                                      backgroundColor: Colors.redAccent,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }

                              },
                              title: 'login_btn'.tr(),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, registerRoute, (route) => false);
                            },
                            child: Text(
                              'تسجيل جديد',
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
  bool checkData(){
    return _phoneController.text.isNotEmpty && _passwordController.text.isNotEmpty;
  }
}
