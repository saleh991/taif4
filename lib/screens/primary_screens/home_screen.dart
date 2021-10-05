import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/components/components.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/cubit/cubit.dart';
import 'package:taif/cubit/state.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/address_screen.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/events_sections/events_screen.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/harajs_section/harajs_screen.dart';
import 'package:taif/screens/secondary_screens/know_taif/know_taif.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print(AppController.instance.getId());
    return Scaffold(
      body: Column(
        children: [

          BlocProvider(
            create: (context) =>
            MainCubit()
              ..getSlider(),
            child: BlocConsumer<MainCubit, MainState>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = MainCubit.get(context);
                if (state is SliderSuccessState) {
                  return SizedBox(
                    // color: Colors.black,
                    height: 356.h,
                    width: 414.w,
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        CarouselSlider(
                          items: cubit.sliderModel.data!.map((e) {
                            return Container(
                              // color: Colors.red,
                              // height: double.infinity,
                              width: 414.w,
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,

                                imageUrl: "https://taif-app.com/storage/app/${e
                                    .image}",


                                errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),),

                            );
                          }).toList(),
                          options: CarouselOptions(
                            height: 356.h,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                            Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 94.h,
                                  ),
                                  Text(
                                    'تطبيق الطائف',
                                    style: TextStyle(
                                      fontFamily: 'JF Flat',
                                      fontSize: 28,
                                      color: const Color(0xffffffff),
                                      letterSpacing: -0.56,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  tapHomeItem(
                                    function: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => KnowTaifScreen()),
                                      );

                                    },
                                    title: 'تعرف على الطائف',
                                    color: Color(0xc2022f3b),

                                  ),
                                  tapHomeItem(
                                    function: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => EventsScreen()),
                                      );


                                    },
                                    title: 'فعاليات الطائف',
                                    color: Color(0xc2034f64),
                                  ),
                                  tapHomeItem(

                                    function: () {
                                      Navigator.pushNamed(context, offerRoute);

                                    },
                                    title: 'عروض تجارية',
                                    color: Color(0xc2022f3b),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    height: 356.h,
                    width: 414.w,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),


          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: [
                homeItem(
                  img: 'images/building.svg',
                  title: 'العقارات',
                  function: () {
                    Navigator.pushNamed(context, estateRoute);
                  },
                ),
                homeItem(
                  img: 'images/travel.svg',
                  title: 'السياحة',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddressScreen()),
                    );
                  },
                ),
                homeItem(
                  img: 'images/house.svg',
                  title: 'الخدمات',
                  function: () {
                    Navigator.pushNamed(context, servicesProvidersRoute);
                  },
                ),
                homeItem(
                  img: 'images/sem.svg',
                  title: 'حراج منوع',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HarajsScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
