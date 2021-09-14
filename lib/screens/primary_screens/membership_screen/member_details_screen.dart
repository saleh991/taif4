import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taif/components/components.dart';
import 'package:taif/cubit/cubit.dart';
import 'package:taif/cubit/state.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/package_model.dart';
import 'package:taif/screens/primary_screens/membership_screen/cubit/cubit.dart';
import 'package:taif/screens/primary_screens/membership_screen/cubit/state.dart';

class MemberDetailsScreen extends StatefulWidget {
  final PackageModel packageModel;
  final int id;
  final int subscriptionId;

  MemberDetailsScreen(this.packageModel, this.id,
      {required this.subscriptionId});

  @override
  _MemberDetailsScreenState createState() => _MemberDetailsScreenState();
}

class _MemberDetailsScreenState extends State<MemberDetailsScreen> {
  late TextEditingController _nameController;
  late TextEditingController _idAccountController;
  late TextEditingController _priceController;
  late TextEditingController _dateController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _idAccountController = TextEditingController();
    _priceController = TextEditingController();
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _idAccountController.dispose();
    _priceController.dispose();
    _dateController.dispose();
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
          'أشتراك في الباقة',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, notificationsRoute);
              },
              child: Image.asset('images/notification_icon.png'))
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              SizedBox(
                height: 27.h,
              ),
              membershipItem(
                name: '${widget.packageModel.data![widget.id].name}',
                price: '${widget.packageModel.data![widget.id].cost}',
                ads: '${widget.packageModel.data![widget.id].adsCount}',
                function: () {},
              ),
              SizedBox(
                height: 27.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 15.w),
                    child: membershipText(
                        color: Color(0xff754dad),
                        text: 'مبلغ الاشتراك الاجمالي'),
                  ),
                  membershipText(
                      color: Color(0xffff0008),
                      text: '${widget.packageModel.data![widget.id].cost}'),
                  SizedBox(),
                ],
              ),
              Divider(
                height: 30.h,
                thickness: 1,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  membershipText(
                      color: Color(0xff754dad), text: 'الحسابات البنكية'),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    '( أختر طريقة التحويل )',
                    style: TextStyle(
                      fontFamily: 'JF Flat',
                      fontSize: 12.sp,
                      color: const Color(0xffeb831e),
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              SizedBox(
                height: 26.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Center(
                      child: membershipText(
                          color: Color(0xfffdfdfd), text: 'تحويل بنكي'),
                    ),
                    height: 44.h,
                    width: 158.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: const Color(0xff179bd7),
                    ),
                  ),
                  Image.asset(
                    'images/paypal.png',
                    fit: BoxFit.contain,
                    height: 48.h,
                    width: 168.w,
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 107.h,
                width: 389.w,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'images/rajhi.png',
                      fit: BoxFit.contain,
                      height: 74.h,
                      width: 74.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        membershipText(
                            text: 'مصرف الراجحي', color: Color(0xff0f00a1)),
                        membershipText(
                            text: 'عبدالله خالد الشمري',
                            color: Color(0xff0f00a1)),
                        membershipText(
                            text: '21548754', color: Color(0xff0f00a1)),
                        membershipText(
                            text: 'SA-15542555', color: Color(0xff0f00a1)),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 30,
                thickness: 1,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 15.w, bottom: 12.h),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: membershipText(
                      color: Color(0xfffd0019),
                      text: 'يرجي اكمال نموذج الإيداع بعد التحويل'),
                ),
              ),
              BlocProvider(
                create: (context) => PackagesCubit(),
                child: BlocConsumer<PackagesCubit, PackagesState>(
                  listener: (context, state) {
                    if (state is BankTransactionsSuccessState) {
                      Fluttertoast.showToast(
                          msg: 'تم الارسال',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  builder: (context, state) {
                    var cubit = PackagesCubit.get(context);
                    return Column(
                      children: [
                        contactTextField(
                          hint: 'أسم المحول',
                          controller: _nameController,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        contactTextField(
                          keyboardType: TextInputType.number,
                          hint: 'رقم الحساب',
                          controller: _idAccountController,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        contactTextField(
                          keyboardType: TextInputType.number,
                          hint: 'المبلغ المحول',
                          controller: _priceController,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        contactTextField(
                          hint: 'تاريخ التحويل',
                          controller: _dateController,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        InkWell(
                          onTap: () {
                            cubit.getImage();
                          },
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Container(
                              height: 41.h,
                              width: 179.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  membershipText(
                                      color: Color(0xff754dad),
                                      text: 'أرفق صورة الأيصال'),
                                  Image.asset(
                                    'images/gallery.png',
                                    height: 21.h,
                                    width: 28.w,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: const Color(0xffffffff),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xff179bd7)),
                              ),
                            ),
                          ),
                        ),
                        if (cubit.bankImage != null)
                          Container(
                            height: 140.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(cubit.bankImage!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 33.h,
                        ),
                        SizedBox(
                          height: 62.h,
                          width: 372.w,
                          child: languagesButton(
                            title: 'أرسال',
                            function: () {
                              // cubit.upload();
                              // cubit.test(
                              // subscriptionId: widget.subscriptionId,
                              // name: _nameController.text,
                              // accountNumber: _idAccountController.text,
                              // date: _dateController.text,
                              // amount: _priceController.text,
                              // );
                              // if (checkData()) {
                              //   cubit.bankTransactions(
                              //     subscriptionId: widget.subscriptionId,
                              //     name: _nameController.text,
                              //     accountNumber: _idAccountController.text,
                              //     image: cubit.imageProfile!,
                              //     date: _dateController.text,
                              //     amount: _priceController.text,
                              //   );
                              // } else {
                              //   Fluttertoast.showToast(
                              //       msg: 'جميع البيانات مطلوبة',
                              //       toastLength: Toast.LENGTH_SHORT,
                              //       gravity: ToastGravity.BOTTOM,
                              //       timeInSecForIosWeb: 2,
                              //       backgroundColor: Colors.red,
                              //       textColor: Colors.white,
                              //       fontSize: 16.0);
                              // }
                            },
                            color: Color.fromRGBO(23, 155, 215, 1),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkData() {
    return _nameController.text.isNotEmpty &&
        _dateController.text.isNotEmpty &&
        _idAccountController.text.isNotEmpty &&
        _priceController.text.isNotEmpty;
  }
}
