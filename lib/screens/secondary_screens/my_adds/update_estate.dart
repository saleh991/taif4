import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/all_my_order_estate_bloc.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/districts_bloc.dart';
import 'package:taif/backEndPe/repository/districts.dart';
import 'package:taif/backEndPe/repository/my_order_state.dart';
import 'package:taif/components/components.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/data_districts.dart';
import 'package:taif/screens/secondary_screens/my_adds/my_ads_screen.dart';



class UpdateStateScrean extends StatefulWidget {

  final int id;
  const UpdateStateScrean({Key? key,required this.id}) : super(key: key);

  @override
  _UpdateStateState createState() => _UpdateStateState();
}

class _UpdateStateState extends State<UpdateStateScrean> {

   TextEditingController _titleController= TextEditingController();
   TextEditingController _priceController= TextEditingController();
   TextEditingController _streetWideController= TextEditingController();
   TextEditingController _areaController= TextEditingController();
   TextEditingController _directionController= TextEditingController();
   TextEditingController _detailsController= TextEditingController();
   late TextEditingController _phoneController;
   late TextEditingController _old_yearsController;



   int sw=0;
   int sideId=0;
   bool enableCom=false;
   bool showPhone=false;

   String? sidename;
   String? side;


   String? type;
   String? typename;
   String? districts;
   // String type = "فيلا";
   String? category;
   // String category = 'عرض عقار';
   String? authOption;
   // String authOption = "الكل";

   String mortgaged=' هل العقار مرهون*';
   int mortgagedId=0;

