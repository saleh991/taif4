import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/components/components.dart';
import 'package:taif/cubit/cubit.dart';
import 'package:taif/cubit/state.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/screens/secondary_screens/contracts_section_screens/request_rental_right_screen.dart';
import 'package:taif/screens/secondary_screens/documentation_screen/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/documentation_screen/cubit/state.dart';
import 'package:taif/screens/secondary_screens/documentation_screen/documentation_details_screen.dart';

class DocumentationScreen extends StatelessWidget {
  const DocumentationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'التوثيق',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [InkWell(onTap:(){
          Navigator.pushNamed(context, notificationsRoute);
        },child: Image.asset('images/notification_icon.png'))],      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 327.h,
              width: ScreenUtil().screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('images/img2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            BlocProvider(
              create: (context)=>DocumentationCubit()..getDocumentation(),
              child: BlocConsumer<DocumentationCubit, DocumentationState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = DocumentationCubit.get(context).documentationsModel;
                  if (state is DocumentationSuccessState) {
                    return ListView.builder(
                        itemCount: cubit.data!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 105.h,
                            width: 394.w,
                            margin: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(1, 2),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: Center(
                              child: ListTile(
                                minVerticalPadding: 10,
                                leading: Image.asset('images/contract.png'),
                                title: Text(
                                  '${cubit.data![index].name}',
                                  style: TextStyle(
                                    fontFamily: 'JF Flat',
                                    fontSize: 18.sp,
                                    color: const Color(0xff003e4f),
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: EdgeInsetsDirectional.only(top: 13.h),
                                  child: Text.rich(
                                    TextSpan(
                                      text: '${cubit.data![index].price} ',
                                      style: TextStyle(
                                        fontFamily: 'JF Flat',
                                        fontSize: 17.sp,
                                        color: const Color(0xfffd6164),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'ريال',
                                          style: TextStyle(
                                            color: const Color(0xff1f8716),
                                          ),
                                        ),
                                      ],
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                  ),
                                ),
                                trailing: languagesButton(
                                    title: 'اطلب الآن',
                                    function: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DocumentationDetailsScreen(index: index,documentationModel: cubit,),
                                        ),
                                      );
                                    },
                                    color: Color(0xFF1F8716)),
                              ),
                            ),
                          );
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}