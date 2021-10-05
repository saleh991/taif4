import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/screens/secondary_screens/contact_screen/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/contact_screen/cubit/state.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _titleController.dispose();
    _contentController.dispose();
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
         'اتصل بنا',
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

      body: BlocProvider(
        create: (context) => ContactCubit(),
        child: BlocConsumer<ContactCubit, ContactState>(
          listener: (context, state) {
            if (state is ContactSuccessState) {
              print('contact here listener success');
                Fluttertoast.showToast(
                    msg: 'تم ارسال الرسالة بنجاح',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.greenAccent,
                    textColor: Colors.white,
                    fontSize: 16.0);
                _contentController.text = '';
                _nameController.text = '';
                _phoneController.text = '';
                _emailController.text = '';
                _titleController.text = '';

            }
          },
          builder: (context, state) {
            var cubit = ContactCubit.get(context);
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  if(state is ContactLoadingState)
                    LinearProgressIndicator(),

                    SizedBox(
                    height: 26.h,
                  ),
                  Image.asset(
                    'images/contact.png',
                    height: 182.h,
                    width: 308.w,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27.w),
                    child: Column(
                      children: [
                        Container(
                          alignment: AlignmentDirectional.center,
                          height: 82.h,
                          width: 378.w,
                          child: Text(
                            'يمكنم التواصل معنا عبر هذا النموذج او الاتصال بنا مباشرة',
                            style: TextStyle(
                              fontFamily: 'JF Flat',
                              fontSize: 22.sp,
                              color: const Color(0xff007c9d),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              82,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(213, 221, 235, 1),
                                spreadRadius: 5,
                                blurRadius: 6,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 23.h,
                        ),
                        Row(
                          children: [
                            contactItem(
                                title: 'admin@admin.com',
                                img: 'images/email.png'),
                            SizedBox(
                              width: 10.w,
                            ),
                            contactItem(
                                title: '0506499275', img: 'images/phone.png'),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        if(state is ContactLoadingState)
                          LinearProgressIndicator(),
                        if(state is ContactLoadingState)
                          SizedBox(
                            height: 25.h,
                          ),
                        contactTextField(
                          hint: 'الأسم',
                          controller: _nameController,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        contactTextField(
                          hint: 'رقم  الجوال',
                          controller: _phoneController,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        contactTextField(
                          hint: 'البريد الالكتروني',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        contactTextField(
                          hint: 'العنوان',
                          controller: _titleController,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        contactTextField(
                          hint: 'المحتوى',
                          controller: _contentController,
                          line: 5,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 51.h,
                          child: languagesButton(
                            function: () {
                              if (checkData()) {
                                cubit.contact(
                                  subject: _titleController.text,
                                  email: _emailController.text,
                                  mobile: _phoneController.text,
                                  name: _nameController.text,
                                  message: _contentController.text,
                                );
                              }else{
                                Fluttertoast.showToast(
                                    msg: 'جميع البيانات مطلوبة',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.redAccent,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                            title: 'إرسال',
                            color: Color.fromRGBO(31, 135, 22, 1),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
  bool checkData(){
    return _phoneController.text.isNotEmpty && _contentController.text.isNotEmpty && _emailController.text.isNotEmpty && _nameController.text.isNotEmpty&& _titleController.text.isNotEmpty;
  }
}
