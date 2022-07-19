import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String? label;
  final double? spendings;
  final double? spendingPercentage;
  ChartBar(this.label, this.spendings, this.spendingPercentage);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 20,
            child: FittedBox(child: Text("₹${spendings?.toStringAsFixed(0)}"))),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    border: Border.all(color: Colors.grey, width: 1.0)),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text("${label}")
      ],
    );
  }
}
