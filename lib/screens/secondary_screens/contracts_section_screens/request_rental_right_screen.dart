import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/lease_model.dart';
import 'package:taif/screens/secondary_screens/contracts_section_screens/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/contracts_section_screens/cubit/state.dart';

class RequestRentalRightScreen extends StatefulWidget {
  final LeaseModel leaseModel;
  final int index;

  RequestRentalRightScreen({
    required this.leaseModel,
    required this.index,
  });

  @override
  _RequestRentalRightScreenState createState() =>
      _RequestRentalRightScreenState();
}

class _RequestRentalRightScreenState extends State<RequestRentalRightScreen> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
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
          'طلب حق الإيجار',
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
        child: Column(
          children: [
            Container(
              height: 327.h,
              width: ScreenUtil().screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('images/img2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 55),
              child: Column(
                children: [
                  Container(
                    height: 43.h,
                    width: 367.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xffffffff),
                      border: Border.all(
                        width: 1.0,
                        color: const Color(0xffd5ddeb),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8.w,
                        ),
                        Image.asset(
                          'images/lease_red.png',
                          height: 26.h,
                          width: 26.w,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          '${widget.leaseModel.data![widget.index].name}',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 15.sp,
                            color: const Color(0xff3a3a3a),
                          ),
                          textAlign: TextAlign.right,
                        ),
                        Spacer(),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontFamily: 'JF Flat',
                              fontSize: 17.sp,
                              color: const Color(0xff1f8716),
                            ),
                            children: [
                              TextSpan(
                                text:
                                    '${widget.leaseModel.data![widget.index].price}',
                                style: TextStyle(
                                  color: const Color(0xfffd6164),
                                ),
                              ),
                              TextSpan(
                                text: '   ',
                                style: TextStyle(
                                  color: const Color(0xfffd6164),
                                ),
                              ),
                              TextSpan(
                                text: 'ريال',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  contactTextField(hint: 'الإسم', controller: _nameController),
                  SizedBox(
                    height: 15.h,
                  ),
                  contactTextField(
                      hint: 'الهاتف',
                      controller: _phoneController,
                      keyboardType: TextInputType.number),
                  Container(
                    height: 81.h,
                    width: 367.w,
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: const Color(0xff1e8aa8),
                    ),
                    child: Center(
                      child: Text(
                        'بعد تعبئة النموذج وأرسالة سيتم \nالتواصل معكم مباشرة',
                        style: TextStyle(
                          fontFamily: 'JF Flat',
                          fontSize: 17.sp,
                          color: const Color(0xffffffff),
                          letterSpacing: -0.34,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  BlocProvider(
                    create: (context) => RequestLeaseCubit(),
                    child: BlocConsumer<RequestLeaseCubit, RequestLeaseState>(
                      listener: (context, state) {
                        if (state is RequestLeaseSuccessState) {
                          Fluttertoast.showToast(
                            msg: 'تم ارسال الطلب بنجاح',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.greenAccent,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          Navigator.pushReplacementNamed(
                              context, addedSuccefullyRoute);
                        }
                      },
                      builder: (context, state) {
                        var cubit = RequestLeaseCubit.get(context);
                        return SizedBox(
                          width: 354.w,
                          height: 51.h,
                          child: languagesButton(
                            title: 'اطلب الان',
                            function: () {
                              if (checkTextField()) {
                                cubit.requestLease(
                                  name: _nameController.text,
                                  phone: _phoneController.text,
                                  leaseContractId: widget.leaseModel.data![widget.index].id ?? 0,
                                );
                              } else {
                                Fluttertoast.showToast(
                                  msg: 'الرجاء اكمال البيانات المطلوبة',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              }
                            },
                            color: Color(0xFF1F8716),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool checkTextField() {
    return _nameController.text.isNotEmpty && _phoneController.text.isNotEmpty;
  }
}
