import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/all_my_order_estate_bloc.dart';
import 'package:taif/models/estate_model.dart';
import 'package:taif/screens/primary_screens/estates_section/estate_details2_screen.dart';
import 'package:taif/screens/secondary_screens/my_adds/update_estate.dart';
import 'package:easy_localization/easy_localization.dart' as easy_localization;


class ItemMyAdds extends StatefulWidget {

  final VoidCallback function;
  final EstateModel estateModel;
  final BuildContext blockContext;

  const ItemMyAdds({Key? key,required this.function ,required this.estateModel,required this.blockContext }) : super(key: key);


  @override
  _ItemMyAddsState createState() => _ItemMyAddsState();
}

class _ItemMyAddsState extends State<ItemMyAdds> {
  @override
  Widget build(BuildContext context) {
   return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.estateModel.data!.length,
        itemBuilder: (context, index) {
          return Container(
            height: 115.h,
            child: Stack(
              children: [

                Container(
                  height: 115.h,
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x1fd5ddeb),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(right: 15),


                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EstateDetailsScreen(widget.estateModel.data![index]),
                        ),
                      );
                    },
                    child: Row(
                      children: [


                        // * size image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            height: 75.w,
                            width: 75.w,
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                              // "https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg",
                              "https://taif-app.com/storage/app/${widget.estateModel.data![index].mainImage}",

                              errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),
                              imageBuilder: (context, imageProvider) { // you can access to imageProvider
                                return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                                  backgroundImage: imageProvider,
                                );
                              },
                            ),
                          ),
                        ),

                        SizedBox(width: 10,),

                        // Expanded(
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.max,
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //
                        //       SizedBox(
                        //         height: 4.h,
                        //       ),
                        //
                        //
                        //       // * -- title
                        //       Center(
                        //         child: Text(
                        //           '${widget.estateModel.data![index].title}',
                        //           style: TextStyle(
                        //             fontFamily: 'JF Flat',
                        //             fontSize: 18.sp,
                        //             color: const Color(0xff003e4f),
                        //           ),
                        //           textAlign: TextAlign.center,
                        //           maxLines: 1,
                        //           overflow: TextOverflow.ellipsis,
                        //         ),
                        //       ),
                        //
                        //
                        //
                        //       SizedBox(
                        //         height: 10.h,
                        //       ),
                        //
                        //
                        //       Expanded(
                        //           child:Column(
                        //             children: [
                        //
                        //
                        //             Expanded(
                        //           child:Row(
                        //                 children: [
                        //
                        //                   designRow("save", "العقارات"),
                        //                   // designRow("person", "???????"),
                        //
                        //               Expanded(child:Container()),
                        //
                        //                   Expanded(child: Row(
                        //                     children: [
                        //                       designRow("speech", '${widget.estateModel.data![index].comments != null ? widget.estateModel.data![index].comments!.length : ''}'),
                        //                       designRow("eye", '${widget.estateModel.data![index].views}'),
                        //
                        //                     ],
                        //                   ),
                        //                   ),
                        //                 ],
                        //               ),
                        //               ),
                        //
                        //
                        //
                        //               Expanded(
                        //                 child: Row(
                        //                 children: [
                        //
                        //                   Expanded(
                        //                       child:
                        //                       Text(
                        //                             widget.estateModel.data![index].createdAt.toString().substring(0,10),
                        //                             style: TextStyle(
                        //                               fontFamily: 'JF Flat',
                        //                               fontSize: 12.sp,
                        //                               color: const Color(0xff7a90b7),
                        //                             ),
                        //                             textAlign: TextAlign.start,
                        //                             maxLines: 2,
                        //                       ),
                        //                   ),
                        //
                        //
                        //                   designRow("price", widget.estateModel.data![index].category!.id==2?
                        //                   'طلبات العقار':'عروض العقار'),
                        //
                        //                   Expanded(
                        //                       child:Row(
                        //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                         children: [
                        //
                        //
                        //                           Expanded(
                        //                             child:InkWell(
                        //                               onTap: () async{
                        //                                var x=await Navigator.push(
                        //                                   context,
                        //                                   MaterialPageRoute(
                        //                                     builder: (context) =>
                        //                                         UpdateStateScrean(id: widget.estateModel.data![index].id!),
                        //                                   ),
                        //                                 );
                        //
                        //                                if(x=="update"){
                        //                                  BlocProvider.of<AllMyOrderEstateBloc>(context, listen: false).add(
                        //                                      getAllMyOrderData());
                        //                                }
                        //                               },
                        //                               child:Text(
                        //                               "تعديل",
                        //                               style: TextStyle(
                        //                                 fontFamily: 'JF Flat',
                        //                                 fontSize: 12.sp,
                        //                                 color: const Color(0xff399432),
                        //                               ),
                        //                               textAlign: TextAlign.start,
                        //                               maxLines: 2,
                        //                             ),
                        //                             ),
                        //                           ),
                        //
                        //
                        //
                        //                           Expanded(
                        //                             child:InkWell(
                        //                               onTap: (){
                        //
                        //                                 if(widget.estateModel.data![index].id!=null){
                        //                                   BlocProvider.of<AllMyOrderEstateBloc>(context, listen: false).add(
                        //                                       deleteItemInMyOrder(id: widget.estateModel.data![index].id!));
                        //                                 }
                        //                                 // remove(context,widget.estateModel.data![index].id);
                        //
                        //                                 // showDialog(
                        //                                 //   barrierDismissible: false,
                        //                                 //   context: context,
                        //                                 //   builder: (context) =>  AlertDialog(
                        //                                 //     title: Padding(padding: EdgeInsets.only(left: 15,right: 15,top: 5),
                        //                                 //       child: Text("هل انت متاكد من حذف هذا العنصر ؟"),),
                        //                                 //     titlePadding: const EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0),
                        //                                 //     contentPadding: const EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0,bottom: 0),
                        //                                 //     content: Row (
                        //                                 //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //                                 //         children: <Widget>[
                        //                                 //           FlatButton(
                        //                                 //             onPressed: () => Navigator.of(context).pop(false),
                        //                                 //             child: Text("لا",
                        //                                 //               style: const TextStyle(
                        //                                 //                   color: Color(0xff00838f)
                        //                                 //               ),),
                        //                                 //             splashColor: Colors.transparent,
                        //                                 //             highlightColor: Colors.transparent,
                        //                                 //             padding: const EdgeInsets.all(0.0),
                        //                                 //           ),
                        //                                 //           FlatButton(
                        //                                 //             onPressed: () {
                        //                                 //
                        //                                 //               if(widget.estateModel.data![index].id!=null){
                        //                                 //                 BlocProvider.of<AllMyOrderEstateBloc>(context, listen: false).add(
                        //                                 //                     deleteItemInMyOrder(id: widget.estateModel.data![index].id!));
                        //                                 //               }
                        //                                 //               // Navigator.of(context).pop(true);
                        //                                 //             },
                        //                                 //             child: Text("نعم",style: const TextStyle(
                        //                                 //                 color: Color(0xff00838f)
                        //                                 //             ),),
                        //                                 //             padding: const EdgeInsets.all(0.0),
                        //                                 //             splashColor: Colors.transparent,
                        //                                 //             highlightColor: Colors.transparent,
                        //                                 //           ), // button 2
                        //                                 //         ]
                        //                                 //     ),
                        //                                 //   ),
                        //                                 // );
                        //                               },
                        //                               child: Text(
                        //                                 "حذف",
                        //                                 style: TextStyle(
                        //                                   fontFamily: 'JF Flat',
                        //                                   fontSize: 12.sp,
                        //                                   color: const Color(0xffFD6164),
                        //                                 ),
                        //                                 textAlign: TextAlign.start,
                        //                                 maxLines: 2,
                        //                               ),
                        //                             )
                        //                             ,
                        //                           ),
                        //
                        //                         ],
                        //                       ),
                        //                   ),
                        //
                        //                         ],
                        //                       )
                        //                   ),
                        //
                        //             ],
                        //           )
                        //       ),
                        //
                        //
                        //
                        //       SizedBox(
                        //         height: 10.h,
                        //       ),
                        //
                        //
                        //
                        //
                        //
                        //     ],
                        //   ),
                        // ),



                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 13.h,
                              ),


                              // * ------------------------------------Title
                              Text(
                                '${widget.estateModel.data![index].title}',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 18.sp,
                                  color: const Color(0xff003e4f),
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),


                              // * ------------------------------------Fiirst
                              Expanded(
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Expanded(
                                      child:Row(
                                        children: [
                                          SvgPicture.asset(
                                            "images/save.svg", height: 14, width: 12,),
                                          SizedBox(
                                            width: 7.h,
                                          ),

                                          Text(
                                            widget.estateModel.data![index].type_ar??'',
                                            style: TextStyle(
                                              fontFamily: 'JF Flat',
                                              fontSize: 15,
                                              color: const Color(0xFF007C9D),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),


                                    Expanded(
                                      child:Row(
                                        children: [
                                          SvgPicture.asset(
                                            "images/save.svg", height: 14, width: 12,),
                                          SizedBox(
                                            width: 7.h,
                                          ),

                                          Text(
                                            widget.estateModel.data![index].district??'',
                                            style: TextStyle(
                                              fontFamily: 'JF Flat',
                                              fontSize: 15,
                                              color: const Color(0xFF007C9D),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),






                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),


                              // * ------------------------------------>>>  2
                              Expanded(
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Expanded(
                                      child:Row(
                                        children: [
                                          Icon(Icons.access_time_outlined,color: Color(0xff007c9d),size: 22,),
                                          // SvgPicture.asset(
                                          //   "images/person.svg", height: 14, width: 12,),
                                          SizedBox(
                                            width: 7.h,
                                          ),

                                          Text(
                                            easy_localization.DateFormat('yyyy-MM-dd', 'en').format(
                                                DateTime.parse(widget.estateModel.data![index].
                                                createdAt.toString())),
                                            style: TextStyle(
                                              fontFamily: 'JF Flat',
                                              fontSize: 13.sp,
                                              color: const Color(0xff007c9d),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),


                                    Expanded(
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [

                                          // if(widget.estateModel.data![index].twenty_four_hours_spend==false)
                                        Expanded(
                                          child:InkWell(
                                            onTap: () async{
                                             var x=await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdateStateScrean(id: widget.estateModel.data![index].id!),
                                                ),
                                              );

                                             if(x=="update"){
                                               BlocProvider.of<AllMyOrderEstateBloc>(context, listen: false).add(
                                                   getAllMyOrderData());
                                             }
                                            },
                                            child:Text(
                                            "تعديل",
                                            style: TextStyle(
                                              fontFamily: 'JF Flat',
                                              fontSize: 12.sp,
                                              color: const Color(0xff399432),
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                          ),
                                          ),
                                        ),

                                          SizedBox(
                                            width: 7.h,
                                          ),


                                          Expanded(
                                            child:InkWell(
                                              onTap: (){

                                                // if(widget.estateModel.data![index].id!=null){
                                                //   BlocProvider.of<AllMyOrderEstateBloc>(context, listen: false).add(
                                                //       deleteItemInMyOrder(id: widget.estateModel.data![index].id!));
                                                // }
                                                // // remove(context,widget.estateModel.data![index].id);

                                                showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (cntx) =>  AlertDialog(
                                                    title: Padding(padding: EdgeInsets.only(left: 15,right: 15,top: 5),
                                                      child: Text("هل انت متاكد من حذف هذا العنصر ؟"),),
                                                    titlePadding: const EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0),
                                                    contentPadding: const EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0,bottom: 0),
                                                    content: Row (
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: <Widget>[
                                                          FlatButton(
                                                            onPressed: () => Navigator.of(context).pop(false),
                                                            child: Text("لا",
                                                              style: const TextStyle(
                                                                  color: Color(0xff00838f)
                                                              ),),
                                                            splashColor: Colors.transparent,
                                                            highlightColor: Colors.transparent,
                                                            padding: const EdgeInsets.all(0.0),
                                                          ),
                                                          FlatButton(
                                                            onPressed: () {

                                                              Navigator.of(context).pop(false);
                                                              if(widget.estateModel.data![index].id!=null){
                                                                BlocProvider.of<AllMyOrderEstateBloc>(context, listen: false).add(
                                                                    deleteItemInMyOrder(id: widget.estateModel.data![index].id!));
                                                              }
                                                              // Navigator.of(context).pop(true);
                                                            },
                                                            child: Text("نعم",style: const TextStyle(
                                                                color: Color(0xff00838f)
                                                            ),),
                                                            padding: const EdgeInsets.all(0.0),
                                                            splashColor: Colors.transparent,
                                                            highlightColor: Colors.transparent,
                                                          ), // button 2
                                                        ]
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                "حذف",
                                                style: TextStyle(
                                                  fontFamily: 'JF Flat',
                                                  fontSize: 12.sp,
                                                  color: const Color(0xffFD6164),
                                                ),
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                              ),
                                            )
                                            ,
                                          ),

                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 5.h,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          width: 10.w,
                        ),

                      ],
                    ),
                  ),
                ),





              ],
            ),
          );
        });
  }


  Widget designRow(image,name){
    return   Expanded(
        child:Row(
          children: [
            SvgPicture.asset("images/$image.svg",height: 12.h, width: 10.w,),
            SizedBox(
              width: 8,
            ),
            Expanded(child: Text(
              '$name',
              style: TextStyle(
                fontFamily: 'JF Flat',
                fontSize: 10.sp,
                color: const Color(0xff7a90b7),
              ),
              textAlign: TextAlign.start,
              maxLines: 2,
            ),)

          ],
        )
    );
  }


   remove(BuildContext context,id) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) =>  AlertDialog(
        title: Padding(padding: EdgeInsets.only(left: 15,right: 15,top: 5),
          child: Text("هل انت متاكد من حذف هذا العنصر ؟"),),
        titlePadding: const EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0),
        contentPadding: const EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0,bottom: 0),
        content: Row (
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text("لا",
                  style: const TextStyle(
                      color: Color(0xff00838f)
                  ),),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: const EdgeInsets.all(0.0),
              ),
              FlatButton(
                onPressed: () {

                  if(id!=null){
                    BlocProvider.of<AllMyOrderEstateBloc>(widget.blockContext, listen: false).add(
                        deleteItemInMyOrder(id: id!));
                  }
                  // Navigator.of(context).pop(true);
                },
                child: Text("نعم",style: const TextStyle(
                    color: Color(0xff00838f)
                ),),
                padding: const EdgeInsets.all(0.0),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ), // button 2
            ]
        ),
      ),
    );
  }




  static Future<bool> onWillPop(BuildContext context,id) async {
    return (await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) =>  AlertDialog(
        title: Padding(padding: EdgeInsets.only(left: 15,right: 15,top: 5),
          child: Text("هل انت متاكد من حذف هذا العنصر ؟"),),
        titlePadding: const EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0),
        contentPadding: const EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0,bottom: 0),
        content: Row (
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text("لا",
                  style: const TextStyle(
                      color: Color(0xff00838f)
                  ),),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: const EdgeInsets.all(0.0),
              ),
              FlatButton(
                onPressed: () {

                  if(id!=null){
                    BlocProvider.of<AllMyOrderEstateBloc>(context, listen: false).add(
                        deleteItemInMyOrder(id: id!));
                  }
                  // Navigator.of(context).pop(true);
                },
                child: Text("نعم",style: const TextStyle(
                    color: Color(0xff00838f)
                ),),
                padding: const EdgeInsets.all(0.0),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ), // button 2
            ]
        ),
      ),
    )) ?? false;
  }
}
