import 'package:get/get.dart';

class History {
  String content;
  double amount;

  History(this.content, this.amount);
}

class ExpenseController extends GetxController {
  var balance = 0.0.obs;
  var income = 0.0.obs;
  var expense = 0.0.obs;
  var historyList = <History>[].obs;

  void addTransaction(String content, double amount) {
    historyList.add(History(content, amount));

    if (amount > 0) {
      income.value += amount;
    } else {
      expense.value += amount.abs();
    }

    balance.value += amount;
  }

  void deleteTransaction(int index) {
    var item = historyList[index];
    if (item.amount > 0) {
      income.value -= item.amount;
    } else {
      expense.value -= item.amount.abs();
    }

    balance.value -= item.amount;
    historyList.removeAt(index);
  }
}
