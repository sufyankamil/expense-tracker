import 'package:expense_tracker/view/signUp/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/color_extension.dart';
import '../../common_widgets/common_textfield.dart';
import '../../common_widgets/primary_button.dart';
import '../../common_widgets/secondary_button.dart';
import '../login/login_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isChecked = false;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  Future<void> _loadCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('saved_email');
    final savedPassword = prefs.getString('saved_password');
    final remember = prefs.getBool('remember_me') ?? false;

    if (remember && savedEmail != null && savedPassword != null) {
      setState(() {
        emailController.text = savedEmail;
        passwordController.text = savedPassword;
        isChecked = true;
      });
    }
  }

  Future<void> _saveCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    if (isChecked) {
      await prefs.setString('saved_email', emailController.text);
      await prefs.setString('saved_password', passwordController.text);
      await prefs.setBool('remember_me', true);
    } else {
      await prefs.remove('saved_email');
      await prefs.remove('saved_password');
      await prefs.setBool('remember_me', false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: TColor.gray,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/img/app_logo.png",
                  width: size.width * 0.5,
                  fit: BoxFit.contain,
                ),
                const Spacer(),
                CommonTextfield(
                  controller: emailController,
                  labelText: "Email Address",
                  hintText: "Enter your email address",
                  isEmail: true,
                  keyboardType: TextInputType.emailAddress,
                  isPassword: false,
                  onChanged: (value) {
                    setState(() {
                      emailController.text = value;
                    });
                  },
                ),
                CommonTextfield(
                  controller: passwordController,
                  labelText: "Password",
                  hintText: "Enter your password",
                  isEmail: false,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  onChanged: (value) {
                    setState(() {
                      passwordController.text = value;
                    });
                  },
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                          activeColor: isChecked ? TColor.primary : TColor.gray60,
                        ),
                        Text(
                          "Remember me",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: TColor.gray60,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: TColor.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                PrimaryButton(
                  title: "Login",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      await _saveCredentials();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      );
                    }
                  },
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(),
                Text(
                  'Don\'t have an account?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: TColor.gray60,
                  ),
                ),
                SecondaryButton(
                  title: "Sign Up",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpView()),
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