import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/primary_screens/tourism/location_services.dart';



class Tourism extends StatefulWidget {
  const Tourism({Key? key}) : super(key: key);

  @override
  _TourismState createState() => _TourismState();
}

class _TourismState extends State<Tourism> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          "الاعلانات السياحية",
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


      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [



          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Expanded(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular( MediaQuery.of(context).size.width)),
                    child:SizedBox(
                      child:  Image.asset("images/tourism1.png",width: 100,fit: BoxFit.fill,height: 100,),
                    ),
                  ),
                  SizedBox(height: 10,),

                  Text(
                    "الإرشاد السياحى",
                    style: TextStyle(
                      fontFamily: fontName,
                      fontSize: 20.sp,
                      color: const Color(0xff007c9d),
                    ),
                  ),
                ],
              ),
              ),


              SizedBox(width: 10,),

              Expanded(child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddsTourism()),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular( MediaQuery.of(context).size.width),
                      child: Image.asset("images/tourism2.png",width: 100,fit: BoxFit.fill,height: 100,),
                    ),
                    SizedBox(height: 10,),

                    Text(
                      "الاعلانات السياحية",
                      style: TextStyle(
                        fontFamily: fontName,
                        fontSize: 20.sp,
                        color: const Color(0xff007c9d),
                      ),
                    ),
                  ],
                ),
              ),
              ),



              // Expanded(child: ),
            ],
          ),


        ],
      ),

    );
  }
}
