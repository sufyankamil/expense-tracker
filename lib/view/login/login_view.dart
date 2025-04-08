import 'package:expense_tracker/common_widgets/secondary_button.dart';
import 'package:expense_tracker/view/login/social_login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/color_extension.dart';
import '../../common_widgets/primary_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/img/welcome_screen.png",
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                children: [
                  Image.asset(
                    "assets/img/app_logo.png",
                    width: size.width * 0.5,
                    fit: BoxFit.contain,
                  ),
                  const Spacer(),
                  Text(
                    "Welcome to Expense Tracker",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: TColor.white,
                    ),
                  ),
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
                    title: "Already have an account? Sign In",
                    onTap: (){
                    },
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


