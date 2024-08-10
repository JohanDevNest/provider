import 'package:flutter/material.dart';

class Providerfino extends ChangeNotifier {
   
  TextEditingController fechaController = TextEditingController();
  TextEditingController fechaController2 = TextEditingController();
  TextEditingController fechaController3 = TextEditingController();

  bool _led = false;

  void setLed(bool value) {
    _led = value;
    notifyListeners();
  }

  void setFecha(String fecha) {
    fechaController.text = fecha;
    // notifyListeners();
  }

  void setFecha2(String fecha) {
    fechaController2.text = fecha;
    // notifyListeners();
  }

  void setFecha3(String fecha) {
    fechaController3.text = fecha;
    // notifyListeners();
  }

  get getLed {
    return _led;
  }

  get getFecha {
    return fechaController.text;
  }

  get getFecha2 {
    return fechaController2.text;
  }

  get getFecha3 {
    return fechaController3.text;
  }
}
