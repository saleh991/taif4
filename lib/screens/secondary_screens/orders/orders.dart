import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/secondary_screens/orders/home_services.dart';
import 'package:taif/screens/secondary_screens/orders/location_services.dart';
import 'package:taif/screens/secondary_screens/orders/offers.dart';


class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {


  String selectSction="home services";

  List sections=[{"nameAr":"خدمات منزلية","nameEn":"home services"},
  {"nameAr":"خدمات الموقع","nameEn":"location services"},
  {"nameAr":"عروض","nameEn":"offers"}];

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
          'طلبات المواقع',
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              SizedBox(height: 22,),

              Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: sections.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            setState(() {
                              selectSction=sections[index]["nameEn"];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color: Color(0xFF007C9D)
                                ),

                              color: selectSction==sections[index]["nameEn"]?Color(0xFF007C9D):Colors.white
                            ),
                            margin: EdgeInsetsDirectional.only(start: 10),
                            padding:EdgeInsets.only(left: 10,right: 10),
                            height: 40,
                            child: Center(
                              child: Text(
                                sections[index]["nameAr"],
                                style: TextStyle(
                                    color: selectSction!=sections[index]["nameEn"]?Color(0xFF007C9D):Colors.white
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),


              selectSction=="home services"?HomeServices():
              selectSction=="location services"?LocationServices():
              selectSction=="offers"?OffersOrders():HomeServices()


            ],
          ),
        ),
      ),
    );
  }
}
