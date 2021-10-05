import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taif/models/estate_model.dart';
import 'package:taif/screens/primary_screens/estates_section/estate_details2_screen.dart';


class ItemMyAdds extends StatefulWidget {

  final VoidCallback function;
  final EstateModel estateModel;

  const ItemMyAdds({Key? key,required this.function ,required this.estateModel }) : super(key: key);


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
                                  child:Column(
                                    children: [


                                    Expanded(
                                  child:Row(
                                        children: [

                                          designRow("save", "العقارات"),
                                          designRow("person", "???????"),

                                          Expanded(child: Row(
                                            children: [
                                              designRow("speech", '${widget.estateModel.data![index].comments != null ? widget.estateModel.data![index].comments!.length : ''}'),
                                              designRow("eye", '${widget.estateModel.data![index].views}'),

                                            ],
                                          ),
                                          ),
                                        ],
                                      ),
                                      ),



                                      Expanded(
                                        child: Row(
                                        children: [

                                          Expanded(
                                              child:
                                              Text(
                                                    widget.estateModel.data![index].createdAt.toString().substring(0,10),
                                                    style: TextStyle(
                                                      fontFamily: 'JF Flat',
                                                      fontSize: 12.sp,
                                                      color: const Color(0xff7a90b7),
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 2,
                                              ),
                                          ),


                                          designRow("price", widget.estateModel.data![index].category!.id==2?
                                          'طلبات العقار':'عروض العقار'),

                                          Expanded(
                                              child:Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [

                                                  Expanded(
                                                    child:
                                                    Text(
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


                                                  Expanded(
                                                    child:
                                                    Text(
                                                      "حذف",
                                                      style: TextStyle(
                                                        fontFamily: 'JF Flat',
                                                        fontSize: 12.sp,
                                                        color: const Color(0xffFD6164),
                                                      ),
                                                      textAlign: TextAlign.start,
                                                      maxLines: 2,
                                                    ),
                                                  ),

                                                ],
                                              ),
                                          ),

                                                ],
                                              )
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
}
