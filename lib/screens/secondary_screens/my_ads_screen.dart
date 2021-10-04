import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/cubit.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/states.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({Key? key}) : super(key: key);

  @override
  _MyAdsScreenState createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

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
          'إعلاناتي',
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
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 26.h,
              ),
              searchTextField(controller: _searchController),
              SizedBox(
                height: 19.h,
              ),
              Text(
                'النتائج',
                style: TextStyle(
                  fontFamily: fontName,
                  fontSize: 23.sp,
                  color: const Color(0xff003e4f),
                ),
                textAlign: TextAlign.right,
              ),
              BlocProvider(
                create: (context)=>EstatesCubit()..getMyEstates(),
                child: BlocConsumer<EstatesCubit, EstatesState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var cubit = EstatesCubit.get(context).myEstateModel;
                    if(state is MyEstatesSuccessState){
                      return itemsListView(
                        function: () {},
                        estateModel: cubit,
                      );
                    }else{
                      return Center(
                        child:CircularProgressIndicator(),
                      );
                    }

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
