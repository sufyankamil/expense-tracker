import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class PlanWidget extends StatefulWidget {
  const PlanWidget({
    super.key,
    this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final IconData? icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  State<PlanWidget> createState() => _PlanWidgetState();
}

class _PlanWidgetState extends State<PlanWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: widget.onTap,
      child: SizedBox(
        height: 180,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(5, (index) {
              final colors = [
                Colors.amber,
                Colors.blue,
                Colors.green,
                Colors.red,
                Colors.purple,
              ];

              final icons = [
                Icons.attach_money,
                Icons.trending_up,
                Icons.savings,
                Icons.pie_chart,
                Icons.bar_chart,
              ];

              return Container(
                width: 150,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                height: 170,
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                      child: Icon(
                        widget.icon ?? icons[index % icons.length],
                        color: TColor.white,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                      child: Text(
                        "${widget.title} ${index + 1}",
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 4.0),
                      child: Text(
                        "${widget.subtitle} ${index + 1}",
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
