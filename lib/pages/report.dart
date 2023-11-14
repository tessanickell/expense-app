import 'package:expense_app/components/dashboard_circular_progress_indicator.dart';
import 'package:expense_app/models/category.dart';
import 'package:expense_app/models/expense.dart';
import 'package:expense_app/store/expense_store.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Report extends StatefulWidget {
  final Category category;

  const Report({super.key, required this.category});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  List<Expense> getAllExpensesOfCategory(
      String categoryTitle, List<Expense> expenses) {
    return expenses
        .where((expense) => expense.category == categoryTitle)
        .toList();
  }

  double getExpenseOfCategorySum(List<Expense> expenses) {
    double sum = 0;
    for (int i = 0; i < expenses.length; i++) {
      sum += expenses[i].amount;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    final expenses = Provider.of<ExpenseStore>(context, listen: true).expenses;
    final expensesOfCategory =
        getAllExpensesOfCategory(widget.category.title, expenses);

    final expensePercentage =
        getExpenseOfCategorySum(expensesOfCategory) / widget.category.budget;

    final remainingBudget = getExpenseOfCategorySum(expensesOfCategory);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff9FA67C),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 200,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  FluentIcons.chevron_left_20_filled,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Text(
                "Back",
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          )),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Report",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
            DashboardCircularProgressIndicator(
              completedProgress: expensePercentage,
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.only(top: 55.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: const Color(0xffD6DEB9),
                      child: FaIcon(
                        widget.category.icon,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$${remainingBudget.toStringAsFixed(2)}\n Remaining",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              )),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19.0, vertical: 33),
                      child: Text(widget.category.title,
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                    (expensesOfCategory.isNotEmpty)
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, bottom: 40),
                            child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const Divider(
                                      color: Color(0xffECECEC),
                                      height: 2,
                                      thickness: 1.5,
                                    ),
                                shrinkWrap: true,
                                itemCount: expensesOfCategory.length,
                                itemBuilder: (BuildContext context, index) {
                                  final expense = expensesOfCategory[index];
                                  return ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                    title: Text(
                                      expense.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    subtitle: Row(
                                      children: [
                                        const Icon(
                                          FontAwesomeIcons.calendar,
                                          size: 15,
                                          color: Color(0xff7D7777),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                            DateFormat.yMMMMd('en_US')
                                                .format(expense.date),
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(
                                                    color: const Color(
                                                        0xff7D7777)))
                                      ],
                                    ),
                                    trailing: Text(
                                        "-\$${expense.amount.toStringAsFixed(2)}",
                                        style: const TextStyle(
                                            color: Color(0xffFFD64E))),
                                  );
                                }),
                          )
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 200),
                              Text(
                                "No current expenses in this category",
                                style: TextStyle(
                                  color: Color(0xff7D7777),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
