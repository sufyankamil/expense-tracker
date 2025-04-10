import 'package:expense_tracker/view/home/home_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widgets/animation.dart';
import '../../common_widgets/common_textfield.dart';
import '../../common_widgets/primary_button.dart';
import '../../common_widgets/secondary_button.dart';
import '../signIn/sign_in_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    void navigateToLogin() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created successfully!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
        (Route<dynamic> route) => false,
      );
    }

    return Scaffold(
      backgroundColor: TColor.gray,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
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
                Expanded(child: RepaintBoundary(child: const AnimationView())),
                CommonTextField(
                  controller: emailController,
                  labelText: "Email Address",
                  hintText: "Enter your email address",
                  isEmail: true,
                  keyboardType: TextInputType.emailAddress,
                  isPassword: false,
                ),
                const SizedBox(height: 10),
                CommonTextField(
                  controller: passwordController,
                  labelText: "Password",
                  hintText: "Enter your password",
                  isEmail: false,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 5,
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          decoration: BoxDecoration(color: TColor.gray70),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 5,
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          decoration: BoxDecoration(color: TColor.gray70),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 5,
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          decoration: BoxDecoration(color: TColor.gray70),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Password must be at least 8 characters long and contain at least \n 1 uppercase letter, 1 lowercase letter, and 1 number.",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: TColor.gray60,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                PrimaryButton(
                  title: "Create Account",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      navigateToLogin();
                    }
                  },
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(),
                Text(
                  'Already have an account?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: TColor.gray60,
                  ),
                ),
                SecondaryButton(
                  title: "Sign In",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInView(),
                      ),
                    );
                  },
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
