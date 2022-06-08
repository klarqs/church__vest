import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/onboarding/views/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Church Vest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingMobilePortrait(),
    );
  }
}
