import 'package:church__vest/app/components/animations/fade_in_animation.dart';
import 'package:church__vest/app/components/custom_icon_button.dart';
import 'package:church__vest/app/components/custom_text_button.dart';
import 'package:church__vest/app/constants/colors.dart';
import 'package:church__vest/app/constants/text_styles.dart';
import 'package:church__vest/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:church__vest/app/modules/welcome_back_to_church/views/welcome_back_to_church.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingMobilePortrait extends StatelessWidget {
  OnboardingMobilePortrait({Key? key}) : super(key: key);

  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              PageView.builder(
                physics: const ClampingScrollPhysics(),
                onPageChanged: (index) {
                  controller.slideIndex.value = index;
                },
                controller: controller.pageController,
                itemCount: controller.onboardingList.length,
                itemBuilder: (context, index) => Stack(
                  children: [
                    Image.asset(
                      controller.onboardingList[index].image,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black87,
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 60.0,
                        right: 60.0,
                        top: Get.height * .38,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.onboardingList[index].title,
                            style: h2Text.copyWith(
                              color: Colors.white,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),
                          Text(
                            controller.onboardingList[index].description,
                            style: bodyText5.copyWith(
                              color: Colors.white70,
                              height: 1.8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: Get.height * .034,
                  left: 24.0,
                  right: 24.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 3; i++)
                          i == controller.slideIndex.value
                              ? onboardingDots(isCurrentPage: true)
                              : onboardingDots(isCurrentPage: false),
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    controller.slideIndex.value == 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              FadeIn(
                                delay: const Duration(milliseconds: 200),
                                duration: const Duration(milliseconds: 400),
                                child: Hero(
                                  tag: 'onboarding_icon_arrow_right',
                                  child: CustomIconButton(
                                    onPressed: () {
                                      controller.pageController.animateToPage(1,
                                          duration:
                                              const Duration(milliseconds: 600),
                                          curve: Curves.easeInOutCubic);
                                    },
                                  ),
                                ),
                              )
                            ],
                          )
                        : controller.slideIndex.value == 1
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FadeIn(
                                    delay: const Duration(milliseconds: 200),
                                    duration: const Duration(milliseconds: 400),
                                    child: CustomIconButton(
                                      icon: 'assets/svgs/arrow-left.svg',
                                      onPressed: () {
                                        controller.pageController.animateToPage(
                                            0,
                                            duration: const Duration(
                                                milliseconds: 600),
                                            curve: Curves.easeInOutCubic);
                                      },
                                    ),
                                  ),
                                  FadeIn(
                                    delay: const Duration(milliseconds: 200),
                                    duration: const Duration(milliseconds: 400),
                                    child: Hero(
                                      tag: 'onboarding_icon_arrow_right',
                                      child: CustomIconButton(
                                        onPressed: () {
                                          controller.pageController
                                              .animateToPage(2,
                                                  duration: const Duration(
                                                      milliseconds: 600),
                                                  curve: Curves.easeInOutCubic);
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : FadeIn(
                                delay: const Duration(milliseconds: 200),
                                duration: const Duration(milliseconds: 400),
                                child: Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    CustomTextButton(
                                      buttonText: 'Connect My Church',
                                      onPressed: () {
                                        Get.to(
                                          () => const WelcomeBackToChurch(),
                                          transition: Transition.cupertino,
                                        );
                                      },
                                      icon: 'assets/svgs/arrow-right.svg',
                                    ),
                                  ],
                                ),
                              ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onboardingDots({required bool isCurrentPage}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: accentColor, width: 1),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            color: isCurrentPage ? accentColor : Colors.transparent,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
