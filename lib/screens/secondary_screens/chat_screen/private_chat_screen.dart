import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/chat_model.dart';
import 'package:taif/screens/secondary_screens/chat_screen/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/chat_screen/cubit/state.dart';

class PrivateChatScreen extends StatefulWidget {
  final Chats chats;
  final int index;

  PrivateChatScreen(this.chats, this.index);

  @override
  State<PrivateChatScreen> createState() => _PrivateChatScreenState();
}

class _PrivateChatScreenState extends State<PrivateChatScreen> {
  late TextEditingController _contentController;
  ScrollController _scrollController =  ScrollController();


  @override
  void initState() {

    super.initState();
    _contentController = TextEditingController();
  }

  @override
  void dispose() {

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
        create: (context) => ChatCubit()..getAllChats(),
        child: SingleChildScrollView(
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
                        '${widget.chats.anotherUser!.name}',
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
                        '${widget.chats.lastMessage == null ? '' : widget.chats.lastMessage!.createdAt}',
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
                        'بخصوص ${widget.chats.subject!.title}',
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
                      BlocConsumer<ChatCubit, ChatState>(
                        listener: (context, state) {
                          if (state is ChatSuccessState) {
                            Future.delayed(Duration(
                              seconds: 1
                            ));
                           }

                        },
                        builder: (context, state) {
                          var cubit = ChatCubit.get(context).chatModel;

                          if (state is ChatSuccessState) {


                            return SizedBox(
                              height: 490.h,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  controller: _scrollController,
                                  physics: BouncingScrollPhysics(),
                                  itemCount:
                                      cubit.chats![widget.index].messages!.length,
                                  itemBuilder: (context, index) {
                                    return chatMessageItem(
                                        cubit.chats![widget.index], index);
                                  }),
                            );

                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
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
                height: 85,
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
                                  _contentController.text = '';
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
                                              chatId: widget.chats.id!);
                                          _contentController.text='';
                                          FocusScope.of(context).unfocus();

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
