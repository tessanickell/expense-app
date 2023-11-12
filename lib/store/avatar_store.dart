import 'package:flutter/material.dart';

class AvatarStore extends ChangeNotifier {
  String chosenAvatar = "assets/fem_1.svg";

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
}
