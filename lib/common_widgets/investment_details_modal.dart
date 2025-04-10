import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class InvestmentDetailsModal extends StatefulWidget {
  final String amount;
  final bool isProfit;

  const InvestmentDetailsModal({super.key, required this.amount, required this.isProfit});

  @override
  _InvestmentDetailsModalState createState() => _InvestmentDetailsModalState();
}

class _InvestmentDetailsModalState extends State<InvestmentDetailsModal> {
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
            BoxShadow(
              color: TColor.gray,
              blurRadius: 10,
              spreadRadius: 0.5,
            ),
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
                      "Investment Details",
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
                    style: TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,  // Align left by default
                      children: [
                        Text(
                          currentAmount,
                          style: TextStyle(
                            color: TColor.primary,
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
                              currentIsProfit ? Icons.arrow_upward : Icons.arrow_downward,
                              color: currentIsProfit ? Colors.green : Colors.red,
                              size: 16,
                            ),
                            Text(
                              currentIsProfit ? "+2%" : "-2%",
                              style: TextStyle(
                                color: currentIsProfit ? Colors.green : Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentAmount = "\$2000";
                                currentIsProfit = !currentIsProfit;
                              });
                            },
                            child: Text("Update Data"),
                          ),
                        ),
                      ],
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

void showDetails(BuildContext context, String amount, bool isProfit) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (builder) {
      return InvestmentDetailsModal(amount: amount, isProfit: isProfit);
    },
  );
}
