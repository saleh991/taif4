import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taif/components/components.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:taif/screens/auth_screen/edit_profile/cubit/cubit.dart';
import 'package:taif/screens/auth_screen/edit_profile/cubit/state.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _passwordController;
   File? imageFile;

  var picker = ImagePicker();
  Future<void> getImage() async {
    final pickerFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickerFile != null) {
      imageFile = File(pickerFile.path);

    } else {
      print('No Image Selected');

    }
  }


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
        ),)],
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is EditProfileLoadingState) {
            print('loading');
          }
          if (state is EditProfileSuccessState) {
            Fluttertoast.showToast(
                msg: 'تم تعديل البيانات بنجاح',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.greenAccent,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.pushNamedAndRemoveUntil(context, bottomNavRoute, (route) => false);

          }

        },
        builder: (context, state) {
          print('user id edit ${AppController.instance.getId()}');

          var cubit = ProfileCubit.get(context);
          if (state is ProfileLoadingState || state is ProfileErrorState) {
            return Center(child: CircularProgressIndicator());
          } else {
            _nameController.text = cubit.userDataModel.data!.name ?? '';
            _emailController.text = cubit.userDataModel.data!.email ?? '';
            _phoneNumberController.text =
                cubit.userDataModel.data!.phone ?? '';
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
                    // ignore: unnecessary_null_comparison
                    if(imageFile==null)
                    Align(
                      alignment: Alignment.center,
                      child:cubit.userDataModel.data!.image ==null?
                      Stack(
                        clipBehavior: Clip.none,
                        children: [

                          Container(
                            height: 130.h,
                            width: 130.h,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  'images/profile.png',


                                ),

                              ),

                            ),

                          ),
                          Positioned(
                            right: -22.w,
                            top: 40.h,
                            child: GestureDetector(
                              onTap: () async {
                                await getImage();
                                setState(() {

                                });

                              },
                              child: CircleAvatar(
                                radius: 26.h,
                                backgroundColor: Color(0xFFffffff),
                                child:
                                Icon(
                                  Icons.edit,
                                  color: Color(0xFF007C9D),
                                ),
                              ),
                            ),
                          )
                        ],
                      ):

                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 130.h,
                            width: 130.h,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                image: NetworkImage('https://taif-app.com/storage/app/${cubit.userDataModel.data!.image!}'),
                              ),

                            ),

                          ),
                          Positioned(
                            right: -22.w,
                            top: 40.h,
                            child: GestureDetector(
                              onTap: () async {
                                await getImage();
                                setState(() {

                                });

                              },
                              child: CircleAvatar(
                                radius: 22.h,
                                backgroundColor: Color(0xFFffffff),
                                child:
                                Icon(
                                  Icons.edit,
                                  color: Color(0xFF007C9D),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )else
                      Align(
                        alignment: Alignment.center,

                       child:   Stack(
                         clipBehavior: Clip.none,
                         children: [
                           Container(
                             height: 130.h,
                             width: 130.h,
                             decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               image: DecorationImage(
                                 image: FileImage(imageFile!),
                                 fit: BoxFit.fill
                               ),

                             ),

                           ),
                           Positioned(
                             right: -22.w,
                             top: 40.h,
                             child: GestureDetector(
                               onTap: () async {
                                 await getImage();
                                 setState(() {

                                 });

                               },
                               child: CircleAvatar(
                                 radius: 22.h,
                                 backgroundColor: Color(0xFFffffff),
                                 child:
                                 Icon(
                                   Icons.edit,
                                   color: Color(0xFF007C9D),
                                 ),
                               ),
                             ),
                           )
                         ],
                       ),

                      ),
                    SizedBox(
                      height: 26.h,
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
                          cubit.userDataModel.data!.name ?? '',
                          style: TextStyle(
                            // fontFamily: fontName,
                            fontSize: 24,
                            color: const Color(0xff003e4f),
                            letterSpacing: -0.48,
                            height: 2,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
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
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: languagesButton(
                          title: 'تغير كلمة المرور',
                          function: () {
                            cubit.changedPassword();
                            print('${cubit.changePassword}');
                          },
                          color: Color.fromRGBO(31, 135, 22, 1)),
                    ),
                    if (cubit.changePassword)
                      SizedBox(
                        height: 18.h,
                      ),
                    if (cubit.changePassword)
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
                    SizedBox(
                      height: 51.h,
                      width: 354.w,
                      child: languagesButton(
                        color: Color.fromRGBO(31, 135, 22, 1),
                        function: () {
                          if (cubit.changePassword) {
                            cubit.updateUserDataWithPassword(
                              name: _nameController.text,
                              password: _passwordController.text,
                              email: _emailController.text,
                              image: imageFile
                            );
                          } else {
                            cubit.updateUserDataWithoutPassword(
                              name: _nameController.text,
                              email: _emailController.text,
                                image: imageFile
                            );
                          }
                        },
                        title: 'save_edit'.tr(),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
