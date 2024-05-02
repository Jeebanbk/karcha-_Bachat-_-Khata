import 'package:flutter/material.dart';
import 'package:incomerecordapp/colors.dart';

class Amountwidget extends StatelessWidget {
  String title;
  int amount;
  Color bgcolor;
  Amountwidget(
      {super.key,
      required this.amount,
      required this.title,
      required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
          color: bgcolor, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              title,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          Text(
            amount.toString(),
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}
