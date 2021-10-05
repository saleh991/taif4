import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/components/components.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/chat_model.dart';
import 'package:taif/screens/secondary_screens/chat_screen/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/chat_screen/cubit/state.dart';

class PrivateChatSubjectScreen extends StatefulWidget {
  int subjectId;
  String model;


  PrivateChatSubjectScreen({required this.subjectId,required this.model});

  @override
  State<PrivateChatSubjectScreen> createState() => _PrivateChatSubjectScreenState();
}

class _PrivateChatSubjectScreenState extends State<PrivateChatSubjectScreen> {
  late TextEditingController _contentController;
  ScrollController _scrollController =  ScrollController();

  Timer? _timer;
  int _start = 7;
  var cubit;
  ChatCubit cu= ChatCubit();
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer =  Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          print('re');
          print('re');  print('re');


          _start=5;
          cu..createChat(subjectId: widget.subjectId,
          model: widget.model
          );
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 700),
          );



        } else {

          _start--;

        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
    _contentController = TextEditingController();
  }



  @override
  void dispose() {
    _timer!.cancel();

    super.dispose();
    _contentController.dispose();
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
          'محادثة خاصة',
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
        create: (context) =>    cu..createChat(subjectId: widget.subjectId,
            model: widget.model
        ),
        child:   BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {




          },
          builder: (context, state) {
            cubit = ChatCubit.get(context).chatModel;

            if (state is ChatSuccessState) {


              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 14.h,
                    ),
                    Container(
                      height: 70.h,
                      width: 394.w,
                      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x63d5ddeb),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          'images/chat.png',
                          height: 53.h,
                          width: 53.w,
                        ),
                        title: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${cubit.currentChat!.anotherUser!.name}',
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 18.sp,
                                color: const Color(0xff003e4f),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${cubit.currentChat!.lastMessage == null ? '' :
                              cubit.currentChat!.lastMessage!.createdAt}',
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 15,
                                color: const Color(0xfffd6164),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      height: 567.h,
                      width: 394.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x63d5ddeb),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              'بخصوص ${cubit.currentChat!.subject!.title}',
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 18.sp,
                                color: const Color(0xff003e4f),
                              ),
                              textAlign: TextAlign.right,
                            ),
                            Text(
                              'https://www.const-tech.com.sa/',
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 18,
                                color: const Color(0xff06a1cb),
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            SizedBox(
                              height: 490.h,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  controller: _scrollController,
                                  physics: BouncingScrollPhysics(),
                                  itemCount:
                                  cubit.currentChat!.messages!.length,
                                  itemBuilder: (context, index) {
                                    return chatMessageItem(
                                        cubit.currentChat!, index);
                                  }),
                            ),

                          ],
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x63d5ddeb),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),

                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.black),
                              controller: _contentController,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.grey),
                                  hintText: 'أرسل الرسالة',
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  prefixIcon: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 15),
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xFF007C9D),
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: BlocConsumer<ChatCubit, ChatState>(
                                    listener: (context, state) {
                                      if (state is ChatSuccessState) {

                                      }
                                    },
                                    builder: (context, state) {
                                      return Container(
                                          margin: EdgeInsets.only(right: 10),
                                          width: 42.0,
                                          height: 42.0,
                                          child: new RawMaterialButton(
                                            fillColor: Color(0xFF007C9D),
                                            shape: new CircleBorder(),
                                            elevation: 0.0,
                                            child: Icon(
                                              Icons.send_rounded,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              if (checkData()) {
                                                ChatCubit.get(context).sendMessage(
                                                  content: _contentController.text,
                                                  chatId: cubit.currentChat!.id!,


                                                );
                                                cubit.currentChat!.messages!.add(Messages(
                                                    content: _contentController.text,
                                                    userId: AppController.instance.getId(),
                                                    toUserId: cubit.currentChat!.anotherUser!.id,
                                                    createdAt: DateTime.now().toString()

                                                ));
                                                _contentController.text='';
                                                _scrollController.animateTo(
                                                  _scrollController.position.maxScrollExtent,
                                                  curve: Curves.easeOut,
                                                  duration: const Duration(milliseconds: 700),
                                                );

                                                FocusScopeNode currentFocus = FocusScope.of(context);

                                                if (!currentFocus.hasPrimaryFocus) {
                                                  currentFocus.unfocus();
                                                }
                                                setState(() {

                                                });


                                              }
                                            },
                                          ));
                                    },
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );

            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),

      ),
      floatingActionButton:  Padding(
        padding:  EdgeInsets.symmetric(vertical: 70.h),
        child: FloatingActionButton(
            child: new Icon(Icons.keyboard_arrow_down_outlined),
            onPressed: () {

              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 700),
              );
            }
        ),
      ),
    );
  }

  bool checkData() {
    return _contentController.text.isNotEmpty;
  }
}
