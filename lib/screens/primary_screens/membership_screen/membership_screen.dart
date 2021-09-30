import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:taif/components/components.dart';

import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/screens/primary_screens/membership_screen/cubit/cubit.dart';
import 'package:taif/screens/primary_screens/membership_screen/cubit/state.dart';
import 'package:taif/screens/primary_screens/membership_screen/member_details_screen.dart';
class MembershipScreen extends StatefulWidget {
  int currentIndex = 0;

  int sub;

   MembershipScreen({Key? key,required this.sub}) : super(key: key);

  @override
  _MembershipScreenState createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  @override
  void initState() {


    super.initState();
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
          'الباقات',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [InkWell(onTap:(){
          Navigator.pushNamed(context, notificationsRoute);
        },child: Image.asset('images/notification_icon.png'))],      ),
      body: BlocProvider(

        create: (context) => PackagesCubit()..getPackages(),
        child: BlocConsumer<PackagesCubit, PackagesState>(
          listener: (context, state) {
            var cubit = PackagesCubit.get(context);



            if (state is RequestPackagesSuccessState ) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MemberDetailsScreen(
                    cubit.packageModel,
                    widget.currentIndex,
                    subscriptionId: cubit.requestPackageModel.data!.id!,
                  ),
                ),
              );
            }
          },
          builder: (context, state) {


            var cubit = PackagesCubit.get(context);
            if (state is PackagesSuccessState || (cubit.packageModel.data) != null) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return membershipItem(
                      name: '${cubit.packageModel.data![index].name}',
                      price: '${cubit.packageModel.data![index].cost}',
                      ads: '${cubit.packageModel.data![index].adsCount}',
                      function: () {
                        cubit.requestPackage(id: index+1);
                        widget.currentIndex = index;
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20.h,
                    );
                  },
                  itemCount: cubit.packageModel.data!.length,
                ),
              );}

            else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
  }





