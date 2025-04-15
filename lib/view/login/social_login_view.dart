import 'package:expense_tracker/common/color_extension.dart';
import 'package:expense_tracker/common/constants.dart';
import 'package:expense_tracker/common_widgets/animation.dart';
import 'package:expense_tracker/view/signUp/sign_up_view.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/primary_button.dart';
import '../../common_widgets/secondary_button.dart';

import 'dart:io' show Platform;

class SocialLoginView extends StatefulWidget {
  const SocialLoginView({super.key});

  @override
  State<SocialLoginView> createState() => _SocialLoginViewState();
}

class _SocialLoginViewState extends State<SocialLoginView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: TColor.gray,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppConstants.logoImage,
                width: size.width * 0.5,
                fit: BoxFit.contain,
              ),
              const Spacer(),
              Expanded(child: RepaintBoundary(child: const AnimationView())),
              Platform.isAndroid
                  ? GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          image: AssetImage("assets/img/google_btn.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        spacing: 10,
                        children: [
                          Image.asset(
                            AppConstants.googleImg,
                            width: 18,
                            height: 20,
                            color: TColor.gray,
                          ),
                          Text(
                            AppConstants.googleText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: TColor.gray,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  : const SizedBox.shrink(),
              // FB Login Button
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage(AppConstants.fbBtnImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Image.asset(AppConstants.fbImg, width: 18, height: 20),
                      Text(
                        AppConstants.fbText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: TColor.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Platform.isIOS
                  ? GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          image: AssetImage(AppConstants.appleBtnImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        spacing: 10,
                        children: [
                          Image.asset(
                            AppConstants.appleImg,
                            width: 18,
                            height: 20,
                          ),
                          Text(
                            AppConstants.appleText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: TColor.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 18.0),
                child: Text(
                  AppConstants.or,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: TColor.gray60,
                  ),
                ),
              ),
              PrimaryButton(
                title: AppConstants.emailText,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpView()),
                  );
                },
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              Text(
                AppConstants.noAccount,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: TColor.gray60,
                ),
              ),
              SecondaryButton(
                title: AppConstants.signUp,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpView()),
                  );
                },
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              Text(
                AppConstants.termsAndConditions,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: TColor.gray60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
