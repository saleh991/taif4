import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taif/backEndPe/other/apis.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/DataHeraj.dart';
import 'package:taif/models/data_catigry_and_sup_in_heraj.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/states.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/harajs_section/haraj_detailes_screen.dart';
import 'haraj_conditon_screen.dart';

class HarajsScreenNew extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ui_Screen();
  }


}

class ui_Screen extends State<HarajsScreenNew>{

  Future<DataCatigryAndSupInHeraj?>? getCatigryAndSupInHeraj;
  Future<DataHeraj?>? getHeraj;

  int? indexCat=null;
  String? indexCatId="";

  String? indexCatIdSup="";
  int? indexSupCat=null;
  @override
  void initState() {
    super.initState();

    CatigryAndSupInHerajBackEnd();

    getDataHerajBackend();
  }

  String lang="en";
  CatigryAndSupInHerajBackEnd(){
    getCatigryAndSupInHeraj=Api.getSection();
    getCatigryAndSupInHeraj!.then((value)  {
      setState(() {
        print(value!.dataCataGryAndSu_Haraj!.length);
      });
    });



  }


  getDataHerajBackend(){
    Map<String,dynamic> body={
      "haraj_main_category_id":indexCatId,
      "haraj_category_id":indexCatIdSup
    };

    getHeraj=Api.getDataHeraje("?haraj_main_category_id=$indexCatId&haraj_category_id=$indexCatIdSup");
    getHeraj!.then((value)  {
      setState(() {

      });
    });
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
          'حراج الطائف',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [
          InkWell(onTap:(){
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
          ),)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 20.h,
            ),


            // SizedBox(
            //   height: 25.h,
            // ),



            futherBulderCatigryNdSup(),
            SizedBox(
              height: 20.h,
            ),

            futherBulderSup(),

            SizedBox(
              height: indexCat==null?1:20.h,
            ),

            futherBulderHeraje(),


          ],
        ),
      ),
    );
  }




  Widget futherBulderCatigryNdSup() {
    return FutureBuilder<DataCatigryAndSupInHeraj?>(
      future: getCatigryAndSupInHeraj, // async work
      builder: (BuildContext context, snapshot) {

        if (snapshot.hasError) {
          return Center(
            child: Text("لا يوجد بيانات متاحه الان"),
          );
        }
        else if (snapshot.hasData && snapshot.data?.status == true) {
          return
            snapshot.data!.dataCataGryAndSu_Haraj!.isEmpty ?
            Center(
              child:Container(),
            )
                :
            Column(
              children: [

                Center(
                  child: SizedBox(
                      width: 354.w,
                      height: 51.h,
                      child: languagesButton(
                        title: 'أضافة موضوع جديد',
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HarajCondtionsScreen(
                                  harajCategory: snapshot.data!.dataCataGryAndSu_Haraj,
                                )),
                          );

                          // print(categoryCubit.data!.length);
                        },
                        color: Color(0xFF007C9D),
                      )),
                ),

                Container(
                  height: 50,
                  child:  ListView(
                    scrollDirection: Axis.horizontal,
                    // physics: ScrollPhysics(),
                    padding: EdgeInsets.only(left: 10,right: 10),
                    shrinkWrap: true,
                    children: [

                      InkWell(
                        onTap: (){
                          setState(() {
                            indexCat=null;
                            indexCatId="";
                            indexCatIdSup="";
                            indexSupCat=null;
                            getDataHerajBackend();
                          });
                        },
                        child: Container(
                          height: 45,
                          margin: EdgeInsets.only(left: 5,right: 5,top: 10),
                          padding: EdgeInsets.only(left: 10,right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            border: Border.all(
                              color:
                              indexCat==null?
                              Color(0xFF007C9D):Colors.grey,
                            ),

                            color:
                            indexCat==null?
                            Color(0xFF007C9D):Colors.grey.shade200,
                          ),
                          child: Center(
                            child: Text(
                              "الكل",
                              style: TextStyle(
                                color:  indexCat==null?
                                Colors.white:Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),



                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.dataCataGryAndSu_Haraj!.length,
                          // padding: const EdgeInsets.only(left: 15,right: 15),
                          itemBuilder: (context,index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  indexSupCat=null;
                                  indexCat=index;

                                  indexCatId=snapshot.data!.dataCataGryAndSu_Haraj?[index].id.toString();
                                  indexCatIdSup="";

                                  getDataHerajBackend();

                                });
                                // Go.to(context, Item(dataAllProduct:snapshot.data!.dataProducts![index]));
                              },
                              child: Container(
                                height: 45,
                                margin: EdgeInsets.only(left: 5,right: 5,top: 10),
                                padding: EdgeInsets.only(left: 11,right: 11),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(7)),
                                  border: Border.all(
                                    color: indexCat==index?
                                    Color(0xFF007C9D):Colors.grey.shade200,

                                  ),
                                  color: indexCat==index?
                                  Color(0xFF007C9D):Colors.grey.shade200,
                                ),
                                child: Center(
                                  child: Text(
                                    snapshot.data!.dataCataGryAndSu_Haraj?[index].name??"",
                                    style: TextStyle(
                                      color:  indexCat==index?
                                      Colors.white:Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })

                    ],
                  ),
                ),
              ],
            );
        }

        return const Center();
      },
    );
  }

  Widget futherBulderSup() {
    return FutureBuilder<DataCatigryAndSupInHeraj?>(
      future: getCatigryAndSupInHeraj, // async work
      builder: (BuildContext context, snapshot) {

        if (snapshot.hasError) {
          return Center(
            child: Text("لا يوجد بيانات متاحه الان"),
          );
        }
        else if (snapshot.hasData) {
          return
            snapshot.data!.dataCataGryAndSu_Haraj!.isEmpty ?
            Center(
              child:Container(),
            )
                :
            Container(
              height: indexCat==null?1:50,
              child:  ListView(
                scrollDirection: Axis.horizontal,
                // physics: ScrollPhysics(),
                padding: EdgeInsets.only(left: 10,right: 10),
                shrinkWrap: true,
                children: [

                  indexCat==null?Container()
                      :
                  InkWell(
                    onTap: (){
                      setState(() {
                        indexSupCat=null;
                        indexCatIdSup="";
                        getDataHerajBackend();
                      });
                    },
                    child: Container(
                      height: 45,
                      margin: EdgeInsets.only(left: 5,right: 5,top: 10),
                      padding: EdgeInsets.only(left: 10,right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        border: Border.all(
                          color:
                          indexSupCat==null?
                          Color(0xFF007C9D):Colors.grey,
                        ),

                        color:
                        indexSupCat==null?
                        Color(0xFF007C9D):Colors.grey.shade200,
                      ),
                      child: Center(
                        child: Text(
                          "الكل",
                          style: TextStyle(
                            color:  indexSupCat==null?
                            Colors.white:Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),



                  indexCat==null?Container()
                      :
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.dataCataGryAndSu_Haraj![indexCat!].categories!.length,
                      // padding: const EdgeInsets.only(left: 15,right: 15),
                      itemBuilder: (context,index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              indexSupCat=index;
                              indexCatIdSup=snapshot.data!.dataCataGryAndSu_Haraj![indexCat!].categories![index].id.toString();
                              getDataHerajBackend();
                            });
                            // Go.to(context, Item(dataAllProduct:snapshot.data!.dataProducts![index]));
                          },
                          child: Container(
                            height: 45,
                            margin: EdgeInsets.only(left: 5,right: 5,top: 10),
                            padding: EdgeInsets.only(left: 11,right: 11),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7)),
                              border: Border.all(
                                color: indexSupCat==index?
                                Color(0xFF007C9D):Colors.grey.shade200,

                              ),
                              color: indexSupCat==index?
                              Color(0xFF007C9D):Colors.grey.shade200,
                            ),
                            child: Center(
                              child: Text(
                                snapshot.data!.dataCataGryAndSu_Haraj![indexCat!].categories![index].name??"",
                                style: TextStyle(
                                  color:  indexSupCat==index?
                                  Colors.white:Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      })

                ],
              ),
            );
        }

        return const Center();
      },
    );
  }



  Widget futherBulderHeraje() {
    return FutureBuilder<DataHeraj?>(
      future: getHeraj, // async work
      builder: (BuildContext context, snapshot) {

        if (snapshot.hasError) {
          return Center(
            child: Text("لا يوجد بيانات متاحه الان"),
          );
        }
        else if (snapshot.hasData ) {
          return

            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.data?.length??0,
                // padding: const EdgeInsets.only(left: 15,right: 15),
                itemBuilder: (context,index) {
                  return harajslistViewItem(
                      categoryName:
                      snapshot.data!.data![index].category!.name!,
                      harajModel: snapshot.data!,
                      index: index,

                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HarajDetailsScreen(
                                      data: snapshot.data!.data![index],
                                    )));
                      });



                  //   InkWell(
                  //   onTap: () {
                  //
                  //     // Go.to(context, Item(dataAllProduct:snapshot.data!.dataProducts![index]));
                  //   },
                  //   child: Container(
                  //     height: 45,
                  //     margin: EdgeInsets.only(left: 5,right: 5,top: 10),
                  //     padding: EdgeInsets.only(left: 11,right: 11),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.all(Radius.circular(7)),
                  //       border: Border.all(
                  //         color: indexSupCat==index?
                  //         Color(0xFF007C9D):Colors.grey.shade200,
                  //
                  //       ),
                  //       color: indexSupCat==index?
                  //       Color(0xFF007C9D):Colors.grey.shade200,
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         snapshot.data!.data![index].title??"",
                  //         style: TextStyle(
                  //           color:  indexSupCat==index?
                  //           Colors.white:Colors.black,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // );
                });
        }

        return const Center(child: CircularProgressIndicator(),);
      },
    );
  }

}
