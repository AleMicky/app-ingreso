import 'package:flutter/material.dart';
import 'package:ingreso/src/models/tipoIngreso.dart';

class EntryFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  int _idTipoIngreso = 0;
  String _placa = '';
  String _empresa = '';
  String _nombre = '';
  String _cedula = '';
  String _calle = '';
  String _numero = '';

  bool _placaBool = false;
  bool _empresaBool = false;
  bool _nombreBool = false;
  bool _cedulaBool = false;
  bool _calleBool = false;
  bool _numeroBool = false;

  int get idTipoIngreso => _idTipoIngreso;
  String get placa => _placa;
  String get empresa => _empresa;
  String get nombre => _nombre;
  String get cedula => _cedula;
  String get calle => _calle;
  String get numero => _numero;

  bool get placaBool => _placaBool;
  bool get empresaBool => _empresaBool;
  bool get nombreBool => _nombreBool;
  bool get cedulaBool => _cedulaBool;
  bool get calleBool => _calleBool;
  bool get numeroBool => _numeroBool;

  set idTipoIngreso(int value) {
    _idTipoIngreso = value;
    notifyListeners();
  }

  set placa(String value) {
    _placa = value;
    notifyListeners();
  }

  set empresa(String value) {
    _empresa = value;
    notifyListeners();
  }

  set nombre(String value) {
    _nombre = value;
    notifyListeners();
  }

  set cedula(String value) {
    _cedula = value;
    notifyListeners();
  }

  set calle(String value) {
    _calle = value;
    notifyListeners();
  }

  set numero(String value) {
    _numero = value;
    notifyListeners();
  }

  void iniciarEvento(TipoIngreso tipo) {
    _placaBool = tipo.placa;
    _empresaBool = tipo.empresa;
    _nombreBool = tipo.nombre;
    _cedulaBool = tipo.cedula;
    _calleBool = tipo.calle;
    _numeroBool = tipo.numero;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
