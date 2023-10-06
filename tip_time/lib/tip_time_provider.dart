import 'package:flutter/material.dart';

class TipTimeProvider extends ChangeNotifier {

  int? currentSelectedRadio;
  bool sValue = false;
  double tipAmount = 0.0;
  double totalAmount = 0.0;

  void updateTotalAmount(value) {
    totalAmount = double.parse(value);
    notifyListeners();
  }

  void updateRadio(value) {
    currentSelectedRadio = value;
    notifyListeners();
  }

  void updateSwitch(bool value) {
    if (value == true)
      sValue = true;
    else
      sValue = false;
    notifyListeners();
  }

  void calculate() {
    if (currentSelectedRadio == 0)
      tipAmount = totalAmount * 0.2;
    else if (currentSelectedRadio == 1)
      tipAmount = totalAmount * 0.18;
    else if (currentSelectedRadio == 2)
      tipAmount = totalAmount * 0.15;
    else
      tipAmount = 0.0;

    if (sValue == true) {
      tipAmount = tipAmount.ceilToDouble();
    }

    
    notifyListeners();
  }

}
