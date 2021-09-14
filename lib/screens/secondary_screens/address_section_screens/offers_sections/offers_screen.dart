import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/states.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/offers_sections/offer_detailes_screen.dart';

class OffersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'العروض التجارية',
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
        create: (context) => LocationsCubit()..getOfferSections(),
        child: BlocConsumer<LocationsCubit, LocationsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var sectionCubit = LocationsCubit.get(context).offerSection;
            var offerCubit = LocationsCubit.get(context).offersModel;
            if (state is OfferSuccessState && offerCubit.data != null) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: SizedBox(
                  width: ScreenUtil().screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      ListView.builder(
                          itemCount: offerCubit.data!.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              width: 394.w,
                              height: 120.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xffcee3fb)),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x1fd5ddeb),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: offerListViewItem(
                                  section: sectionCubit
                                      .data![0]
                                      .name ??
                                      '',
                                  offerModel: offerCubit,
                                  index: index,
                                  function: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            OfferDetailsScreen(
                                              data: offerCubit.data![index],
                                            ),
                                      ),
                                    );
                                  }),
                            );
                          })
                    ],
                  ),
                ),
              );
            } else if (state is LocationsLoadingState ||
                state is OfferLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
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
