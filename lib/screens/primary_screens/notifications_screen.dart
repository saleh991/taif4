import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/components/components.dart';
import 'package:taif/cubit/cubit.dart';
import 'package:taif/cubit/state.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'الإشعارات',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [Image.asset('images/notification_icon.png')],
      ),
      body: BlocProvider(
        create:(context)=> MainCubit()..getNotifications(),
        child: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = MainCubit.get(context);
            if(state is NotificationsSuccessState){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {

                      return notificationsItem(
                          index: cubit.notificationModel.data!.length-index-1, notificationModel: cubit.notificationModel);

                    },
                    itemCount:cubit.notificationModel.data!.length),
              );
            }else{
              return Center(
                child:CircularProgressIndicator(),
              );
            }

          },
        ),
      ),
    );
  }
}
