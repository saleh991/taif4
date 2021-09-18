import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/estate_model.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/cubit.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/states.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/cubit.dart';
import 'package:taif/models/user_data_model.dart' as us;
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/states.dart';
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
    _causeController=TextEditingController();
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
    return BlocProvider(
      create:
          (context) => LocationsCubit()..getUserData(),
      child: BlocConsumer<LocationsCubit,LocationsState>(
        listener: (context, state) {},
        builder: (context, state) {
          us.UserDataModel user=LocationsCubit.get(context).userDataModel;
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
              actions: [Image.asset('images/notification_icon.png')],
            ),
            body: BlocProvider(
              create: (context) => EstatesCubit()..getOnlyEstate(estateId: widget.estateData.id!)..getUserData(),
              child: BlocConsumer<EstatesCubit, EstatesState>(
                listener: (context, state) {
                  if (state is CreateNewChatSuccessState) {
                    Navigator.pushNamed(context, chatsRoute);
                    print('here');
                  }
                },
                builder: (context, state) {
                  var estateCubit = EstatesCubit.get(context).estateOnlyModel;
                  var userCubit = EstatesCubit.get(context).userDataModel;
                  var cubitG = EstatesCubit.get(context);
                  if (state is GetCommentSuccessState || state is EstatesSuccessState) {
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
                            items: estateCubit.data!.images != null
                                ? estateCubit.data!.images!.map((id) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                      EdgeInsets.symmetric(horizontal: 5.0),
                                      // decoration: BoxDecoration(color: Colors.amber),
                                      child: Image.network(
                                        'https://opencart3.const-tech.biz/tf/storage/app/${id.path}',
                                        fit: BoxFit.cover,
                                      ));
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
                                      child: Image.network(
                                        '$id',
                                        fit: BoxFit.cover,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress
                                                  .expectedTotalBytes !=
                                                  null
                                                  ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        },
                                      ));
                                },
                              );
                            }).toList(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: estateCubit.data!.images != null
                                ? estateCubit.data!.images!
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
                                '${estateCubit.data!.title}',
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
                              '${estateCubit.data!.area} م',
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 21.sp,
                                color: const Color(0xff003e4f),
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          if (estateCubit.data!.side != null)
                            listTileItem(
                              Image.asset('images/direction.png'),
                              'الواجهة ',
                              Text(
                                '${estateCubit.data!.side!.name}',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 21.sp,
                                  color: const Color(0xff003e4f),
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          listTileItem(
                            Image.asset('images/road.png'),
                            'عرض الشارع ',
                            Text(
                              '١٥ متر',
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 21.sp,
                                color: const Color(0xff003e4f),
                              ),
                              textAlign: TextAlign.right,
                            ),
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
                                      '${estateCubit.data!.description}',
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
                                            user_id: user.data!.id.toString()
                                        );
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
                                    child: Image.asset('images/flag.png'),
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
                                  child: Image.asset('images/heart.png'),
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
                                'https://opencart3.const-tech.biz/tf/storage/app/${widget.estateData.user!.image == null ? 'users/D1T_miAWwAE6KhM.jpg-4-1629048410.jpg':widget.estateData.user!.image },'),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            '${estateCubit.data!.user!.name}',
                            style: TextStyle(
                              fontFamily: fontName,
                              fontSize: 19,
                              color: const Color(0xff399432),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 34.h,
                                width: 154.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      width: 2.0, color: const Color(0xff06a1cb)),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    EstatesCubit.get(context)
                                        .createChat(subjectId: estateCubit.data!.id!);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'محادثة',
                                        style: TextStyle(
                                          fontFamily: fontName,
                                          fontSize: 15,
                                          color: const Color(0xff007c9d),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Image.asset('images/chat2.png')
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Container(
                                height: 34.h,
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'اتصل',
                                        style: TextStyle(
                                          fontFamily: fontName,
                                          fontSize: 15,
                                          color: const Color(0xff007c9d),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Image.asset('images/call2.png')
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          if (estateCubit.data!.commentsEnabled == 1)
                            ListTile(
                              leading: Icon(
                                Icons.chat,
                                color: Color(0xFF06A1CB),
                              ),
                              title: Text(
                                'تعليق',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 21,
                                  color: const Color(0xff003e4f),
                                ),
                              ),
                            ),
                          if (estateCubit.data!.commentsEnabled == 1)
                            SizedBox(
                              height: 5.h,
                            ),
                          if (estateCubit.data!.commentsEnabled == 1)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: contactTextField(
                                  hint: '', controller: _commentController, line: 2),
                            ),
                          if (estateCubit.data!.commentsEnabled == 1)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child:
                                  defaultButton(function: () {
                                    cubitG.addComment(content: _commentController.text, estateId: widget.estateData.id!);
                                  }, title: 'إضافة')),
                            ),
                          if (estateCubit.data!.commentsEnabled == 1)
                            listTileItem(
                                Image.asset('images/chat2.png'),
                                'التعليقات',
                                Text(
                                  '${estateCubit.data!.comments!.length}',
                                  style: TextStyle(
                                    fontFamily: 'JF Flat',
                                    fontSize: 21.sp,
                                    color: const Color(0xff1f8716),
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          if (estateCubit.data!.comments!.length != 0)
                            BlocProvider(
                              create: (context)=>EstatesCubit()..getCommentEstate(estateId: estateCubit.data!.id!),
                              child: BlocConsumer<EstatesCubit,EstatesState>(
                                listener: (context,state){},
                                builder: (context,state){
                                  var cubit = EstatesCubit.get(context).estateCommentModel;
                                  // print('cubit.data!.length ${cubit.data!.length}');
                                  if(state is GetCommentSuccessState && cubit.data!=null){
                                    return ListView.builder(
                                        itemCount: widget.estateData.comments!.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return BlocProvider(
                                            create: (context) => EstatesCubit()
                                              ..getAnyUserData(estateId: widget.estateData.id!,
                                                  id: cubit.data![index].userId!),
                                            child: BlocConsumer<EstatesCubit, EstatesState>(
                                              listener: (context, state) {
                                                if (state is CreateNewChatSuccessState) {
                                                  Navigator.pushNamed(context, chatsRoute);
                                                  print('here');
                                                }
                                              },
                                              builder: (context, state) {
                                                var userCubit =
                                                    EstatesCubit.get(context).userDataComment;
                                                if(state is GetCommentSuccessState){
                                                  return Container(
                                                    color: Colors.white,
                                                    margin: EdgeInsets.only(top: 10.h),
                                                    child: ListTile(
                                                      leading: CircleAvatar(
                                                        maxRadius: 25,
                                                        backgroundImage: NetworkImage(
                                                          'https://opencart3.const-tech.biz/tf/storage/app/${userCubit.data!.image == null ? 'users/D1T_miAWwAE6KhM.jpg-4-1629048410.jpg':userCubit.data!.image}',
                                                        ),
                                                      ),
                                                      title: Text(
                                                        '${userCubit.data!.name}',
                                                        style: TextStyle(
                                                          fontFamily: 'JF Flat',
                                                          fontSize: 21.sp,
                                                          color: const Color(0xff5d9b58),
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                        '${cubit.data![index].content}',
                                                        style: TextStyle(
                                                          fontFamily: 'JF Flat',
                                                          fontSize: 19.sp,
                                                          color: const Color(0xff6a768b),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }else{
                                                  return Center(
                                                    child: SizedBox(),
                                                  );
                                                }

                                              },
                                            ),
                                          );
                                        });
                                  }else{
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                },

                              ),
                            ),

                          // ListView.builder(
                          //     physics: NeverScrollableScrollPhysics(),
                          //     itemCount: 1,
                          //     shrinkWrap: true,
                          //     itemBuilder: (context, index) {
                          //       return BlocProvider(
                          //         create: (context) => EstatesCubit()
                          //           ..getAnyUserData(
                          //               id: widget.estateData.comments![index].userId!),
                          //         child: BlocConsumer<EstatesCubit, EstatesState>(
                          //           listener: (context, state) {},
                          //           builder: (context, state) {
                          //             var cubit = EstatesCubit.get(context);
                          //             if(cubit.commentList != []){
                          //               print('comment not null');
                          //               return Container(
                          //                 color: Colors.white,
                          //                 margin: EdgeInsets.only(top: 10.h),
                          //                 child: ListTile(
                          //                   leading: CircleAvatar(
                          //                     maxRadius: 25,
                          //                     backgroundImage: NetworkImage(
                          //                         'https://opencart3.const-tech.biz/tf/storage/app/${cubit.commentList[index].image}'),
                          //                   ),
                          //                   title: Text(
                          //                     '${cubit.commentList[index].name}',
                          //                     style: TextStyle(
                          //                       fontFamily: 'JF Flat',
                          //                       fontSize: 21.sp,
                          //                       color: const Color(0xff5d9b58),
                          //                     ),
                          //                   ),
                          //                   subtitle: Text(
                          //                     '${cubit.commentList[index].comment}',
                          //                     style: TextStyle(
                          //                       fontFamily: 'JF Flat',
                          //                       fontSize: 19.sp,
                          //                       color: const Color(0xff6a768b),
                          //                     ),
                          //                   ),
                          //                 ),
                          //               );
                          //
                          //             }else{
                          //               return Center(
                          //                 child: CircularProgressIndicator(),
                          //               );
                          //             }
                          //
                          //           },
                          //         ),
                          //       );
                          //     }),
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
                          if (userCubit.data!.currentSub == null)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: defaultButton(
                                      function: () {
                                        Navigator.pushNamed(context, membershipRoute);
                                      },
                                      title: 'اشترك الآن')),
                            ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          );
        },

      ),
    );

  }
}
