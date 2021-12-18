import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/all_my_order_estate_bloc.dart';
import 'package:taif/backEndPe/repository/my_order_state.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/cubit.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/states.dart';
import 'package:taif/screens/secondary_screens/my_adds/item_my_adds.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({Key? key}) : super(key: key);

  @override
  _MyAdsScreenState createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
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
        actions: [InkWell(onTap: () {
          Navigator.pushNamed(context, notificationsRoute);
        }, child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 12.w
          ),
          child: Icon(
            Icons.notifications,
            color: Color(0xFF007C9D),
            size: 35.sp,
          ),
        ),)
        ],),
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
              searchTextField(controller: _searchController, context: context),
              // searchTextField(controller: _searchController,cubit:EstatesCubit.get(context) ),


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

              SizedBox(
                height: 19.h,
              ),


              no2(),
            ],
          ),
        ),
      ),
    );
  }


  Widget searchTextField({
    required TextEditingController controller,
    required context
  }) {
    return BlocProvider(
      create: (context) =>
      AllMyOrderEstateBloc(MyOrderReposotoryImpl())
        ..add(getAllMyOrderData()),
      child: BlocConsumer<AllMyOrderEstateBloc, AllMyOrderEstateState>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = EstatesCubit.get(context).myEstateModel;
          // if (state is AllMyOrderEstateStateLoaded) {
          if (state is AllMyOrderEstateStateDeleate){
            setState(() {
              controller.text="";
            });

          }
            return Container(
              color: Colors.white,
              child: TextField(
                  controller: controller,
                  onChanged: (e) {
                    // if(e.toString().trim().isNotEmpty)
                    // cubit.getSearchData(searchTitle: _searchController.text);

                    if (e
                        .toString()
                        .trim()
                        .isNotEmpty) {
                      BlocProvider.of<AllMyOrderEstateBloc>(
                          context, listen: false).add(
                          searchInMyOrder(text: e.toString().trim()));
                    }
                  },

                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hintText: 'أدخل كلمة البحث',

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                          width: 0.2,
                          style: BorderStyle.solid,
                          color: Color(0xFFE4ECFE)),
                    ),
                    suffixIcon: SizedBox(
                      width: 20, height: 20,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "images/search.svg", width: 20, height: 20,
                          )
                        ],),
                    ),
                    // Image.asset('images/search.png'),


                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.grey, width: 0.0),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color(0xffE4ECFE),
                      ),
                    ),

                  )),
            );
          // } else {
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }
        },
      ),
    );
  }



  Widget no1(){
    return BlocProvider(
      create: (context)=>EstatesCubit()..getMyEstates(),
      child: BlocConsumer<EstatesCubit, EstatesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = EstatesCubit.get(context).myEstateModel;
          if(state is MyEstatesSuccessState){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                // itemsListView(
                //   function: () {},
                //   estateModel: cubit,
                // )

                ItemMyAdds(function: (){}, estateModel: cubit,blockContext: context,),
              ],
            );
          }else{
            return Center(
              child:CircularProgressIndicator(),
            );
          }

        },
      ),
    );
  }


  Widget no2(){
    return BlocProvider(
      create: (context)=>AllMyOrderEstateBloc(MyOrderReposotoryImpl())..add(getAllMyOrderData()),
      child: BlocConsumer<AllMyOrderEstateBloc, AllMyOrderEstateState>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = EstatesCubit.get(context).myEstateModel;
          if(state is AllMyOrderEstateStateLoaded){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // itemsListView(
                //   function: () {},
                //   estateModel: cubit,
                // )

                ItemMyAdds(function: (){}, estateModel: state.dataEstateModelModel,blockContext: context,),
              ],
            );
          }else{
            return Center(
              child:CircularProgressIndicator(),
            );
          }

        },
      ),
    );
  }
}
