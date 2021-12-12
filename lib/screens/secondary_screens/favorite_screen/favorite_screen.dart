import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/all_my_favorite_bloc.dart';
import 'package:taif/backEndPe/repository/my_my_favorit.dart';
import 'package:taif/components/components.dart';
import 'package:taif/cubit/cubit.dart';
import 'package:taif/cubit/state.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/secondary_screens/favorite_screen/item_my_favorite.dart';



class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

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
      body: no2(),
    );
  }

  Widget no1(){
    return BlocProvider(
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
                    child:

                    ItemMyFavorite(
                      function: () {},
                      favoriteModel: cubit,
                    ),

                    // favoriteItem(
                    //   function: () {},
                    //   favoriteModel: cubit,
                    // ),
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
    );
  }

  Widget no2(){
    return BlocProvider(
      create: (context)=>AllMyFavoriteBloc(MyFavoriteReposotoryImpl())..add(getAllMyFavoriteData()),
      child: BlocConsumer<AllMyFavoriteBloc, AllMyFavoriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = MainCubit.get(context).favoriteModel;
          if(state is myFavoriteLoaded){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 26.h,
                  ),
                  Expanded(
                    child:

                    ItemMyFavorite(
                      function: () {},
                      favoriteModel: state.dataFavoriteModel,
                    ),

                    // favoriteItem(
                    //   function: () {},
                    //   favoriteModel: cubit,
                    // ),
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
    );
  }
}



