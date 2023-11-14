import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseStore extends ChangeNotifier {
  List<Expense> expenses = [
    Expense("Starbucks", "Food", 10.0, DateTime(2023, 11, 10)),
    Expense("Zetas", "Food", 36.50, DateTime.now()),
    Expense("Sunglasses", "Clothes", 80.30, DateTime.now())
  ];

  void addExpense(Expense expense) {
    expenses.add(expense);
    notifyListeners();
  }
}
