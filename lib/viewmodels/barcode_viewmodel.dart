import 'package:flutter/material.dart';
import '../models/barcode.dart';

class BarcodeViewModel extends ChangeNotifier {
  Barcode? _barcode;

  Barcode? get barcode => _barcode;

  void setBarcode(String code, String format) {
    _barcode = Barcode(code: code, format: format);
    notifyListeners();
  }
}
