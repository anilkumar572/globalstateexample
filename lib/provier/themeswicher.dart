import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themeswitch extends ChangeNotifier {
  bool ischecked = true;

  void isChecked({required bool data}) async {
    ischecked = data;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('ischecked', data);
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    ischecked = prefs.getBool('ischecked') ?? true;
    notifyListeners();
  }
}
