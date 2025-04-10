import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final TextInputType keyboardType;
  final Function(String)? onChanged;


  const CommonTextField({super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.isPassword = false,
    this.isEmail = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: TextStyle(color: Colors.white),
          controller: controller,
          keyboardType: isEmail ? TextInputType.emailAddress : keyboardType,
          obscureText: isPassword,
          obscuringCharacter: "*",
          cursorColor: TColor.primary,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: TColor.gray60,
                width: 1,
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 5),
            labelText: labelText,
            hintText: hintText,
            labelStyle: TextStyle(
              fontSize: 14,
              color: TColor.gray60,
            ),
            hintStyle: TextStyle(
              fontSize: 14,
              color: TColor.gray60,
            ),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: TColor.primary)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: TColor.gray60)),
            errorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            icon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                isEmail ? Icons.email : Icons.lock,
                color: TColor.gray60,
              ),
            ),
          ),
          onChanged: onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter $labelText";
            }
            if (isEmail && !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
              return "Please enter a valid email address";
            }
            if (isPassword && value.length < 6) {
              return "Password must be at least 6 characters";
            }
            return null;
          },
        ),
      ],
    );
  }
}
