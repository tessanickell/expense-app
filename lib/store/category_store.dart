import 'package:expense_app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryStore extends ChangeNotifier {
  List<Category> categories = [
    Category(100.00, "Gym Membership", FontAwesomeIcons.dumbbell),
    Category(500.00, "Food", FontAwesomeIcons.pizzaSlice),
    Category(300.00, "Clothes", FontAwesomeIcons.shirt),
  ];

  void addCategory(Category category) {
    categories.add(category);
    notifyListeners();
  }
}
