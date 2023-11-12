import 'package:expense_app/models/category.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CategoryStore extends ChangeNotifier {
  List<Category> categories = [
    Category(100.00, "Gym Membership",
        const Icon(FluentIcons.access_time_20_filled)),
    Category(500.00, "Food", const Icon(FluentIcons.access_time_20_filled)),
    Category(300.00, "Clothes", const Icon(FluentIcons.access_time_20_filled)),
  ];

  void addCategory(Category category) {
    categories.add(category);
    notifyListeners();
  }
}
