import 'package:flutter/material.dart';

class WaterProvider with ChangeNotifier {
  int _airDikonsumsi = 0;
  int _kebutuhanAir = 0;

  int get airDikonsumsi => _airDikonsumsi;
  int get kebutuhanAir => _kebutuhanAir;

  void updateAirDikonsumsi(int value) {
    _airDikonsumsi = value;
    notifyListeners();
  }

  void updateKebutuhanAir(int value) {
    _kebutuhanAir = value;
    notifyListeners();
    
  }
}