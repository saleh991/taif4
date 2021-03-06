import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/states.dart';
import '../addedd_succefully_screen.dart';

class AddGuideScreen extends StatefulWidget {
  const AddGuideScreen({Key? key}) : super(key: key);

  @override
  _AddGuideScreenState createState() => _AddGuideScreenState();
}

class _AddGuideScreenState extends State<AddGuideScreen> {
  File? profileImage;
  var picker = ImagePicker();

  Future<void> getImage() async {
    final pickerFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickerFile != null) {
      profileImage = File(pickerFile.path);

    } else {
      print('No Image Selected');

    }
  }

  LocationsCubit cu=LocationsCubit();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _expController;
  late TextEditingController _passwordController;
  late TextEditingController _detailsController;

  @override
  void initState() {


    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _expController = TextEditingController();
    _passwordController = TextEditingController();
    _detailsController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _detailsController.dispose();
    _expController.dispose();
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
          '?????? ???????????? ???????? ??????????',
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
      body:BlocProvider(
        create:
            (context) => cu,
        child: BlocConsumer<LocationsCubit,LocationsState>(
          listener: (context, state) {


            if (state is AddGuideErrorState) {
              Fluttertoast.showToast(
                  msg: '?????? ?????? ????',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }

            else if (state is AddGuideLoadingState) {
              Fluttertoast.showToast(
                  msg: '???????? ????????????????..',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 16.0);

            }

            else if (state is AddGuideSuccessState) {

              if(state.addGuideModel.status!)
                {
                  Navigator.pushReplacement(
                   context,
                   MaterialPageRoute(builder: (context) => AddedSuccefullyScreen()),
                 );
                }
              else{
                Fluttertoast.showToast(
                    msg: state.addGuideModel.errors_string.toString(),
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            }
          },
          builder: (context, state) {
              return  SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.w),
                  child: Column(
                    children: [
                      contactTextFieldWithHintColor(
                        hint: '??????????',
                        controller: _nameController,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      contactTextFieldWithHintColor(
                        hint: '???????????? ????????????????????',
                        controller: _emailController,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      contactTextFieldWithHintColor(
                        hint: '?????? ????????????',
                        controller: _phoneController,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      contactTextFieldWithHintColor(
                        hint: '?????????? ????????????',
                        controller: _expController,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      contactTextFieldWithHintColor(
                        hint: '?????????? ??????????',
                        controller: _passwordController,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      if(profileImage==null)
                      addFromGalleryItems(
                          title: '???????? ??????????', icon: Icons.camera_alt, function: () async {
                            print(profileImage);
                            await getImage();
                            print(profileImage);
                            setState(() {

                            });
                      })
                      else
                        Column(
                          children: [
                            Container(
                              height: 130.h,
                              width: 130.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: FileImage(profileImage!,
                                  ),
                                    fit: BoxFit.fill
                                )
                              ),
                            ),
                            SizedBox(
                              width: 150.w,
                              child: languagesButtonWithIcon(
                                title:  "???????? ???????????? ",
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                ),
                                function: () async {
                                  print(profileImage);
                                  await getImage();
                                  print(profileImage);
                                  setState(() {

                                  });
                                },
                                color: Color(0xff25afff),
                              ),
                            )
                          ],
                        ),
                      SizedBox(
                        height: 10.h,
                      ),

                      contactTextField(
                        hint: '???????? ?????? ???? ?????????????? ??????????????',
                        controller: _detailsController,
                        line: 10,
                      ),
                      SizedBox(
                        height: 50.h,
                      ),

                      SizedBox(
                          width: 354.w,
                          height: 51.h,
                          child: languagesButton(
                            title: '?????????? ??????????',
                            function: () {
                              if(profileImage==null)
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.INFO,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: '?????? ???? ??????????????????',
                                  desc: '?????? ?????????? ???????? ??????????',
                                  btnOkText: '????',

                                  btnOkOnPress: () {},
                                )..show();
                            else  if(_nameController.text.length==0||_nameController.text.trim()=='')
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.INFO,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: '?????? ???? ??????????????????',
                                  desc: '???????? ?????????? ??????????',
                                  btnOkText: '????',

                                  btnOkOnPress: () {},
                                )..show();
                              else  if(_emailController.text.length==0||_emailController.text.trim()=='')
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.INFO,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: '?????? ???? ??????????????????',
                                  desc: '???????? ?????????? ??????????????',
                                  btnOkText: '????',

                                  btnOkOnPress: () {},
                                )..show();
                              else  if(_phoneController.text.length==0||_phoneController.text.trim()=='')
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.INFO,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: '?????? ???? ??????????????????',
                                  desc: '???????? ?????????? ?????? ????????????',
                                  btnOkText: '????',

                                  btnOkOnPress: () {},
                                )..show();
                              else  if(_passwordController.text.length==0||_passwordController.text.trim()=='')
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.INFO,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: '?????? ???? ??????????????????',
                                  desc: '???????? ?????????? ???????? ????',
                                  btnOkText: '????',

                                  btnOkOnPress: () {},
                                )..show();
                              else  if(_expController.text.length==0||_expController.text.trim()=='')
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.INFO,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: '?????? ???? ??????????????????',
                                  desc: '???????? ?????????? ???????? ????????????',
                                  btnOkText: '????',

                                  btnOkOnPress: () {},
                                )..show();
                              else  if(_detailsController.text.length==0||_detailsController.text.trim()=='')
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.INFO,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: '?????? ???? ??????????????????',
                                  desc: '???????? ?????????? ???????? ?????? ???? ?????????????? ??????????????',
                                  btnOkText: '????',

                                  btnOkOnPress: () {},
                                )..show();

                              else{
                                cu..addGuid(
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    image: profileImage!,
                                    phone: _phoneController.text,
                                    password: _passwordController.text,
                                    experience_years: _expController.text,
                                    notes: _detailsController.text);
                              }


                            },
                            color: Color.fromRGBO(31, 135, 22, 1),
                          )),
                      SizedBox(
                        height: 50.h,
                      ),
                    ],
                  ),
                ),
              );

          },
        ),
      ),

    );
  }
}
