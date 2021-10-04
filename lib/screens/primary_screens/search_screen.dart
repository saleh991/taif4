import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taif/components/components.dart';
import 'package:taif/cubit/cubit.dart';
import 'package:taif/cubit/state.dart';
import 'package:taif/helper/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
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
          'البحث',
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
              BlocConsumer<MainCubit, MainState>(
                builder: (context, state) {
                  var cubit = MainCubit.get(context);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: languagesButton(
                            function: () {
                              if (checkData()) {
                                cubit.getSearchData(
                                    searchTitle: _searchController.text);
                              }else{
                                Fluttertoast.showToast(
                                    msg: 'أدخل نص للبحث عنه',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.redAccent,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                            title: 'بحث',
                            color: Color.fromRGBO(31, 135, 22, 1)),
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      if (state is SearchLoadingState ||
                          state is SearchSuccessState)
                        Text(
                          'النتائج',
                          style: TextStyle(
                            fontFamily: fontName,
                            fontSize: 23.sp,
                            color: const Color(0xff003e4f),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      SizedBox(
                        height: 15.h,
                      ),
                      if (state is SearchLoadingState)
                        LinearProgressIndicator(),
                      if (state is SearchSuccessState)
                        itemsListView(
                          function: () {},
                          estateModel: cubit.estateModel,
                        ),
                      if(state is SearchSuccessState)
                        if(cubit.estateModel.data!.length == 0)
                          Center(
                            child: Text(
                              'لا يوجد بيانات',style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: 'JF Flat',
                            ),
                            ),
                          ),
                    ],
                  );
                },
                listener: (context, state) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
  bool checkData(){
    return _searchController.text.isNotEmpty;
  }
}
