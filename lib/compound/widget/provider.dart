import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProviderForm extends ChangeNotifier {
  Uint8List logoEmpresa;
  void setLogoEmpresa(Uint8List newFile) {
    logoEmpresa = newFile;
    notifyListeners();
  }
}