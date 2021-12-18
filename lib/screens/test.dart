import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:taif/components/components.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text("كل عقارات الطائف"),
              // child: Text('obt1'.tr()),
            ),
            languagesButton(title: 'languages', function: (){
              // Locale local = context.locale;
              // context.setLocale(
              //   context.locale == Locale('en')? Locale('ar'):Locale('en'),
              // );
            }, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
