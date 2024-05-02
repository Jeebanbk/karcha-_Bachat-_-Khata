import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:incomerecordapp/colors.dart';
import 'package:incomerecordapp/componet/amount.dart';
import 'package:incomerecordapp/componet/singleamount.dart';
import 'package:incomerecordapp/controller/transaction_controller.dart';
import 'package:incomerecordapp/model/transaction.dart';
import 'package:incomerecordapp/screen/Add_Transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TransactionController transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Income/Expenses tracker",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent,
          title: const Text(
            "Income / Expenses Tracker",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(6)),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Obx(() {
                  return Amountwidget(
                      amount: transactionController.Totalincome.value,
                      bgcolor: themeColors,
                      title: "Total Income");
                }),
                Obx(() {
                  return Amountwidget(
                      bgcolor: Colors.redAccent,
                      amount: transactionController.TotalExpenses.value,
                      title: "Total Expenses");
                })
              ]),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transaction",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              Obx(() {
                return Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      //physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Single(
                            transaction:
                                transactionController.transactions[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: transactionController.transactions.length),
                );
              })
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddTransaction());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
