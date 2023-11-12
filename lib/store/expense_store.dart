import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseStore extends ChangeNotifier {
  List<Expense> expenses = [
    Expense("Starbucks", "Food", 10.0),
    Expense("Zetas", "Food", 36.50),
    Expense("Sunglasses", "Clothes", 80.30)
  ];

  void addExpense(Expense expense) {
    expenses.add(expense);
    notifyListeners();
  }
}
