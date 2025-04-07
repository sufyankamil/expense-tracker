import 'package:expense_tracker/common/color_extension.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/primary_button.dart';
import '../../common_widgets/secondary_button.dart';
import 'login_view.dart';

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
                PrimaryButton(
                  title: "Get Started",
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SocialLoginView(),
                      ),
                    );
                  },
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                SecondaryButton(
                  title: "Don't have an account? Sign Up",
                  onTap: (){
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                      (route) => false,
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
          )),
    );
  }
}
