import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/all_my_favorite_bloc.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/all_my_order_estate_bloc.dart';
import 'package:taif/models/estate_model.dart';
import 'package:taif/models/favorite_model.dart';
import 'package:taif/screens/primary_screens/estates_section/estate_details2_screen.dart';

import 'favorite_details.dart';


class ItemMyFavorite extends StatefulWidget {

  final VoidCallback function;
  final FavoriteModel favoriteModel;

  const ItemMyFavorite({Key? key,required this.function ,required this.favoriteModel }) : super(key: key);


  @override
  _ItemMyFavoriteState createState() => _ItemMyFavoriteState();
}

class _ItemMyFavoriteState extends State<ItemMyFavorite> {
  @override
  void initState() {
    super.initState();

    print(">>>>>>>?????????");
    print(widget.favoriteModel.data!.appModelsEstate![0].favorite);
  }
  @override
  Widget build(BuildContext context) {
   return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.favoriteModel.data!.appModelsEstate!.length,
        itemBuilder: (context, index) {
          if(widget.favoriteModel.data!.appModelsEstate![index].favorite !=null)
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         EstateDetailsScreen(widget.estateModel.data![index]),
                      //   ),
                      // );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FavoriteDetailsScreen(widget.favoriteModel.data!.appModelsEstate![index]),
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
                              "https://taif-app.com/storage/app/${widget.favoriteModel.data!.appModelsEstate![index].favorite!.image}",

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
                                  '${widget.favoriteModel.data!.appModelsEstate![index].favorite!.title}',
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
                                          designRow("location", "الحوية"),

                                          Expanded(child: Row(
                                            children: [
                                              designRow("speech", "0"),
                                              designRow("eye", '${widget.favoriteModel.data!.appModelsEstate![index].favorite!.views}'),

                                            ],
                                          ),
                                          ),
                                        ],
                                      ),
                                      ),



                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [



                                          designRow("price",'عروض العقار'),


                                          Expanded(
                                            child:InkWell(
                                              onTap: (){
                                                BlocProvider.of<AllMyFavoriteBloc>(context, listen: false).add(
                                                    deleteItemInMyFavorite(id:widget.favoriteModel.data!.appModelsEstate![index].id!));

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

          else
            return SizedBox();
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
