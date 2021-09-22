import 'dart:async';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/haraj_category.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/states.dart';
import 'package:video_player/video_player.dart';

import '../addedd_succefully_screen.dart';

// ignore: camel_case_types
class addOffersScreen extends StatefulWidget {



  @override
  _addOffersScreenState createState() => _addOffersScreenState();
}

class _addOffersScreenState extends State<addOffersScreen> {

  late TextEditingController _titleController;
  late TextEditingController _messageController;



  File? profileImage;



  var picker = ImagePicker();

  LocationsCubit cu=LocationsCubit();

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




  @override
  void initState() {

    _titleController = TextEditingController();

    _messageController = TextEditingController();



    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _messageController.dispose();

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
          'إضافة عرض تجاري',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [InkWell(onTap:(){
          Navigator.pushNamed(context, notificationsRoute);
        },child: Image.asset('images/notification_icon.png'))],      ),
      body: BlocProvider(
        create:
            (context) => cu..getUserData(),
        child: BlocConsumer<LocationsCubit,LocationsState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            var userCubit = LocationsCubit.get(context).userDataModel;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
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

                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'العنوان',
                        style: TextStyle(
                          fontFamily: 'JF Flat',
                          fontSize: 15.sp,
                          color: const Color(0xff003e4f),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    contactTextField(
                      hint: '',
                      controller: _titleController,

                    ),


                    SizedBox(
                      height: 12.h,
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'تفاصيل',
                        style: TextStyle(
                          fontFamily: 'JF Flat',
                          fontSize: 15.sp,
                          color: const Color(0xff003e4f),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    contactTextField(
                      hint: '',
                      controller: _messageController,

                    ),







                    SizedBox(
                      height: 25.h,
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    SizedBox(
                        width: 354.w,
                        height: 51.h,
                        child: languagesButton(
                          title: 'إضافة ونشر',
                          function: () {
                            if(profileImage==null)
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.INFO,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'نقص في المعلومات',
                                desc: 'يجب اضافة صورة شخصية',
                                btnOkText: 'تم',

                                btnOkOnPress: () {},
                              )..show();

                            else   if(_titleController.text.length==0||_titleController.text.trim()=='')
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.INFO,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'نقص في المعلومات',
                                desc: 'يجب اضافة عنوان',
                                btnOkText: 'تم',

                                btnOkOnPress: () {},
                              )..show();
                            else   if(_messageController.text.length==0||_messageController.text.trim()=='')
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.INFO,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'نقص في المعلومات',
                                desc: 'يجب اضافة تفاصيل',
                                btnOkText: 'تم',

                                btnOkOnPress: () {},
                              )..show();
                            else
                            { print('111111111');


                            cu.addOffer(
                                user_id: userCubit.data!.id!.toString(),
                                title: _titleController.text,
                                image: profileImage,
                                message: _messageController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddedSuccefullyScreen()),
                            );
                            }





                          },
                          color: Color(0xFF007C9D),
                        )),
                    SizedBox(
                      height: 35.h,
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