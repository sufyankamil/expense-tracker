import 'package:expense_tracker/common/color_extension.dart';
import 'package:expense_tracker/view/signUp/sign_up_view.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/primary_button.dart';
import '../../common_widgets/secondary_button.dart';

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
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/app_logo.png",
                width: size.width * 0.5,
                fit: BoxFit.contain,
              ),
              const Spacer(),
              // Google Login Button
              GestureDetector(
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
                      Image.asset("assets/img/google.png",width: 18, height: 20, color: TColor.gray,),
                      Text(
                        "Continue with Google",
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
              ),
              // FB Login Button
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage("assets/img/fb_btn.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Image.asset("assets/img/fb.png",width: 18, height: 20,),
                      Text(
                        "Continue with Facebook",
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
              // Apple Login Button
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage("assets/img/apple_btn.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Image.asset("assets/img/apple.png",width: 18, height: 20,),
                      Text(
                        "Continue with Apple",
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
              Padding(
                padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                child: Text(
                  "or",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: TColor.gray60,
                  ),
                ),
              ),
              PrimaryButton(
                title: "Sign up with Email",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpView(),
                    ),
                  );
                },
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              SecondaryButton(
                title: "Don't have an account? Sign Up",
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
                'By continuing, you agree to our Terms of Service and Privacy Policy',
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
