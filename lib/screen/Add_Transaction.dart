import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incomerecordapp/colors.dart';
import 'package:incomerecordapp/controller/transaction_controller.dart';
import 'package:incomerecordapp/model/transaction.dart';

class AddTransaction extends StatefulWidget {
  AddTransaction({
    super.key,
  });

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _keyform = GlobalKey<FormState>();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController amountcontroller = TextEditingController();
  TextEditingController typecontroller = TextEditingController();
  final TransactionController transactionController =
      Get.find<TransactionController>();
  final List<String> type = ["income", "expenses"];
  @override
  void initState() {
    super.initState();
    // titlecontroller.text = widget.title;
    // datecontroller.text = widget.date.toString();
    // amountcontroller.text = widget.amount.toString();
    // typecontroller.text = widget.type;
  }

  void additem() {
    if (_keyform.currentState!.validate()) {
      Transaction transaction = Transaction(
          title: titlecontroller.text,
          date: datecontroller.text.toString(),
          amount: int.parse(amountcontroller.text),
          type: typecontroller.text);

      transactionController.add(transaction);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ADD Transaction",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: themeColors,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          title: const Text(
            "Add Transaction",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Form(
                key: _keyform,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, right: 6, left: 6),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titlecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ("Please Enter Title");
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Enter Title",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        controller: datecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ("Please Enter Date");
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: "Enter date",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: amountcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ("Please Enter Amount");
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: "Enter Amount",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: typecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ("Please select income or Expenses");
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: "Enter income or Expenses",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(
                          onPressed: () {
                            additem();
                            Get.snackbar("Your Transaction",
                                "is Added Successfuly"); //backgroundColor: transaction.type=="income"?themeColors:Colors.redAccent);
                          },
                          child: const Text(
                            "Add transaction",
                          ))
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
