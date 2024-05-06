import 'package:get/get.dart';
import 'package:incomerecordapp/model/transaction.dart';

class TransactionController extends GetxController {
  List transactions = <Transaction>[].obs;
  RxInt Totalincome = 0.obs;
  RxInt TotalExpenses = 0.obs;
  @override
  void OnInit() {
    calculateTotalExpenes();
    calculateTotalIncome();
    super.onInit();
  }

  void add(Transaction transaction) {
    transactions.add(transaction);
    print(transaction.type);
    calculateTotalExpenes();
    calculateTotalIncome();
    update();
  }

  void calculateTotalExpenes() {
    num count = 0;
    for (var transaction in transactions) {
      if (transaction.type == "expenses") {
        count += transaction.amount;
      }
    }
    TotalExpenses.value = count.toInt();
  }

  void calculateTotalIncome() {
    num count = 0;
    for (var transaction in transactions) {
      if (transaction.type == "income") {
        count += transaction.amount;
      }
    }
    Totalincome.value = count.toInt();
  }
}
