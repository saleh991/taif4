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

import '../../addedd_succefully_screen.dart';



class AddTouristShowScreen extends StatefulWidget {


  @override
  _AddTouristShowScreenState createState() => _AddTouristShowScreenState();
}

class _AddTouristShowScreenState extends State<AddTouristShowScreen> {

  late TextEditingController _titleController;
  late TextEditingController _messageController;
  late TextEditingController _harajCategoryController;

  VideoPlayerController? _videoPlayerController;
  File? profileImage;
  File? video;

  late List<File> otherImage;
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



  Future<void> selectImages() async {
    var pickerFile = await picker.pickMultiImage(

    );
    if (pickerFile != null) {
      for(var im in pickerFile)
      {
        File file = File(im.path);
        otherImage.add(file);
      }
      print(' Image Selected');
      print(otherImage);
      print(' Image Selected');


    } else {
      print('No Image Selected');

    }
  }


  Future<void> getVideo() async {
    final pickerFile = await picker.pickVideo(
      source: ImageSource.gallery,

    );
    if (pickerFile != null) {
      video = File(pickerFile.path);
      _videoPlayerController=VideoPlayerController.file(video!)..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {

        });
      });

    } else {
      print('No video Selected');

    }
  }

  @override
  void initState() {

    otherImage=[];

    _titleController = TextEditingController();

    _messageController = TextEditingController();
    _harajCategoryController = TextEditingController();


    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();

    _messageController.dispose();
    _harajCategoryController.dispose();
    if(_videoPlayerController!=null)
    _videoPlayerController!.dispose();
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
          '?????????? ?????? ??????????',
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
                    SizedBox(
                      height: 10.h,
                    ),
                    if(otherImage.isEmpty)
                      addFromGalleryItems(
                          title: '???????? ?????? ????????????',
                          icon: Icons.photo_library_sharp,
                          function: () async {
                            await  selectImages();
                            setState(() {

                            });
                          })else
                      Column(
                        children: [
                          SizedBox(
                            height: 150.h,
                            child: ListView.builder(
                              itemCount: otherImage.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return  Padding(
                                  padding:  EdgeInsets.only(
                                      left: 8.w
                                  ),
                                  child: Container(
                                    height: 130.h,
                                    width: 130.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: FileImage(otherImage[index],
                                            ),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                  ),
                                );
                              },),
                          ),
                          SizedBox(
                            width: 150.w,
                            child: languagesButtonWithIcon(
                              title:  "???????? ?????????? ",
                              icon: Icon(
                                Icons.camera,
                              ),
                              function: () async {
                                await selectImages();
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
                    if(video==null)
                      addFromGalleryItems(
                          title: '???????? ??????????',
                          icon: Icons.video_call_outlined,
                          function: () async{
                            await  getVideo();
                            print("video");
                            print(video);
                            print("video");
                            setState(() {

                            });
                          })else
                      Column(
                        children: [
                          Container(
                            height: 300.h,
                            width: ScreenUtil().screenWidth*0.9,
                            child: _videoPlayerController!.value.isInitialized
                                ? InkWell(
                              onTap: (){
                                _videoPlayerController!.value.isPlaying
                                    ? _videoPlayerController!.pause()
                                    : _videoPlayerController!.play();
                              },
                              child: AspectRatio(
                                aspectRatio: _videoPlayerController!.value.aspectRatio,
                                child: VideoPlayer(_videoPlayerController!),
                              ),
                            )
                                : Container(),
                          ),
                          SizedBox(
                            width: 150.w,
                            child: languagesButtonWithIcon(
                              title:  "???????? ?????????????? ",
                              icon: Icon(
                                Icons.video_call_outlined,
                              ),
                              function: () async {
                                print(video);
                                await getVideo();
                                print(video);
                                setState(() {

                                });
                              },
                              color: Color(0xff25afff),
                            ),
                          )
                        ],
                      ),

                    SizedBox(
                      height: 20.h,
                    ),



                    SizedBox(
                      height: 12.h,
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        '??????????????',
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
                        '????????????????',
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
                        width: 354.w,
                        height: 51.h,
                        child: languagesButton(
                          title: '?????????? ????????',
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

                            else   if(_titleController.text.length==0||_titleController.text.trim()=='')
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.INFO,
                                animType: AnimType.BOTTOMSLIDE,
                                title: '?????? ???? ??????????????????',
                                desc: '?????? ?????????? ??????????',
                                btnOkText: '????',

                                btnOkOnPress: () {},
                              )..show();
                            else   if(_messageController.text.length==0||_messageController.text.trim()=='')
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.INFO,
                                animType: AnimType.BOTTOMSLIDE,
                                title: '?????? ???? ??????????????????',
                                desc: '?????? ?????????? ????????????',
                                btnOkText: '????',

                                btnOkOnPress: () {},
                              )..show();
                            else
                              { print('111111111');
                                List<File> videos=[];
                                if(video!=null)
                                videos.add(video!);
                                cu.addTouristShow(
                                    guide_id: userCubit.data!.id!.toString(),
                                    title: _titleController.text,
                                    image: profileImage,
                                    images: otherImage,
                                    videos: videos,
                                    content: _messageController.text);
                              }
                          },
                          color: Color(0xFF007C9D),
                        )),
                    SizedBox(
                      height: 35.h,
                    )
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
