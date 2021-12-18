import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taif/components/components.dart';
import 'package:taif/cubit/cubit.dart';
import 'package:taif/cubit/state.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/primary_screens/search/item_search.dart';

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
        title: Padding(
          padding: EdgeInsets.only(right: 22,left: 22),
          child:Text(
          'البحث',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        ),

        actions: [
          InkWell(
            onTap:(){
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


      // * ------------------------ body

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              BlocConsumer<MainCubit, MainState>(
                builder: (context, state) {
                  var cubit = MainCubit.get(context);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      SizedBox(
                        height: 26.h,
                      ),

                      // *  --> searchTextField
                      searchTextField(controller: _searchController,cubit:cubit),

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

                        // * --- show  result data
                        ItemSearch(function: (){}, estateModel: cubit.estateModel),
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



  Widget searchTextField({
    required TextEditingController controller,required MainCubit cubit,
  }) {
    return Container(
      color:Colors.white,
      child: TextField(
          controller: controller,
          onChanged: (e){
            if(e.toString().trim().isNotEmpty)
              cubit.getSearchData(searchTitle: _searchController.text);
          },

          decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor:Colors.white,
            hintText: 'أدخل كلمة البحث',

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  width: 0.2, style: BorderStyle.solid, color: Color(0xFFE4ECFE)),
            ),
            suffixIcon:SizedBox(
              width: 20,height: 20,
              child: Row(
                children: [
                  SvgPicture.asset("images/search.svg",width: 20,height: 20,
                  )],),
            ),
            // Image.asset('images/search.png'),


            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0.0),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide:const BorderSide(
                color: Color(0xffE4ECFE),
              ),
            ),

          )),
    );
  }

}
