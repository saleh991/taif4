import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taif/components/components.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/helper/constants.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xF9FBFF),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 420.h,
            width: ScreenUtil().screenWidth,
            child: PageView(
              controller: _pageController,
              physics: BouncingScrollPhysics(),
              children: [
                outBoardingItem(
                  img: 'images/out1.png',
                  title: "كل عقارات الطائف",
                  subTitle1: "عروض العقارت بيع - شراء",
                  subTitle2: "لدينا كل ماتبحث عنة في مجال العقارات",
                  // title: 'obt1'.tr(),
                  // subTitle1: 'obs11'.tr(),
                  // subTitle2: 'obs12'.tr(),
                ),
                outBoardingItem(
                  img: 'images/out2.png',
                  title: "كل ماتريد معرفتة عن السياحة في الطائف",
                  subTitle1: "كل الأمكان السياحة والمعالم",
                  subTitle2: "المطاعم - المقاهي - الحدائق - المنتزهات",
                  // title: 'obt2'.tr(),
                  // subTitle1: 'obs21'.tr(),
                  // subTitle2: 'obs22'.tr(),
                ),
                outBoardingItem(
                  img: 'images/out3.png',
                  title: "صيانة المنازل - صيانة السيارات - خدمة منزلية",
                  subTitle1: "يمكنك البحث عن الخدمة  بأبسط الطرق",
                  subTitle2: "كهرباء - سباكة - تنظيف - صيانة خدمات منزلية",
                  // title: 'obt3'.tr(),
                  // subTitle1: 'obs31'.tr(),
                  // subTitle2: 'obs32'.tr(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 41.h,
          ),
          SmoothPageIndicator(
            controller: _pageController, // PageController
            count: 3,
            effect: WormEffect(), // your preferred effect
            onDotClicked: (index) {},
          ),
          Spacer(),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 39.w, bottom: 56.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      AppController.instance.finishOutBoarding(true);
                      Navigator.pushReplacementNamed(context, welcomeRoute);
                    },
                    child: Text(
                      "تخطي",
                      // 'out_btn'.tr(),
                      style: TextStyle(
                        fontFamily: 'JF Flat',
                        fontSize: 20,
                        color: const Color(0xff007c9d),
                      ),
                      textAlign: TextAlign.left,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
