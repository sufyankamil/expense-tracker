import 'package:expense_tracker/common/constants.dart';
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class InvestmentTips extends StatelessWidget {
  const InvestmentTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            AppConstants.investmentTips,
            style: TextStyle(
              color: TColor.gray80,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            AppConstants.basicInvestmentTypes,
            style: TextStyle(
              color: Color(0xFF4F4F4F),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            AppConstants.investmentDescription1,
            style: TextStyle(
              color: Color(0xFF4F4F4F),
              fontSize: 14,
              fontWeight: FontWeight.w200,
            ),
          ),
          Divider(color: TColor.gray60, thickness: 0.5, endIndent: 20),
          Text(
            AppConstants.investmentStart,
            style: TextStyle(
              color: Color(0xFF4F4F4F),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            AppConstants.investmentDescription2,
            style: TextStyle(
              color: Color(0xFF4F4F4F),
              fontSize: 14,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}