   @override
   void initState() {

     super.initState();
     _old_yearsController = TextEditingController();
     _phoneController = TextEditingController();
     _titleController = TextEditingController();
     _priceController = TextEditingController();
     _streetWideController = TextEditingController();
     _areaController = TextEditingController();
     _directionController = TextEditingController();
     _detailsController = TextEditingController();
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
          'إضافة إعلان للعقارات',
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




      body: no3(),
    );
  }




   Widget no2(){
     return BlocProvider(
       create:(context)=> DistrictsBloc(DistrictsImpl())..add(getAllDistrictsEvent()),
       child: BlocConsumer<DistrictsBloc, DistrictsState>(
         listener: (context, state) {},
         builder: (context, state) {
           // var cubit = MainCubit.get(context);
           if(state is AllDistrictsStateLoaded){
             // * --------------------------------------------------designScreen
             return Padding(
               padding: EdgeInsets.symmetric(horizontal: 0.w),
               child: myWidget(context,state.dataDistricts),
             );
           }if(state is AllDistrictsStateError){
             // * -------------------------------------------------Error

             return Padding(
               padding: EdgeInsets.symmetric(horizontal: 1.w),
               child: Text(
                 'يوجد خطا في التواصل الي البيانت',
                 style: TextStyle(
                   fontFamily: fontName,
                   fontSize: 20.sp,
                   color: const Color(0xff007c9d),
                 ),
               ),
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

   Widget marhon(BuildContext context) {
     return StatefulBuilder(
       builder: (context, StateSetter setState) {
         return     Row(
           children: [

             // Expanded(child:
             // Container(
             //   width: 380.w,
             //   height: 43.h,
             //   decoration: BoxDecoration(
             //     borderRadius: BorderRadius.circular(5.0),
             //     color: const Color(0xffffffff),
             //     border: Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
             //   ),
             //   child: Center(
             //     child: DropdownButton<String>(
             //       underline: Container(),
             //       iconEnabledColor: Color(0xFF003E4F),
             //       hint: Text(
             //         side??"واجهة العقار *",
             //         style: TextStyle(color: Color(0xFF3A3A3A)),
             //       ), // Not necessary for// Option 1
             //       value: sidename,
             //       items: widget.side!.map((item) {
             //         return
             //           DropdownMenuItem(
             //             child:  Padding(padding: EdgeInsets.only(left: 0,right: 0),child:  Text(item.name??""),),
             //
             //             value: item.id.toString(),
             //           );
             //       }).toList(),
             //       onChanged: (value1) {
             //         print(value1);
             //         print(value1);
             //         side=value1.toString();
             //         sideId=int.parse(value1.toString());
             //         setState(() {
             //           sidename=value1.toString();
             //         });
             //       },
             //     ),
             //   ),
             // )
             // ),
             SizedBox(
               width: 8.h,
             ),



             // * ---------------
             Expanded(child: Container(
               width: 380.w,
               height: 43.h,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5.0),
                 color: const Color(0xffffffff),
                 border: Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
               ),
               child: Center(
                 child: DropdownButton<String>(
                   underline: Container(),
                   iconEnabledColor: Color(0xFF003E4F),
                   hint: Text(
                     mortgaged,
                     style: TextStyle(color: Color(0xFF3A3A3A)),
                   ), // Not necessary for Option 1
                   items: <String>[ 'غير مرهون','مرهون'].map((String value) {
                     return DropdownMenuItem<String>(
                       value: value,

                       child:  Padding(padding: EdgeInsets.only(left: 10,right: 10),child: Text(value),),
                       // child: new Text(value),
                     );
                   }).toList(),
                   onChanged: (value1) {
                     print(value1);
                     if(value1=='مرهون')
                     {
                       mortgaged=value1!;
                       mortgagedId=1;
                     }

                     else if(value1=='غير مرهون')
                     {
                       mortgaged=value1!;
                       mortgagedId=0;
                     }
                     setState(() {

                     });
                   },
                 ),
               ),
             ),)
           ],
         );
       },
     );
   }



   Widget myWidget(BuildContext context,DataDistricts? dataDistricts) {
     return StatefulBuilder(
       builder: (context, StateSetter setState) {
         return SingleChildScrollView(
           physics: BouncingScrollPhysics(),
           child: Column(
             children: [

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [

                   // SizedBox(width: 15,),
                   //
                   // SizedBox(width: 10,),


                   // * ---  >> اختر القسم
                   Expanded(
                       child:Container(
                         width: 180.w,
                         height: 43.h,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5.0),
                           color: const Color(0xffffffff),
                           border:
                           Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
                         ),
                         child: Center(
                           child: DropdownButton<String>(
                             underline: Container(),
                             iconEnabledColor: Color(0xff007c9d),
                             hint: Text(
                               category??"اختر القسم",
                               style: TextStyle(color: Color(0xFF3A3A3A)),
                             ), // Not necessary for Option 1
                             items: <String>['عرض عقار','طلب عقار'].map((String value) {
                               return DropdownMenuItem<String>(
                                 value: value,
                                 // child: new Text(value),
                                 child:  Padding(padding: EdgeInsets.only(left: 5,right: 5),child: Text(value),),
                               );
                             }).toList(),
                             onChanged: (value1) {
                               print(value1);
                               category = value1!;
                               setState(() {

                               });
                             },
                           ),
                         ),
                       )
                   ),

                   SizedBox(width: 10,),


                   // * ---  >> الغرض
                   Expanded(
                       child:Container(
                         width: 180.w,
                         height: 43.h,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5.0),
                           color: const Color(0xffffffff),
                           border:
                           Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
                         ),
                         child: Center(
                           child: DropdownButton<String>(
                             underline: Container(),
                             iconEnabledColor: Color(0xff007c9d),
                             hint: Text(
                               authOption??"الغرض ",
                               style: TextStyle(color: Color(0xFF3A3A3A)),
                             ), // Not necessary for Option 1
                             items: <String>['الكل', 'تجاري', 'سكني'].map((String value) {
                               return DropdownMenuItem<String>(
                                 value: value,
                                 // child: new Text(value),
                                 child:  Padding(padding: EdgeInsets.only(left: 10,right: 10),child: Text(value),),
                               );
                             }).toList(),
                             onChanged: (value1) {
                               print(value1);
                               authOption = value1!;
                               setState(() {

                               });
                             },
                           ),
                         ),
                       )
                   ),


                   // SizedBox(width: 15,),
                 ],
               ),
               SizedBox(
                 height: 15.h,
               ),

               Row(
                 children: [

                   // SizedBox(width: 15,),
                   //
                   // SizedBox(width: 10,),

                   // * ---  >> نوع العقار

                   Expanded(
                     child: Container(
                       width: MediaQuery.of(context).size.width-30,
                       height: 43,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5.0),
                         color: const Color(0xffffffff),
                         border: Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
                       ),
                       child: Center(
                         child: DropdownButton<String>(
                           isExpanded: false,
                           underline: Container(),
                           iconEnabledColor: Color(0xff007c9d),
                           hint: Text(
                             type??"نوع العقار",
                             style: TextStyle(color: Color(0xFF3A3A3A)),
                           ), // Not necessary for Option 1

                           value: typename,
                           items: dataDistricts!.dataDistrictsModule!.types!.map((item) {
                             return  DropdownMenuItem(
                               child:  Padding(padding: EdgeInsets.only(left: 0,right: 0),child:  Text(item.value??""),),
                               value: item.key.toString(),
                               // value: type.toString(),
                             );
                           }).toList(),
                           onChanged: (value1) {
                             print(value1);
                             type = value1!;
                             setState(() {
                               typename=value1.toString();
                               print(type);
                             });
                           },
                         ),
                       ),
                     ),
                   ),

                   SizedBox(width: 10,),

                   Expanded(
                     flex: 1,
                     child: Container(
                       width: MediaQuery.of(context).size.width-30,
                       height: 43,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5.0),
                         color: const Color(0xffffffff),
                         border: Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
                       ),
                       child: Center(
                         child: DropdownButton(
                           underline: Container(),
                           iconEnabledColor: Color(0xff007c9d),
                           items: dataDistricts.dataDistrictsModule!.districts!.map((item) {
                             return  DropdownMenuItem(
                               child:  Padding(padding: EdgeInsets.only(left: 0,right: 0),child:  Text(item.nameAr??""),),
                               // child: new Text(value),
                               // child: Text(item.nameAr??""),
                               value: item.nameAr.toString(),
                             );
                           }).toList(),
                           hint: Text(
                             districts??"اختار الحي",
                             style: TextStyle(color: Color(0xFF3A3A3A)),
                           ),
                           onChanged: (newVal) {
                             setState(() {
                               districts = newVal.toString();
                               debugPrint(newVal.toString());
                             });
                           },
                           value: districts,
                           isExpanded: false,
                           // isDense: true,
                         ),
                       ),
                     ),
                   ),


                   // SizedBox(width: 15,),

                 ],
               ),

               SizedBox(
                 height: 15.h,
               ),

               // no3(),

             ],
           ),
         );
       },
     );
   }

   Widget designScreen(BuildContext context,DataDistricts? dataDistricts){
     return SingleChildScrollView(
       physics: BouncingScrollPhysics(),
       child: Column(
         children: [

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [

               // SizedBox(width: 15,),
               //
               // SizedBox(width: 10,),


               // * ---  >> اختر القسم
               Expanded(
                   child:Container(
                     width: 180.w,
                     height: 43.h,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(5.0),
                       color: const Color(0xffffffff),
                       border:
                       Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
                     ),
                     child: Center(
                       child: DropdownButton<String>(
                         underline: Container(),
                         iconEnabledColor: Color(0xff007c9d),
                         hint: Text(
                           category??"اختر القسم",
                           style: TextStyle(color: Color(0xFF3A3A3A)),
                         ), // Not necessary for Option 1
                         items: <String>['عرض عقار','طلب عقار'].map((String value) {
                           return DropdownMenuItem<String>(
                             value: value,
                             // child: new Text(value),
                             child:  Padding(padding: EdgeInsets.only(left: 5,right: 5),child: Text(value),),
                           );
                         }).toList(),
                         onChanged: (value1) {
                           print(value1);
                           category = value1!;
                           setState(() {

                           });
                         },
                       ),
                     ),
                   )
               ),

               SizedBox(width: 10,),


               // * ---  >> الغرض
               Expanded(
                   child:Container(
                     width: 180.w,
                     height: 43.h,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(5.0),
                       color: const Color(0xffffffff),
                       border:
                       Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
                     ),
                     child: Center(
                       child: DropdownButton<String>(
                         underline: Container(),
                         iconEnabledColor: Color(0xff007c9d),
                         hint: Text(
                           authOption??"الغرض ",
                           style: TextStyle(color: Color(0xFF3A3A3A)),
                         ), // Not necessary for Option 1
                         items: <String>['الكل', 'تجاري', 'سكني'].map((String value) {
                           return DropdownMenuItem<String>(
                             value: value,
                             // child: new Text(value),
                             child:  Padding(padding: EdgeInsets.only(left: 10,right: 10),child: Text(value),),
                           );
                         }).toList(),
                         onChanged: (value1) {
                           print(value1);
                           authOption = value1!;
                           setState(() {

                           });
                         },
                       ),
                     ),
                   )
               ),


               // SizedBox(width: 15,),
             ],
           ),
           SizedBox(
             height: 15.h,
           ),

           Row(
             children: [

               // SizedBox(width: 15,),
               //
               // SizedBox(width: 10,),

               // * ---  >> نوع العقار

               Expanded(
                 child: Container(
                   width: MediaQuery.of(context).size.width-30,
                   height: 43,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5.0),
                     color: const Color(0xffffffff),
                     border: Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
                   ),
                   child: Center(
                     child: DropdownButton<String>(
                       isExpanded: false,
                       underline: Container(),
                       iconEnabledColor: Color(0xff007c9d),
                       hint: Text(
                         type??"نوع العقار",
                         style: TextStyle(color: Color(0xFF3A3A3A)),
                       ), // Not necessary for Option 1

                       value: typename,
                       items: dataDistricts!.dataDistrictsModule!.types!.map((item) {
                         return  DropdownMenuItem(
                           child:  Padding(padding: EdgeInsets.only(left: 0,right: 0),child:  Text(item.value??""),),
                           value: item.key.toString(),
                           // value: type.toString(),
                         );
                       }).toList(),
                       onChanged: (value1) {
                         print(value1);
                         type = value1!;
                         setState(() {
                           typename=value1.toString();
                           print(type);
                         });
                       },
                     ),
                   ),
                 ),
               ),

               SizedBox(width: 10,),

               Expanded(
                 flex: 1,
                 child: Container(
                   width: MediaQuery.of(context).size.width-30,
                   height: 43,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5.0),
                     color: const Color(0xffffffff),
                     border: Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
                   ),
                   child: Center(
                     child: DropdownButton(
                       underline: Container(),
                       iconEnabledColor: Color(0xff007c9d),
                       items: dataDistricts.dataDistrictsModule!.districts!.map((item) {
                         return  DropdownMenuItem(
                           child:  Padding(padding: EdgeInsets.only(left: 0,right: 0),child:  Text(item.nameAr??""),),
                           // child: new Text(value),
                           // child: Text(item.nameAr??""),
                           value: item.nameAr.toString(),
                         );
                       }).toList(),
                       hint: Text(
                         districts??"اختار الحي",
                         style: TextStyle(color: Color(0xFF3A3A3A)),
                       ),
                       onChanged: (newVal) {
                         setState(() {
                           districts = newVal.toString();
                           debugPrint(newVal.toString());
                         });
                       },
                       value: districts,
                       isExpanded: false,
                       // isDense: true,
                     ),
                   ),
                 ),
               ),


               // SizedBox(width: 15,),

             ],
           ),

           SizedBox(
             height: 15.h,
           ),

           // no3(),

         ],
       ),
     );
   }







  Widget no3(){
    return BlocProvider(
      create: (context)=>AllMyOrderEstateBloc(MyOrderReposotoryImpl())..add(singelOrder(id: widget.id)),
      child: BlocConsumer<AllMyOrderEstateBloc, AllMyOrderEstateState>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = EstatesCubit.get(context).myEstateModel;


          if(state is AllMyOrderEstateStateError){
            return Text(state.massageError);
          }else if(state is UpdateDineSingleOrderState){
            // return Text("Lllllll");

            Navigator.pop(context,"update");
            Fluttertoast.showToast(
                msg: 'تم التعديل بنجاح ',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                fontSize: 16.0);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) =>
            //         MyAdsScreen(),
            //   ),
            // );
          }else if(state is updateMyOrderEstateStateLoading){
            return bodyForm(context);
          }
          else if(state is SingleOrderState){
            // setState(() {
              // TextEditingController _streetWideController= TextEditingController();

              _titleController.text=state.singleOrder.data!.title!;
              _priceController.text=state.singleOrder.data!.price!.toString();
              _detailsController.text=state.singleOrder.data!.description!.toString();
              _areaController.text=state.singleOrder.data!.area!.toString();
              _streetWideController.text=state.singleOrder.data!.streetWide!.toString();

              _old_yearsController.text=state.singleOrder.data!.old_years!.toString();
              _phoneController.text=state.singleOrder.data!.user!.phone!.toString();



              side=state.singleOrder.data!.side!.name.toString();
              sideId=state.singleOrder.data!.side!.id!;

              category=state.singleOrder.data!.category?.name??"";
              category=state.singleOrder.data!.category?.name??"";

              type=state.singleOrder.data!.type??"";
              typename=state.singleOrder.data!.type??"";

              districts=state.singleOrder.data?.district??"";

              // type=state.singleOrder.data?.type??"";

              if(state.singleOrder.data!.authOption=="trading"){
                authOption="تجاري";
              }else if(state.singleOrder.data!.authOption=="staying"){
                authOption="سكني";
              }else{
                authOption="الكل";
              }


              if(state.singleOrder.data!.mortgaged==1){
                mortgaged="مرهون";
              }else{
                mortgaged="غير مرهون";
              }
              mortgagedId=state.singleOrder.data!.mortgaged??0;

              print(typename);
              print(typename);

            return bodyForm(context);
          }

            return Center(
              child:CircularProgressIndicator(),
            );


        },
      ),
    );
  }



  Widget bodyForm(blocContext) {

     return SingleChildScrollView(
       physics: BouncingScrollPhysics(),
       child: Padding(
         padding: EdgeInsets.symmetric(horizontal: 17.w),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [





             SizedBox(
               height: 50.h,
             ),

             no2(),

             SizedBox(
               height: 20.h,
             ),



             contactTextField(
               hint: 'عنوان الاعلان',
               controller: _titleController,
             ),

             SizedBox(
               height: 12.h,
             ),

             Row(
               children: [

                 Expanded(child:
                 contactTextField(
                   hint: '  ثمن السلعة ريال',
                   controller: _priceController,
                   keyboardType: TextInputType.number,
                 ),
                 ),
                 SizedBox(
                   width: 8.h,
                 ),
                 Expanded(child: contactTextField(
                   hint: 'عمر العقار ( سنة )*',
                   controller: _old_yearsController,
                   keyboardType: TextInputType.number,
                 ),
                 ),
               ],
             ),


             SizedBox(
               height: 12.h,
             ),

             contactTextField(
               hint: 'رقم الهاتف',
               controller: _phoneController,
               keyboardType: TextInputType.phone,
             ),

             SizedBox(
               height: 12.h,
             ),
             Row(
                 children: [

                   Expanded(child:contactTextField(
                     hint: 'عرض الشارع (م٢)*',
                     controller: _streetWideController,
                   ),
                   ),

                   SizedBox(
                     width: 8.h,
                   ),

                   Expanded(child:contactTextField(
                     hint: ' مساحة العقار (م٢)*',
                     controller: _areaController,
                     keyboardType: TextInputType.number,
                   ),
                   ),
                 ]
             ),
             SizedBox(
               height: 18.h,
             ),




            marhon(context),


             // SizedBox(
             //   height: 18.h,
             // ),



             SizedBox(
               height: 18.h,
             ),

             Align(
               alignment: AlignmentDirectional.topStart,
               child: Text(
                 'تفاصيل الإعلان',
                 style: TextStyle(
                   fontFamily: 'JF Flat',
                   fontSize: 15.sp,
                   color: const Color(0xff003e4f),
                 ),
               ),
             ),
             SizedBox(
               height: 12.h,
             ),
             contactTextField(
               hint: '',
               controller: _detailsController,
               line: 10,
             ),
             SizedBox(
               height: 36.h,
             ),
             // Container(
             //   height: 61.h,
             //   width: 380.w,
             //   decoration: BoxDecoration(
             //     borderRadius: BorderRadius.circular(7.0),
             //     color: const Color(0xffffffff),
             //     border: Border.all(
             //       width: 1.0.w,
             //       color: const Color(0xffd5ddeb),
             //     ),
             //   ),
             //   child: Row(
             //     children: [
             //       Expanded(
             //         child:  CheckboxListTile(
             //           controlAffinity: ListTileControlAffinity.leading,
             //           value: showPhone,
             //           onChanged: (value) {
             //             setState(() {
             //               showPhone = value!;
             //               setState(() {
             //
             //               });
             //             });
             //           },
             //           title: Text(
             //             'إظهار رقم الهاتف',
             //             style: TextStyle(
             //               fontFamily: 'JF Flat',
             //               fontSize: 15.sp,
             //               color: const Color(0xff007c9d),
             //               decoration: TextDecoration.underline,
             //             ),
             //           ),
             //         ),
             //
             //       ),
             //       Expanded(
             //         child:CheckboxListTile(
             //           controlAffinity: ListTileControlAffinity.leading,
             //           value: enableCom,
             //           onChanged: (value) {
             //             setState(() {
             //               enableCom = value!;
             //               setState(() {
             //
             //               });
             //             });
             //           },
             //           title: Text(
             //             'السماح بالتعليقات',
             //             style: TextStyle(
             //               fontFamily: 'JF Flat',
             //               fontSize: 15.sp,
             //               color: const Color(0xff007c9d),
             //               decoration: TextDecoration.underline,
             //             ),
             //           ),
             //         ),
             //
             //       ),
             //     ],
             //   ),
             // ),
             // SizedBox(
             //   height: 11.h,
             // ),
             // Align(
             //   alignment: AlignmentDirectional.topStart,
             //   child: Text(
             //     'علاقة المعلن بالعقار',
             //     style: TextStyle(
             //       fontFamily: 'JF Flat',
             //       fontSize: 22.sp,
             //       color: const Color(0xff003e4f),
             //     ),
             //   ),
             // ),
             // SizedBox(
             //   height: 11.h,
             // ),
             // Container(
             //   height: 61.h,
             //   width: 380.w,
             //   decoration: BoxDecoration(
             //     borderRadius: BorderRadius.circular(7.0),
             //     color: const Color(0xffffffff),
             //     border: Border.all(
             //       width: 1.0.w,
             //       color: const Color(0xffd5ddeb),
             //     ),
             //   ),
             //   child: Row(
             //     children: [
             //       Expanded(
             //         child: Row(
             //           children: [
             //             Text(
             //               'صاحب العقار',
             //               style: TextStyle(
             //                 fontFamily: 'JF Flat',
             //                 fontSize: 18.sp,
             //                 color: const Color(0xff14292c),
             //               ),
             //               textAlign: TextAlign.center,
             //             ),
             //             Radio(
             //               value: 0,
             //               groupValue: sw,
             //               onChanged: (va){
             //                 if(va!=null){
             //                   sw=va as int;
             //                   ownership='owner';
             //                   setState(() {
             //
             //                   });
             //                 }
             //
             //               },
             //             ),
             //           ],
             //         ),
             //       ),
             //       Expanded(
             //         child: Row(
             //           children: [
             //             Text(
             //               'مفوض للعقار',
             //               style: TextStyle(
             //                 fontFamily: 'JF Flat',
             //                 fontSize: 18.sp,
             //                 color: const Color(0xff14292c),
             //               ),
             //               textAlign: TextAlign.center,
             //             ),
             //             Radio(
             //               value: 1,
             //               groupValue: sw,
             //               onChanged: (va){
             //                 if(va!=null){
             //                   sw=va as int;
             //                   ownership='client';
             //                   setState(() {
             //
             //                   });
             //                 }
             //
             //               },
             //             ),
             //           ],
             //         ),
             //       ),
             //     ],
             //   ),
             // ),

             SizedBox(
               height: 50.h,
             ),
             SizedBox(
                 width: 354.w,
                 height: 51.h,
                 child: languagesButton(
                   title: 'تحديث الإعلان',
                   function: () {
                     if(_titleController.text.length==0||_titleController.text.trim()=='')
                       AwesomeDialog(
                         context: context,
                         dialogType: DialogType.INFO,
                         animType: AnimType.BOTTOMSLIDE,
                         title: 'نقص في المعلومات',
                         desc: 'يجب اضافة عنوان',
                         btnOkText: 'تم',

                         btnOkOnPress: () {},
                       )..show();
                     else   if(_priceController.text.length==0||_priceController.text.trim()=='')
                       AwesomeDialog(
                         context: context,
                         dialogType: DialogType.INFO,
                         animType: AnimType.BOTTOMSLIDE,
                         title: 'نقص في المعلومات',
                         desc: 'يجب اضافة السعر',
                         btnOkText: 'تم',

                         btnOkOnPress: () {},
                       )..show();
                     else   if(_priceController.text.length==0||_priceController.text.trim()=='')
                       AwesomeDialog(
                         context: context,
                         dialogType: DialogType.INFO,
                         animType: AnimType.BOTTOMSLIDE,
                         title: 'نقص في المعلومات',
                         desc: 'يجب اضافة السعر',
                         btnOkText: 'تم',

                         btnOkOnPress: () {},
                       )..show();
                     else   if(_areaController.text.length==0||_areaController.text.trim()=='')
                       AwesomeDialog(
                         context: context,
                         dialogType: DialogType.INFO,
                         animType: AnimType.BOTTOMSLIDE,
                         title: 'نقص في المعلومات',
                         desc: 'يجب اضافة المساحة',
                         btnOkText: 'تم',

                         btnOkOnPress: () {},
                       )..show();
                     else   if(_streetWideController.text.length==0||_streetWideController.text.trim()=='')
                       AwesomeDialog(
                         context: context,
                         dialogType: DialogType.INFO,
                         animType: AnimType.BOTTOMSLIDE,
                         title: 'نقص في المعلومات',
                         desc: 'يجب اضافة عرض الشارع',
                         btnOkText: 'تم',

                         btnOkOnPress: () {},
                       )..show();
                     else   if(_detailsController.text.length==0||_detailsController.text.trim()=='')
                       AwesomeDialog(
                         context: context,
                         dialogType: DialogType.INFO,
                         animType: AnimType.BOTTOMSLIDE,
                         title: 'نقص في المعلومات',
                         desc: 'يجب اضافة تفاصيل',
                         btnOkText: 'تم',

                         btnOkOnPress: () {},
                       )..show();
                     else   if(side==null)
                       AwesomeDialog(
                         context: context,
                         dialogType: DialogType.INFO,
                         animType: AnimType.BOTTOMSLIDE,
                         title: 'نقص في المعلومات',
                         desc: 'يجب اضافة الواجهة',
                         btnOkText: 'تم',

                         btnOkOnPress: () {},
                       )..show();



                     else{
                       Map<String,dynamic> body={
                         "old_years":_old_yearsController.text.toString(),
                         "phone":_phoneController.text.toString(),
                         "mortgaged":mortgagedId,
                         "side_id":sideId,
                         "user_id":AppController.instance.getId().toString(),
                         "type":type,
                         "district":districts,
                         "auth_option":
                         authOption=='تجاري'?'trading':
                         authOption=='سكني'?'staying':
                         authOption=='الكل'?'all': "all",
                         "title":_titleController.text,
                         "description":_detailsController.text,
                         "price":_priceController.text,
                         "area":_areaController.text,
                         "street_wide":_streetWideController.text,
                         "estate_category_id":category=='طلب عقار'?2:1,
                         "_method":"PUT",
                       };

                       BlocProvider.of<AllMyOrderEstateBloc>(blocContext, listen: false).add(
                           UpdateSingleEvent(
                               id: widget.id,
                               body:body
                           )
                       );
                     }

                   },
                   color: Color.fromRGBO(31, 135, 22, 1),
                 )),
             SizedBox(
               height: 50.h,
             ),
           ],
         ),
       ),
     );
  }
}

/*

 Fluttertoast.showToast(
                                  msg: 'تم الاضافة للمفضلة',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.blue,
                                  textColor: Colors.white,
                                  fontSize: 16.0);

 */