import 'package:flutter/material.dart';

class UserStore extends ChangeNotifier {
  String chosenAvatar = "assets/fem_3.svg";
  String firstName = "";
  double budget = 0.0;

  List avatars = [
    'assets/fem_1.svg',
    'assets/fem_2.svg',
    'assets/fem_3.svg',
    'assets/male_1.svg',
    'assets/male_2.svg',
    'assets/male_3.svg',
  ];

  void setAvatar(avatar) {
    chosenAvatar = avatar;
    notifyListeners();
  }

  void setFirstName(newFirstName) {
    firstName = newFirstName;
    notifyListeners();
  }

  void setBudget(newBudget) {
    budget = newBudget;
    notifyListeners();
  }
}
