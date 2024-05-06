import 'package:flutter/material.dart';
import 'package:incomerecordapp/colors.dart';
import 'package:incomerecordapp/model/transaction.dart';

class Single extends StatelessWidget {
  Transaction transaction;
  Single({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          transaction.type == "income" ? Icons.add : Icons.minimize,
          color: transaction.type == "income" ? themeColors : Colors.redAccent,
        ),
        title: Text(
          transaction.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Text(
          transaction.date,
          style: const TextStyle(fontSize: 15),
        ),
        trailing: Text(
          transaction.amount.toString(),
          style: TextStyle(
              fontSize: 20,
              color: transaction.type == "income"
                  ? themeColors
                  : Colors.redAccent),
        ),
      ),
    );
  }
}
