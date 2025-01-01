import 'package:currency_converter/controllers/expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:auto_size_text/auto_size_text.dart';


class SecondPage extends StatelessWidget {
  SecondPage({super.key});
  final ExpenseController controller = Get.put(ExpenseController());

  final TextEditingController contentController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your Balance",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Obx(() => Text(
                      "Rs.${controller.balance.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w600),
                    )),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text("Income",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Obx(() => Text(
                              "+ Rs.${controller.income.toStringAsFixed(2)}",
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.lightGreen),
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Expense",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Obx(() => Text(
                              "- Rs.${controller.expense.toStringAsFixed(2)}",
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.red),
                            )),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16),
                const Text("History",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                const Divider(color: Colors.grey, thickness: 1),
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.historyList.length,
                    itemBuilder: (context, index) {
                      final item = controller.historyList[index];
                      return Slidable(
                        endActionPane: ActionPane(
                          motion: const BehindMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) =>
                                  controller.deleteTransaction(index),
                              backgroundColor: Colors.red,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border(
                              right: BorderSide(
                                color: item.amount > 0
                                    ? Colors.green
                                    : Colors.red,
                                width: 3.0,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(item.content,
                                  style: TextStyle(fontSize: 16)),
                              Text(
                                "Rs.${item.amount.toStringAsFixed(2)}",
                                style: TextStyle(
                                  color: item.amount > 0
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const Text("New Transactions",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 10),
                const Text("Text"),
                const SizedBox(height: 5,),
                TextField(
                  controller: contentController,
                  decoration: const InputDecoration(
                    hintText: "Enter text",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Amount"),
                const SizedBox(height: 10,),
                const Text("(Include, - for your expense)"),
                const SizedBox(height: 5,),
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Enter amount",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final content = contentController.text;
                    final amount = double.tryParse(amountController.text) ?? 0;
                    if (content.isNotEmpty) {
                      controller.addTransaction(content, amount);
                      contentController.clear();
                      amountController.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text("Add Transaction"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
