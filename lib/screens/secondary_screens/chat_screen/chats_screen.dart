import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/screens/secondary_screens/chat_screen/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/chat_screen/cubit/state.dart';
import 'package:taif/screens/secondary_screens/chat_screen/private_chat_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

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
          create: (context) => ChatCubit()..getAllChats(),
          child: BlocConsumer<ChatCubit, ChatState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = ChatCubit.get(context).chatModel;
              if(state is ChatSuccessState){
                return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: cubit.chats!.length,
                    itemBuilder: (context, index) {
                      print('${cubit.chats!.length}');
                      return chatItem(
                        index: index,
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PrivateChatScreen(cubit.chats![index],index),
                            ),
                          );
                        },
                        chatModel: cubit,
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
