import 'package:expense_app/models/category.dart';
import 'package:expense_app/models/expense.dart';
import 'package:expense_app/store/category_store.dart';
import 'package:expense_app/store/expense_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard({super.key});

  double getSumOfAllCategories(List<Category> categories) {
    double sum = 0.0;

    for (int i = 0; i < categories.length; i++) {
      sum += categories[i].budget;
    }
    return sum;
  }

  double getSumOfAllExpenses(List<Expense> expenses) {
    double sum = 0.0;

    for (int i = 0; i < expenses.length; i++) {
      sum += expenses[i].amount;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    final categories =
        Provider.of<CategoryStore>(context, listen: true).categories;

    final expenses = Provider.of<ExpenseStore>(context, listen: true).expenses;

    double totalSpent = getSumOfAllExpenses(expenses);
    double remainingBudget = (getSumOfAllCategories(categories) - totalSpent);
    double totalBudget = totalSpent + remainingBudget;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xff92997B),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("My Budget",
                style: GoogleFonts.jost(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            Text("\$$totalBudget",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w600)),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 18),
              child: LinearPercentIndicator(
                backgroundColor: const Color(0xffEDEDE4),
                animation: true,
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                animationDuration: 1000,
                lineHeight: 20.0,
                percent: totalSpent / totalBudget,
                progressColor: const Color(0xffFFD64E),
              ),
            ),
            Row(
              children: [
                Container(
                  child: const SizedBox(
                    height: 30,
                    width: 30,
                    child: DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xffFFD64E))),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "\$$totalSpent",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: const Color(0xff212121)),
                      ),
                      TextSpan(
                        text: "\nTotal Spent",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color: const Color(0xff403D3D),
                                letterSpacing: 0.2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 60),
                Container(
                  child: const SizedBox(
                    height: 30,
                    width: 30,
                    child: DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xffEDEDE4))),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "\$$remainingBudget",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: const Color(0xff212121)),
                      ),
                      TextSpan(
                        text: "\nRemaining Budget",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color: const Color(0xff403D3D),
                                letterSpacing: 0.2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
