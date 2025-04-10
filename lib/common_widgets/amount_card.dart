import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class AmountCard extends StatelessWidget {
  const AmountCard({
    super.key,
    required this.amount,
    required this.title,
    required this.buttonText1,
    required this.buttonText2,
    required this.onPressed,
  });

  final String amount;
  final String title;
  final String buttonText1;
  final String buttonText2;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
      child: Container(
        alignment: Alignment.center,
        width: 350,
        height: 125,
        decoration: BoxDecoration(
          color: TColor.primary500,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 12.0),
              child: Text(
                textAlign: TextAlign.start,
                title,
                style: TextStyle(color: TColor.white, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                top: 5.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    amount,
                    style: TextStyle(
                      color: TColor.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColor.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      amount == "\$ 0" ? buttonText1 :buttonText2,
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}