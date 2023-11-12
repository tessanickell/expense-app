import 'package:expense_app/components/budget_card.dart';
import 'package:expense_app/components/new_expense.dart';
import 'package:expense_app/models/category.dart';
import 'package:expense_app/models/expense.dart';
import 'package:expense_app/store/avatar_store.dart';
import 'package:expense_app/store/category_store.dart';
import 'package:expense_app/store/expense_store.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  double totalExpensesWithCategory(
      String categoryTitle, List<Expense> expenses) {
    double sum = 0.0;

    for (int i = 0; i < expenses.length; i++) {
      if (expenses[i].category == categoryTitle) {
        sum += expenses[i].amount;
      }
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    final categories =
        Provider.of<CategoryStore>(context, listen: true).categories;

    final expenses = Provider.of<ExpenseStore>(context, listen: true).expenses;
    final avatar = Provider.of<AvatarStore>(context, listen: true).chosenAvatar;

    return Scaffold(
      backgroundColor: const Color(0xffD2D6C7),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.07,
              vertical: MediaQuery.of(context).size.height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                CircleAvatar(
                  child: SvgPicture.asset(avatar),
                  radius: 30,
                  backgroundColor: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome,",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: const Color(0xff868686)),
                      ),
                      Text(
                        "Tessa!",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.03),
                child: BudgetCard(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.black),
                  ),
                  IconButton(
                    iconSize: 26,
                    onPressed: () => {},
                    icon: const Icon(FluentIcons.add_circle_20_filled),
                  )
                ],
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: ((context, index) {
                  final category = categories[index];
                  return ListTile(
                    dense: true,
                    tileColor: Color(0xffEDEDE4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(category.title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.black)),
                    subtitle: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                "\$${totalExpensesWithCategory(category.title, expenses)} / ",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.black)),
                        TextSpan(
                          text: "\$${category.budget}",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: const Color(0xff868686)),
                        ),
                      ]),
                    ),
                    leading: category.icon,
                    trailing: const Icon(
                      FluentIcons.chevron_circle_right_20_regular,
                      color: Colors.black,
                    ),
                  );
                }),
              ),
              const Spacer(),
              Center(
                child: SizedBox(
                  width: 215,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () => {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return NewExpenseDialog(
                                      categories: categories);
                                })
                          },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0))),
                      child: Text(
                        "Add Expense",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.white),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
