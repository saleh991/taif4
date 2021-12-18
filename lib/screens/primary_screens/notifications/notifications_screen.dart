import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/all_notification_bloc.dart';
import 'package:taif/backEndPe/repository/notification_reposotory.dart';
import 'package:taif/components/components.dart';
// import 'package:taif/cubit/cubit.dart';
// import 'package:taif/cubit/state.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/screens/primary_screens/notifications/notifications_component.dart';

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
      body: no2(),
    );
  }




  Widget no2(){
    return BlocProvider(
      create:(context)=> AllNotificationBloc(NotoficationReposotoryImpl())..add(getAllNotificationData()),
      child: BlocConsumer<AllNotificationBloc, AllNotificationState>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = MainCubit.get(context);
          if(state is AllNotificationStateLoaded){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {

                    return NotificationsCompo(index: state.dataNotificationModel.data!.length-index-1,
                        notificationModel: state.dataNotificationModel,
                    blocContext: context,);

                      // notificationsItem(
                      //   index: cubit.notificationModel.data!.length-index-1, notificationModel: cubit.notificationModel);

                  },
                  itemCount:state.dataNotificationModel.data!.length),
            );
          }else{
            return Center(
              child:CircularProgressIndicator(),
            );
          }

        },
      ),
    );
  }
}
