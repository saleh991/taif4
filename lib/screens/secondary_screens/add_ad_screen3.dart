import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';

class AddAdScreen3 extends StatefulWidget {
  const AddAdScreen3({Key? key}) : super(key: key);

  @override
  _AddAdScreen3State createState() => _AddAdScreen3State();
}

class _AddAdScreen3State extends State<AddAdScreen3> {
  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late TextEditingController _addressController;
  late TextEditingController _streetWidthController;
  late TextEditingController _directionController;
  late TextEditingController _detailsController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController();
    _priceController = TextEditingController();
    _addressController = TextEditingController();
    _streetWidthController = TextEditingController();
    _directionController = TextEditingController();
    _detailsController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _priceController.dispose();
    _addressController.dispose();
    _streetWidthController.dispose();
    _directionController.dispose();
    _detailsController.dispose();
  }

  bool _checkBoxValue = false;

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
          'إضافة إعلان',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [InkWell(onTap:(){
          Navigator.pushNamed(context, notificationsRoute);
        },child: Image.asset('images/notification_icon.png'))],      ),
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
              ),
              SizedBox(
                height: 12.h,
              ),
              contactTextField(
                hint: 'عنوان الشارع',
                controller: _addressController,
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: contactTextField(
                      hint: 'عرض الشارع',
                      controller: _streetWidthController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Expanded(
                    child: contactTextField(
                      hint: 'الواجهة',
                      controller: _directionController,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 41.h,
                    width: 113.w,
                    child: languagesButton(
                        title: 'سكني',
                        function: () {},
                        color: Color(0xFF1F8716)),
                  ),
                  SizedBox(
                    height: 41.h,
                    width: 113.w,
                    child: languagesButton(
                        title: 'تجاري',
                        function: () {},
                        color: Color(0xFF06A1CB)),
                  ),
                  SizedBox(
                    height: 41.h,
                    width: 113.w,
                    child: languagesButton(
                        title: 'الكل',
                        function: () {},
                        color: Color(0xFF007C9D)),
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
                      child: defaultCheckBox(title: 'إظهار رقم الهاتف'),
                    ),
                    Expanded(
                      child: defaultCheckBox(title: 'السماح بالتعليقات'),
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
                      child: defaultCheckBox(title: 'مالك العقار'),
                    ),
                    Expanded(
                      child: defaultCheckBox(title: 'مفوض للعقار'),
                    ),
                  ],
                ),
              ),
              defaultCheckBox(title: 'الإطلاع على سياسة الإستخدام'),
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                  width: 354.w,
                  height: 51.h,
                  child: languagesButton(
                    title: 'نشر الإعلان',
                    function: () {},
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
