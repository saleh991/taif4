import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/components/components.dart';
import 'package:taif/cubit/cubit.dart';
import 'package:taif/cubit/state.dart';
import 'package:taif/helper/constants.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F6FC),
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,

        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'المفضلة',
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
        create: (context)=>MainCubit()..getFavorites(),
        child: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = MainCubit.get(context).favoriteModel;
           if(state is FavoriteSuccessState){
               return Padding(
                 padding: EdgeInsets.symmetric(horizontal: 22.w),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(
                       height: 26.h,
                     ),
                     Expanded(
                       child: favoriteItem(
                         function: () {},
                         favoriteModel: cubit,
                       ),
                     ),
                   ],
                 ),
               );
           }else{
             return Center(
               child: CircularProgressIndicator(),
             );
           }

          },
        ),
      ),
    );
  }
}
