import 'package:flutter/material.dart';
import 'package:ingreso/src/models/tipoIngreso.dart';

class EntryFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  int _idTipoIngreso = 1;
  String _placa = '';
  String _empresa = '';
  String _nombre = '';
  String _cedula = '';
  String _calle = '';
  String _numero = '';
  String _pasajero = 'no';

  bool _placaBool = false;
  bool _empresaBool = false;
  bool _nombreBool = false;
  bool _cedulaBool = false;
  bool _calleBool = false;
  bool _numeroBool = false;
  bool _pasajeroBool = false;
  bool _fotoPlaca = false;
  bool _fotoCedula = false;

  int get idTipoIngreso => _idTipoIngreso;
  String get placa => _placa;
  String get empresa => _empresa;
  String get nombre => _nombre;
  String get cedula => _cedula;
  String get calle => _calle;
  String get numero => _numero;
  String get pasajero => _pasajero;

  bool get placaBool => _placaBool;
  bool get empresaBool => _empresaBool;
  bool get nombreBool => _nombreBool;
  bool get cedulaBool => _cedulaBool;
  bool get calleBool => _calleBool;
  bool get numeroBool => _numeroBool;
  bool get pasajeroBool => _pasajeroBool;
  bool get fotoPlaca => _fotoPlaca;
  bool get fotoCedula => _fotoCedula;

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

  set pasajero(String value) {
    _pasajero = value;
    notifyListeners();
  }

  void iniciarEvento(TipoIngreso tipo) {
    _placaBool = tipo.placa;
    _empresaBool = tipo.empresa;
    _nombreBool = tipo.nombre;
    _cedulaBool = tipo.cedula;
    _calleBool = tipo.calle;
    _numeroBool = tipo.numero;
    _pasajeroBool = tipo.pasajero;
    _fotoPlaca = tipo.fotoPlaca;
    _fotoCedula = tipo.fotoCedula;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
