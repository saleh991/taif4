import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taif/components/components.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:taif/screens/auth_screen/edit_profile/cubit/cubit.dart';
import 'package:taif/screens/auth_screen/edit_profile/cubit/state.dart';
import 'package:taif/models/user_data_model.dart';

class EditFirstProfileScreen extends StatefulWidget {
  final UserDataModel userDataModel;

  EditFirstProfileScreen(this.userDataModel);

  @override
  _EditFirstProfileScreenState createState() => _EditFirstProfileScreenState();
}

class _EditFirstProfileScreenState extends State<EditFirstProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'edit_profile'.tr(),
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [Image.asset('images/notification_icon.png')],
      ),
      drawer: Drawer(),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is EditProfileLoadingState) {
            print('loading');
          }
          if (state is EditProfileSuccessState) {
print('here');
              Fluttertoast.showToast(
                  msg: 'تم تعديل البيانات بنجاح',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.greenAccent,
                  textColor: Colors.white,
                  fontSize: 16.0);

              Navigator.pushNamedAndRemoveUntil(
                  context, bottomNavRoute, (route) => false);

          }
        },
        builder: (context, state) {
          var cubit = ProfileCubit.get(context);

          _nameController.text = '';
          _emailController.text = '';
          _phoneNumberController.text = widget.userDataModel.data!.phone ?? '';
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.5),
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (state is EditProfileLoadingState)
                    LinearProgressIndicator(),
                  SizedBox(
                    height: 46.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: Image.asset(
                        'images/profile.png',
                        height: 130.h,
                        width: 130.h,
                      ),
                    ),
                  ),
                  Container(
                    height: 55.h,
                    width: 318.w,
                    margin: EdgeInsets.only(top: 12, bottom: 43),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: const Color(0x5ebed8fb),
                    ),
                    child: Center(
                      child: Text(
                        '',
                        style: TextStyle(
                          // fontFamily: fontName,
                          fontSize: 24,
                          color: const Color(0xff003e4f),
                          letterSpacing: -0.48,
                          height: 2,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  defaultTextField(
                      hint: 'name_hint'.tr(),
                      controller: _nameController,
                      hasSuffix: true,
                      suffixIcon: Icon(
                        Icons.edit,
                        color: Color(0xFF007C9D),
                      )),
                  SizedBox(
                    height: 18.h,
                  ),
                  defaultTextField(
                    hint: 'email_hint'.tr(),
                    controller: _emailController,
                    hasSuffix: true,
                    suffixIcon: Icon(
                      Icons.edit,
                      color: Color(0xFF007C9D),
                    ),
                  ),


                    SizedBox(
                      height: 18.h,
                    ),

                    defaultTextField(
                      function: () {
                        cubit.changeVisibility();
                      },
                      hint: 'كلمة المرور الجديدة',
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
                  SizedBox(
                    height: 18.h,
                  ),
                  defaultTextField(
                      hint: 'phone_hint'.tr(),
                      controller: _phoneNumberController,
                      readOnly: true),
                  Container(
                    margin: EdgeInsets.only(top: 25.h, bottom: 50.h),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    alignment: Alignment.center,
                    width: 301.w,
                    height: 45.h,
                    child: Text(
                      'note_edit_prpfile'.tr(),
                      style: TextStyle(
                        fontFamily: 'JF Flat',
                        fontSize: 15.sp,
                        color: const Color(0xfffefefe),
                        letterSpacing: -0.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.5),
                      color: Color.fromRGBO(252, 97, 100, 1),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => ProfileCubit(),
                    child: BlocConsumer<ProfileCubit, ProfileState>(
                      listener: (context, state) {
                        if (state is EditProfileLoadingState) {
                          print('loading');
                        }
                        if (state is EditProfileSuccessState) {
                          print('here');
                          Fluttertoast.showToast(
                              msg: 'تم تعديل البيانات بنجاح',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.greenAccent,
                              textColor: Colors.white,
                              fontSize: 16.0);

                          Navigator.pushNamedAndRemoveUntil(
                              context, bottomNavRoute, (route) => false);

                        }
                      },
                      builder: (context, state) {
                        var cubit = ProfileCubit.get(context);
                        return SizedBox(
                          height: 51.h,
                          width: 354.w,
                          child: languagesButton(
                            color: Color.fromRGBO(31, 135, 22, 1),
                            function: () {
                              if(checkData()){
                                cubit.updateUserDataWithPassword(
                                  name: _nameController.text,
                                  password: _passwordController.text,
                                  email: _emailController.text,
                                );
                              }else{

                              Fluttertoast.showToast(
                              msg: 'الرجاء ادخال جميع الحقول',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.redAccent,
                              textColor: Colors.white,
                              fontSize: 16.0);

                              }

                            },
                            title: 'save_edit'.tr(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool checkData() {
    return _nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }
}
