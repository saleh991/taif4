import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taif/models/estate_model.dart';
import 'package:taif/screens/primary_screens/estates_section/estate_details2_screen.dart';


class ItemSearch extends StatefulWidget {

  final VoidCallback function;
  final EstateModel estateModel;

  const ItemSearch({Key? key,required this.function ,required this.estateModel }) : super(key: key);

  @override
  _ItemSearchState createState() => _ItemSearchState();
}

class _ItemSearchState extends State<ItemSearch> {
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
                        SizedBox(
                          width: 93.w,
                        ),

                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              SizedBox(
                                height: 4.h,
                              ),


                              // * -- title
                             Center(
                                    child: Text(
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
                                  ),



                              SizedBox(
                                height: 10.h,
                              ),


                              Expanded(
                                  child:Row(
                                    children: [


                                     Expanded(
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Expanded(
                                              child:Row(
                                            children: [
                                              SvgPicture.asset("images/save.svg",height: 12.h, width: 10.w,),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Expanded(child: Text(
                                                'العقارات',
                                                style: TextStyle(
                                                  fontFamily: 'JF Flat',
                                                  fontSize: 10.sp,
                                                  color: const Color(0xff7a90b7),
                                                ),
                                                textAlign: TextAlign.start,
                                              ),)

                                            ],
                                          )),



                                          Expanded(
                                              child:Row(
                                            children: [

                                              SvgPicture.asset("images/price.svg",width: 10,height: 10,),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Expanded(child:Text(
                                                widget.estateModel.data![index].category!.id==2?
                                                'طلبات العقار':'عروض العقار',
                                                style: TextStyle(
                                                  fontFamily: 'JF Flat',
                                                  fontSize: 11,
                                                  color: const Color(0xff007c9d),
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              ),

                                            ],
                                          )),

                                        ],
                                      ),
                                      ),



                                      Expanded(
                                        child:Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [


                                        Expanded(
                                        child:Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [


                                              SizedBox(
                                                width: 5,
                                              ),

                                              SvgPicture.asset("images/speech.svg",height: 14.h, width: 18.w,),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '${widget.estateModel.data![index].comments != null ? widget.estateModel.data![index].comments!.length : ''}',
                                                style: TextStyle(
                                                  fontFamily: 'JF Flat',
                                                  fontSize: 12.sp,
                                                  color: const Color(0xff7a90b7),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),

                                              SvgPicture.asset("images/eye.svg",height: 9.h, width: 14.w,),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '${widget.estateModel.data![index].views}',
                                                style: TextStyle(
                                                  fontFamily: 'JF Flat',
                                                  fontSize: 12.sp,
                                                  color: const Color(0xff7a90b7),
                                                ),
                                                textAlign: TextAlign.center,
                                              )
                                            ],
                                          ),
                                          ),


                                            Expanded(
                                              child: Row(
                                            children: [

                                              SvgPicture.asset("images/person.svg",height: 12.h, width: 10.w,),

                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  widget.estateModel.data![index].user!.name??"",
                                                  style: TextStyle(
                                                    fontFamily: 'JF Flat',
                                                    fontSize: 14.sp,
                                                    color: const Color(0xff007c9d),
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          ),

                                        ],
                                      ),
                                      ),

                                    ],
                                  )
                              ),



                              SizedBox(
                                height: 10.h,
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


                Positioned(
                     child:ClipRRect(
                       borderRadius: BorderRadius.circular(40),
                       child: Container(
                         margin: EdgeInsets.only(left: 15,right: 15),
                         height: 80.w,
                         width: 80.w,
                         child: CachedNetworkImage(
                           fit: BoxFit.fill,
                           imageUrl:
                           "https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg",
                           // "https://taif-app.com/storage/app/${widget.estateModel.data![index].mainImage}",

                           errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),
                           imageBuilder: (context, imageProvider) { // you can access to imageProvider
                             return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                               backgroundImage: imageProvider,
                             );
                           },
                         ),
                       ),
                     ),
                ),



              ],
            ),
          );
        });
  }

}
