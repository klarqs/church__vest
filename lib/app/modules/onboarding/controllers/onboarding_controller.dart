import 'package:church__vest/app/modules/onboarding/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  late PageController pageController;
  Rx<int> slideIndex = 0.obs;

  List<OnboardingModel> onboardingList = [
    OnboardingModel(
      title: 'Worship With Your Church',
      description: 'Join members of your church and worship together.',
      image: 'assets/pngs/onboarding1.png',
    ),
    OnboardingModel(
      title: 'Stay Connected With The Word',
      description:
          'Listen to new messages everday, livestream your church on the go.',
      image: 'assets/pngs/onboarding2.png',
    ),
    OnboardingModel(
      title: 'Pay Offerings & Tithes Online',
      description:
          'Pay your tithe, offerings and several other contributions from your phone.',
      image: 'assets/pngs/onboarding3.png',
    ),
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }
}
