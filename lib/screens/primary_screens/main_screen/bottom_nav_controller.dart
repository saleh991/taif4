import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/cubit/cubit.dart';
import 'package:taif/cubit/state.dart';
import 'package:taif/helper/constants.dart';


class BottomNavigationController extends StatefulWidget {
  @override
  _BottomNavigationControllerState createState() =>
      _BottomNavigationControllerState();
}

class _BottomNavigationControllerState
    extends State<BottomNavigationController> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..getNotifications(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeState(index);
              },
              currentIndex: cubit.currentIndex,
              showUnselectedLabels: true,
              selectedLabelStyle: TextStyle(
                  color: Color(0xFF007C9D), fontSize: 14, fontFamily: fontName),
              selectedItemColor: Color(0xFF003E4F),
              unselectedItemColor: Color(0xFF003E4F),
              unselectedLabelStyle: TextStyle(
                  color: Color(0xFF007C9D), fontSize: 14, fontFamily: fontName),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Color(0xFF007C9D),
                  ),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: Color(0xFF007C9D),
                  ),
                  label: 'البحث',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                    color: Color(0xFF007C9D),
                  ),
                  label: 'الإشعارات',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Color(0xFF007C9D),
                  ),
                  label: 'المزيد',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
