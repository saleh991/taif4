import 'dart:io';
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
          'طلب انضمام مرشد سياحي',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [InkWell(onTap:(){
          Navigator.pushNamed(context, notificationsRoute);
        },child: Image.asset('images/notification_icon.png'))],      ),
      body:BlocProvider(
        create:
            (context) => cu,
        child: BlocConsumer<LocationsCubit,LocationsState>(
          listener: (context, state) {


            if (state is AddGuideErrorState) {
              Fluttertoast.showToast(
                  msg: 'حدث خطأ ما',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }

            else if (state is AddGuideLoadingState) {
              Fluttertoast.showToast(
                  msg: 'جاري المعالجة..',
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
                        hint: 'الاسم',
                        controller: _nameController,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      contactTextFieldWithHintColor(
                        hint: 'البريد الالكتروني',
                        controller: _emailController,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      contactTextFieldWithHintColor(
                        hint: 'رقم الجوال',
                        controller: _phoneController,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      contactTextFieldWithHintColor(
                        hint: 'سنوات الخبرة',
                        controller: _expController,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      contactTextFieldWithHintColor(
                        hint: 'الرقم السري',
                        controller: _passwordController,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      if(profileImage==null)
                      addFromGalleryItems(
                          title: 'صورة شخصية', icon: Icons.camera_alt, function: () async {
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
                                title:  "تغير الصورة ",
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
                        hint: 'نبذة عنك في الارشاد السياحي',
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
                            title: 'ارسال الطلب',
                            function: () {
                              if(profileImage==null)
                                {
                                  Fluttertoast.showToast(
                                      msg: 'يرجى ملأ البيانات بشكل كامل ووضع صورة شخصية',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
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
