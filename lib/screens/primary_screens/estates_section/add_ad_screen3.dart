import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';

import 'cubit/cubit.dart';

class AddAdScreen3 extends StatefulWidget {
  String? long;
  String? lat;
  String? type ;
  String? payType ;
  String? category ;
  String? authOption ;
  List<File> otherImages;
  File? image;
   AddAdScreen3({Key? key,this.long,this.lat,this.type,
     this.category,this.authOption,this.image,this.payType,
     required this.otherImages
   }) : super(key: key);

  @override
  _AddAdScreen3State createState() => _AddAdScreen3State();
}

class _AddAdScreen3State extends State<AddAdScreen3> {
  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late TextEditingController _streetWideController;
  late TextEditingController _areaController;
  late TextEditingController _directionController;
  late TextEditingController _detailsController;
  String ownership='owner';
  int sw=0;
  int sideId=0;
  bool enableCom=false;
  bool showPhone=false;
  String side='الواجهة';

  @override
  void initState() {

    super.initState();
    _titleController = TextEditingController();
    _priceController = TextEditingController();
    _streetWideController = TextEditingController();
    _areaController = TextEditingController();
    _directionController = TextEditingController();
    _detailsController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _priceController.dispose();
    _streetWideController.dispose();
    _areaController.dispose();
    _directionController.dispose();
    _detailsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
            children: [
              contactTextField(
                hint: 'عنوان الموضوع',
                controller: _titleController,
              ),
              SizedBox(
                height: 12.h,
              ),
              contactTextField(
                hint: 'السعر',
                controller: _priceController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 12.h,
              ),
              contactTextField(
                hint: 'عرض الشارع',
                controller: _streetWideController,
              ),
              SizedBox(
                height: 12.h,
              ),
              contactTextField(
                hint: 'مساحة العقار (متر مربع)',
                controller: _areaController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                width: 380.w,
                height: 43.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xffffffff),
                  border: Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
                ),
                child: Center(
                  child: DropdownButton<String>(
                    iconEnabledColor: Colors.red,
                    hint: Text(
                      side,
                      style: TextStyle(color: Color(0xFF3A3A3A)),
                    ), // Not necessary for Option 1
                    items: <String>['شرق', 'غرب', 'جنوب','شمال'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value1) {
                      print(value1);
                      if(value1=='شرق')
                        {
                          side=value1!;
                          sideId=1;
                        }

                     else if(value1=='غرب')
                      {
                        side=value1!;
                        sideId=2;
                      }
                      else if(value1=='جنوب')
                      {
                        side=value1!;
                        sideId=3;
                      }
                      else if(value1=='شمال')
                      {
                        side=value1!;
                        sideId=4;
                      }
                      setState(() {

                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      widget.authOption='سكني';
                      setState(() {

                      });
                    },
                    child: Container(

                      decoration:widget.authOption=='سكني'?
                      BoxDecoration(
                          color: Color(0xFF1F8716),
                          border: Border.all(
                              color: Colors.black,
                              width: 2
                          ),
                          borderRadius: BorderRadius.circular(12)
                      ):
                      BoxDecoration(
                          color: Color(0xFF1F8716),

                          borderRadius: BorderRadius.circular(12)
                      ),
                      height: 41.h,
                      width: 113.w,
                      child:Align(
                        alignment: Alignment.center,
                        child: Text(
                          'سكني',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ),
                  ),
                  InkWell(
                    onTap: (){
                      widget.authOption='تجاري';
                      setState(() {

                      });
                    },
                    child: Container(
                      decoration:widget.authOption=='تجاري'? BoxDecoration(
                          color: Color(0xFF06A1CB),
                          border: Border.all(
                              color: Colors.black,
                              width: 2
                          ),
                          borderRadius: BorderRadius.circular(12)
                      ):BoxDecoration(
                          color: Color(0xFF06A1CB),

                          borderRadius: BorderRadius.circular(12)
                      ),
                      height: 41.h,
                      width: 113.w,
                      child:Align(
                        alignment: Alignment.center,
                        child: Text(
                          'تجاري',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ),
                  ),
                  InkWell(
                    onTap: (){
                      widget.authOption='الكل';
                      setState(() {

                      });
                    },
                    child: Container(
                      decoration:widget.authOption=='الكل'?  BoxDecoration(
                          color:  Color(0xFF007C9D),
                          border: Border.all(
                              color: Colors.black,
                              width: 2
                          ),
                          borderRadius: BorderRadius.circular(12)
                      ):BoxDecoration(
                          color:  Color(0xFF007C9D),

                          borderRadius: BorderRadius.circular(12)
                      ),
                      height: 41.h,
                      width: 113.w,
                      child:Align(
                        alignment: Alignment.center,
                        child: Text(
                          'الكل',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ),
                  ),


                ],
              ),
              SizedBox(
                height: 30.h,
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
              Container(
                height: 61.h,
                width: 380.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: const Color(0xffffffff),
                  border: Border.all(
                    width: 1.0.w,
                    color: const Color(0xffd5ddeb),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child:  CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: showPhone,
                        onChanged: (value) {
                          setState(() {
                            showPhone = value!;
                            setState(() {

                            });
                          });
                        },
                        title: Text(
                          'إظهار رقم الهاتف',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 15.sp,
                            color: const Color(0xff007c9d),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),

                    ),
                    Expanded(
                      child:CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: enableCom,
                        onChanged: (value) {
                          setState(() {
                            enableCom = value!;
                            setState(() {

                            });
                          });
                        },
                        title: Text(
                          'السماح بالتعليقات',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 15.sp,
                            color: const Color(0xff007c9d),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),

                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 11.h,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'علاقة المعلن بالعقار',
                  style: TextStyle(
                    fontFamily: 'JF Flat',
                    fontSize: 22.sp,
                    color: const Color(0xff003e4f),
                  ),
                ),
              ),
              SizedBox(
                height: 11.h,
              ),
              Container(
                height: 61.h,
                width: 380.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: const Color(0xffffffff),
                  border: Border.all(
                    width: 1.0.w,
                    color: const Color(0xffd5ddeb),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'صاحب العقار',
                            style: TextStyle(
                              fontFamily: 'JF Flat',
                              fontSize: 18.sp,
                              color: const Color(0xff14292c),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Radio(
                            value: 0,
                            groupValue: sw,
                            onChanged: (va){
                              if(va!=null){
                                sw=va as int;
                                ownership='owner';
                                setState(() {

                                });
                              }

                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'مفوض للعقار',
                            style: TextStyle(
                              fontFamily: 'JF Flat',
                              fontSize: 18.sp,
                              color: const Color(0xff14292c),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Radio(
                            value: 1,
                            groupValue: sw,
                            onChanged: (va){
                              if(va!=null){
                                sw=va as int;
                                ownership='client';
                                setState(() {

                                });
                              }

                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                  width: 354.w,
                  height: 51.h,
                  child: languagesButton(
                    title: 'نشر الإعلان',
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
                      else   if(sideId==0)
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
                        if(widget.authOption=='تجاري')
                        {
                          widget.authOption='trading';
                        }
                        else if(widget.authOption=='سكني')
                        {
                          widget.authOption='staying';
                        }
                        else if(widget.authOption=='الكل')
                        {
                          widget.authOption='all';
                        }

                        if(widget.category=='طلب عقار')
                          {
                            sw=2;
                          }
                       else if(widget.category=='عرض عقار')
                       {
                         sw=1;
                       }
                       if(widget.type=='فيلا')
                         {
                           widget.type='villa';
                         }
                       else if(widget.type=='ارض')
                       {
                         widget.type='land';
                       }
                       else if(widget.type=='بناء')
                       {
                         widget.type='building';
                       }
                       else if(widget.type=='بيت شعبي')
                       {
                         widget.type='folk_house';
                       }
                       else if(widget.type=='شاليه')
                       {
                         widget.type='chalet';
                       }
                       else if(widget.type=='شقة')
                       {
                         widget.type='ownership_Apartment';
                       }
                       else if(widget.type=='طابق')
                       {
                         widget.type='ownership_floor';
                       }
                       else if(widget.type=='مزرعة')
                       {
                         widget.type='farm';
                       }
                       int enCom=0;
                       if(enableCom)
                         {
                           enCom=1;
                         }

                        int phone=0;
                        if(showPhone)
                        {
                          phone=1;
                        }


                        EstatesCubit()..addEstate(
                            type: widget.type!,
                            auth_option: widget.authOption!,
                            ownership: ownership,
                            area: _areaController.text,
                            price: _priceController.text,
                            description: _detailsController.text,
                            title: _titleController.text,
                            location_lat: widget.lat!,
                            location_lng: widget.long!,
                            streetWide: _streetWideController.text,
                            image: widget.image!,
                              payType: widget.payType!,
                              es: sw,
                          show_phone: phone,
                          comments_enabled: enCom,
                          images: widget.otherImages,
                          side_id: sideId
                        );
                        Navigator.pushReplacementNamed(
                            context, addedSuccefullyRoute);


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
      ),
    );
  }
}
