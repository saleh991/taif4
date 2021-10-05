import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/screens/secondary_screens/chat_screen/private_chat_screen_subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/estate_model.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/cubit.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/states.dart';
import 'package:taif/screens/primary_screens/membership_screen/membership_screen.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class EstateDetailsScreen extends StatefulWidget {
  final EstateData estateData;

  EstateDetailsScreen(this.estateData);

  @override
  _EstateDetailsScreenState createState() => _EstateDetailsScreenState();
}

class _EstateDetailsScreenState extends State<EstateDetailsScreen> {
  int _current = 0;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  List<String> img = [];

  final CarouselController _controller = CarouselController();
  late TextEditingController _detailsController;
  late TextEditingController _commentController;
  late TextEditingController _causeController;

  @override
  void initState() {
    super.initState();
    _detailsController = TextEditingController();
    _commentController = TextEditingController();
    _causeController= TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _detailsController.dispose();
    _commentController.dispose();
    _causeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('${widget.estateData.comments ?? []}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          '${widget.estateData.price} ريال',
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
      body: BlocProvider(
        create: (context) => EstatesCubit()..getUserData(),
        child: BlocConsumer<EstatesCubit, EstatesState>(
          listener: (context, state) {

          },
          builder: (context, state) {

            var userCubit = EstatesCubit.get(context).userDataModel;

              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          height: 230.h,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                      items: widget.estateData.images != null
                          ? widget.estateData.images!.map((id) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      // decoration: BoxDecoration(color: Colors.amber),
                                      child:   CachedNetworkImage(
                                        fit: BoxFit.fill,

                                        imageUrl: "https://taif-app.com/storage/app/${id.path}",

                                        errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),),
                                      );
                                },
                              );
                            }).toList()
                          : imgList.map((id) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration:
                                          BoxDecoration(color: Colors.amber),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.fill,
                                        placeholder: (context, url) => CircularProgressIndicator(),
                                        imageUrl: "$id",

                                        errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),),
                                     );
                                },
                              );
                            }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.estateData.images != null
                          ? widget.estateData.images!
                              .asMap()
                              .entries
                              .map((entry) {
                              return GestureDetector(
                                onTap: () =>
                                    _controller.animateToPage(entry.key),
                                child: Container(
                                  width: 12.0.w,
                                  height: 12.0.h,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Color(0xFF1F8716))
                                          .withOpacity(_current == entry.key
                                              ? 0.9
                                              : 0.4)),
                                ),
                              );
                            }).toList()
                          : imgList.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () =>
                                    _controller.animateToPage(entry.key),
                                child: Container(
                                  width: 12.0.w,
                                  height: 12.0.h,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Color(0xFF1F8716))
                                          .withOpacity(_current == entry.key
                                              ? 0.9
                                              : 0.4)),
                                ),
                              );
                            }).toList(),
                    ),
                    Container(
                      width: ScreenUtil().screenWidth,
                      height: 43.h,
                      decoration: BoxDecoration(
                        color: const Color(0xff06a1cb),
                      ),
                      child: Center(
                        child: Text(
                          '${widget.estateData.title}',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 23,
                            color: const Color(0xffffffff),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    listTileItem(
                      Image.asset('images/area.png'),
                      'المساحة ',
                      Text(
                        '${widget.estateData.area} م',
                        style: TextStyle(
                          fontFamily: 'JF Flat',
                          fontSize: 21.sp,
                          color: const Color(0xff003e4f),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    if (widget.estateData.side != null)
                      listTileItem(
                        Image.asset('images/direction.png'),
                        'الواجهة ',
                        Text(
                          '${widget.estateData.side!.name}',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 21.sp,
                            color: const Color(0xff003e4f),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    SizedBox(
                      height: 10.h,
                    ),
                    listTileItem(
                      Image.asset('images/road.png'),
                      'عرض الشارع ',
                      Text(
                        '${widget.estateData.streetWide} م ',
                        style: TextStyle(
                          fontFamily: 'JF Flat',
                          fontSize: 21.sp,
                          color: const Color(0xff003e4f),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(

                          decoration:widget.estateData.authOption=='staying'? BoxDecoration(
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
                        Container(
                          decoration:widget.estateData.authOption=='trading'? BoxDecoration(
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
                        Container(
                          decoration:widget.estateData.authOption=='all'?  BoxDecoration(
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


                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        //height: 320.h,
                        width: 389.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(211, 203, 203, 1),
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 15.h),
                          child: Column(
                            children: [
                              Text(
                                '${widget.estateData.description}',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 15.sp,
                                  color: const Color(0xff010d10),
                                  height: 1.8.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.WARNING,
                                animType: AnimType.SCALE,

                                body: Padding(
                                  padding:  EdgeInsets.all(12.0.w),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [

                                          Text(
                                            'سبب البلاغ',
                                            style: TextStyle(
                                              fontFamily: 'JF Flat',
                                              fontSize: 16.sp,
                                              color: const Color(0xff003e4f),
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4.h,),
                                      contactTextFieldWithHintColor(
                                          hint: '',
                                          controller: _causeController
                                      ),
                                      SizedBox(height: 12.h,),
                                      Row(
                                        children: [
                                          Text(
                                            'تفاصيل البلاغ',
                                            style: TextStyle(
                                              fontFamily: 'JF Flat',
                                              fontSize: 16.sp,
                                              color: const Color(0xff003e4f),
                                            ),
                                            textAlign: TextAlign.right,
                                          ),


                                        ],
                                      ),
                                      SizedBox(height: 4.h,),
                                      contactTextFieldWithHintColor(
                                          hint: '',
                                          controller: _detailsController
                                      ),
                                    ],
                                  ),
                                ),
                                btnCancelOnPress: () {

                                },
                                btnOkText: 'ابلاغ',
                                btnCancelText: 'الغاء',
                                btnOkOnPress: () {
                                  LocationsCubit()..addReportTourism(report_title:
                                  _causeController.text,
                                    report_content: _detailsController.text,
                                      report_on_class: 'App\\Models\\Estate'

                                  ).then((value) {
                                    Fluttertoast.showToast(
                                        msg: 'تم ارسال البلاغ',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.grey,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  });
                                },
                              )..show();
                            },
                            child: Container(
                              height: 31.h,
                              width: 31.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: const Color(0x5c06a1cb)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: SvgPicture.asset('images/flag.svg',
                                  color: Colors.red,

                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 17.w,
                          ),
                          InkWell(
                            onTap: (){
                              EstatesCubit().addToFavEstate(estateId: widget.estateData.id!,
                                  model: 'estates'
                              );
                              Fluttertoast.showToast(
                                  msg: 'تم الاضافة للمفضلة',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.blue,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            },
                            child: Container(
                              height: 31.h,
                              width: 31.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: const Color(0x5c06a1cb)),
                              ),
                              child: SvgPicture.asset('images/favorite_heart.svg',
                                color: Color(0xFF009fcf),

                              ),
                            ),
                          ),
                          SizedBox(
                            width: 17.w,
                          ),
                          Container(
                            height: 31.h,
                            width: 31.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: const Color(0x5c06a1cb)),
                            ),
                            child: Image.asset('images/share.png'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CircleAvatar(
                      maxRadius: 35,
                      backgroundImage: NetworkImage(
                          'https://taif-app.com/storage/app/${widget.estateData.user!.image}'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      '${widget.estateData.user!.name}',
                      style: TextStyle(
                        fontFamily: fontName,
                        fontSize: 22.sp,
                        color: const Color(0xff399432),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height:20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.estateData.user!.id != AppController.instance.getId())
                        Container(

                          width: 154.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                                width: 2.0, color:  Color(0xff06a1cb)
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PrivateChatSubjectScreen(
                                  subjectId: widget.estateData.id!,
                                  model: 'App\\Models\\Estate',
                                )),
                              );

                            },
                            child: Padding(
                              padding:  EdgeInsets.all(5.0.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'محادثة',
                                    style: TextStyle(
                                      fontFamily: fontName,
                                      fontSize: 18.sp,
                                      color: const Color(0xff007c9d),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Image.asset('images/chat2.png')
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (widget.estateData.showPhone == 1)
                        SizedBox(
                          width: 20.w,
                        ),
                        if (widget.estateData.showPhone == 1)
                        Container(

                          width: 154.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                                width: 2.0, color: const Color(0xff06a1cb)),
                          ),
                          child: InkWell(
                            onTap: (){
                              launch("tel://${userCubit.data!.phone}");
                            },
                            child: Padding(
                              padding:  EdgeInsets.all(5.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'اتصل',
                                    style: TextStyle(
                                      fontFamily: fontName,
                                      fontSize: 18.sp,
                                      color: const Color(0xff007c9d),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Image.asset('images/call2.png')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    if (widget.estateData.commentsEnabled == 1)
                      Padding(
                        padding:  EdgeInsets.all(16.0.h),
                        child: Row(
                          children: [
                           Icon(
                              Icons.chat,
                              color: Color(0xFF06A1CB),
                            ),
                             SizedBox(width: 4.w,),
                             Text(
                              'تعليق',
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 21.sp,
                                color: const Color(0xff003e4f),
                              ),
                            ),
                          ],

                        ),
                      ),
                    if (widget.estateData.commentsEnabled == 1)
                      SizedBox(
                        height: 5.h,
                      ),
                    if (widget.estateData.commentsEnabled == 1)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: contactTextField(
                            hint: '', controller: _commentController, line: 2),
                      ),
                    if (widget.estateData.commentsEnabled == 1)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child:
                                defaultButton(function: () {
                                  if(_commentController.text.length>10)
                                    {
                                      widget.estateData.comments!.add(Comments(
                                        content: _commentController.text,
                                        user: User(
                                            image: userCubit.data!.image,
                                            name: userCubit.data!.name

                                        ),
                                      ));
                                      EstatesCubit().addComment(content: _commentController.text,
                                          estateId: widget.estateData.id!);
                                      _commentController.text='';
                                      setState(() {

                                      });
                                    }
                                  else{
                                    AwesomeDialog(
                                      context: context,
                                      title: 'يجب ان يحتوي التعليق على 10 احرف على الاقل',
                                      btnOkText: 'تم',
                                      btnOkOnPress: (){}

                                    )..show();
                                  }

                                }, title: 'إضافة')),
                      ),
                    if (widget.estateData.commentsEnabled == 1)
                      listTileItem(
                          Image.asset('images/chat2.png'),
                          'التعليقات',
                          Text(
                            '${widget.estateData.comments!.length}',
                            style: TextStyle(
                              fontFamily: 'JF Flat',
                              fontSize: 21.sp,
                              color: const Color(0xff1f8716),
                            ),
                            textAlign: TextAlign.center,
                          )),
                    if (widget.estateData.comments!.length != 0)
                      BlocProvider(
                        create: (context)=>EstatesCubit(),
                        child: BlocConsumer<EstatesCubit,EstatesState>(
                          listener: (context,state){},
                          builder: (context,state){
                              return ListView.builder(
                                  itemCount: widget.estateData.comments!.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return BlocProvider(
                                      create: (context) => EstatesCubit(),
                                      child: BlocConsumer<EstatesCubit, EstatesState>(
                                        listener: (context, state) {
                                          if (state is CreateNewChatSuccessState) {
                                            Navigator.pushNamed(context, chatsRoute);
                                            print('here');
                                          }
                                        },
                                        builder: (context, state) {


                                           return Container(
                                             color: Colors.white,
                                             margin: EdgeInsets.only(top: 10.h),
                                             child: ListTile(
                                               leading: CircleAvatar(
                                                 maxRadius: 25,
                                                 backgroundImage: NetworkImage(
                                                   'https://taif-app.com/storage/app/${widget.estateData.comments![index].user!.image}',
                                                 ),
                                               ),
                                               title: Text(
                                                 '${widget.estateData.comments![index].user!.name}',
                                                 style: TextStyle(
                                                   fontFamily: 'JF Flat',
                                                   fontSize: 21.sp,
                                                   color: const Color(0xff5d9b58),
                                                 ),
                                               ),
                                               subtitle: Text(
                                                 '${widget.estateData.comments![index].content}',
                                                 style: TextStyle(
                                                   fontFamily: 'JF Flat',
                                                   fontSize: 19.sp,
                                                   color: const Color(0xff6a768b),
                                                 ),
                                               ),
                                             ),
                                           );


                                        },
                                      ),
                                    );
                                  });


                            }

                        ),
                      ),


                    if(userCubit.data!=null)
                    if (userCubit.data!.currentSub == null)
                      Container(
                        height: 95.h,
                        width: 389.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          border: Border.all(
                              width: 1.0, color: const Color(0x61f7901e)),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('images/alert.png'),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'أشترك بأحد الباقات واحصل على أضافة مواضيع أكثرومميزات أكثر',
                                style: TextStyle(
                                  fontFamily: fontName,
                                  fontSize: 13.sp,
                                  color: const Color(0xff754dad),
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    if(userCubit.data!=null)
                    if (userCubit.data!.currentSub == null)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: defaultButton(
                                function: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MembershipScreen(sub: 0,)),
                                  );
                                },
                                title: 'اشترك الآن')),
                      ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              );

          },
        ),
      ),
    );
  }
}
