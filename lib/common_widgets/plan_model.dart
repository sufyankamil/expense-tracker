import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class PlanModel extends StatefulWidget {
  final String amount;
  final bool isProfit;

  const PlanModel({super.key, required this.amount, required this.isProfit});

  @override
  PlanModelState createState() => PlanModelState();
}

class PlanModelState extends State<PlanModel> {
  late String currentAmount;
  late bool currentIsProfit;

  @override
  void initState() {
    super.initState();
    currentAmount = widget.amount;
    currentIsProfit = widget.isProfit;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          color: TColor.white,
          boxShadow: [
            BoxShadow(color: TColor.gray, blurRadius: 10, spreadRadius: 0.5),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "My Assets",
                      style: TextStyle(
                        color: TColor.gray80,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: TColor.primary),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19.0, top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your total asset portfolio",
                    style: TextStyle(color: Color(0xFFB3B3B3), fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.start, // Align left by default
                      children: [
                        Text(
                          currentAmount,
                          style: TextStyle(
                            color: TColor.gray80,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 10),
                        // Profit/Loss indicator
                        Row(
                          spacing: 5,
                          children: [
                            Icon(
                              currentIsProfit
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              color:
                                  currentIsProfit ? Colors.green : Colors.red,
                              size: 16,
                            ),
                            Text(
                              currentIsProfit ? "+2%" : "-2%",
                              style: TextStyle(
                                color:
                                    currentIsProfit ? Colors.green : Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      "Current Plans",
                      style: TextStyle(
                        color: TColor.gray80,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 207,
                    width: 360,
                    margin: const EdgeInsets.only(left: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      "assets/img/plans01.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        "See all plans",
                        style: TextStyle(
                          color: Color(0XFFFE555D),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0XFFFE555D),
                        size: 20,
                        weight: 20,
                      ),
                    ],
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

void showPlanDetails(BuildContext context, String amount, bool isProfit) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (builder) {
      return PopScope(
        canPop: false,
        child: PlanModel(amount: amount, isProfit: isProfit),
      );
    },
  );
}
