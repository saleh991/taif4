
import 'package:easy_localization/easy_localization.dart' as easy_localization;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/all_notification_bloc.dart';
import 'package:taif/models/notification_model.dart';


class NotificationsCompo extends StatefulWidget {

  final int index; final NotificationModel notificationModel;
  final BuildContext blocContext;


  const NotificationsCompo({Key? key,required this.index,required this.notificationModel,required this.blocContext}) : super(key: key);

  @override
  _NotificationsCompoState createState() => _NotificationsCompoState();
}

class _NotificationsCompoState extends State<NotificationsCompo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        leading: CircleAvatar(
          backgroundColor: widget.notificationModel.data![widget.index].seen == 1
              ? Color.fromRGBO(253, 97, 100, 1)
              : Color.fromRGBO(114, 194, 9, 1),
          radius: 13,
          child: Center(
            child: Icon(
              Icons.arrow_back_ios,
              size: 16.h,
              textDirection: TextDirection.ltr,
              color: Colors.white,
            ),
          ),
        ),


        // * remove
        trailing:InkWell(
          onTap: (){
            if(widget.notificationModel.data![widget.index].id!=null){
              BlocProvider.of<AllNotificationBloc>(widget.blocContext, listen: false).add(
                  deleteItemInNotofication(id: widget.notificationModel.data![widget.index].id!));
            }

          },
          child: SvgPicture.asset("images/delete.svg",height: 20,width: 15,),
        ),

        title: Text(
          widget.notificationModel.data![widget.index].content.toString(),
          style: TextStyle(
            fontFamily: 'JF Flat',
            fontSize: 19.sp,
            color: const Color(0xff007c9d),
          ),
          textAlign: TextAlign.right,
        ),
        subtitle: Text(
          easy_localization.DateFormat('yyyy-MM-dd','en').format(DateTime.parse(
              widget.notificationModel.data![widget.index].createdAt.toString())),

          style: TextStyle(
            fontFamily: 'JF Flat',
            fontSize: 15.sp,
            color: const Color(0xff007c9d),
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
