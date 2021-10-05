import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/screens/secondary_screens/chat_screen/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/chat_screen/cubit/state.dart';
import 'package:taif/screens/secondary_screens/chat_screen/private_chat_screen_subject.dart';

class ChatScreenSubject extends StatelessWidget {
  int subjectId;
  String model;
   ChatScreenSubject({Key? key,required this.subjectId,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'المحادثات',
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
      body: Padding(
        padding: const EdgeInsets.only(top: 14.0),
        child: BlocProvider(
          create: (context) => ChatCubit()..createChat(
              subjectId: subjectId,
            model: model
          ),
          child: BlocConsumer<ChatCubit, ChatState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = ChatCubit.get(context).chatModel;
              if(state is ChatSuccessState){
                return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      print('${cubit.chats!.length}');
                      return  InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PrivateChatSubjectScreen(cubit.currentChat!),
                            ),
                          );
                        },
                        child: Container(
                          height: 56.h,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'images/chat.png',
                                    height: 35.h,
                                    width: 35.w,
                                  ),
                                  SizedBox(
                                    width: 32.w,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                        height: 5.h,
                                      ),
                                      Expanded(
                                        child: Text(
                                          (cubit.currentChat!.lastMessage !=null?
                                          cubit.currentChat!.lastMessage!.content:
                                          cubit.currentChat!.subject!.title)!,
                                          style: TextStyle(
                                            fontFamily: 'JF Flat',
                                            fontSize: 14.sp,
                                            color: const Color(0xff7a90b7),
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Image.asset('images/check.png')
                            ],
                          ),
                        ),
                      );

                    });
              }else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

            },
          ),
        ),
      ),
    );
  }
}
