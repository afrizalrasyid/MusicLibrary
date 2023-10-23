import 'package:flutter/material.dart';
import 'package:music_library/model/api/guitar_api.dart';
import 'package:music_library/model/guitar_model.dart';

class GuitarViewModel with ChangeNotifier {
  List<Guitar> _guitars = [];
  List<Guitar> get guitars => _guitars;

  getAllGuitars() async {
    final g = await GuitarAPI.getGuitar();
    _guitars = g;
    notifyListeners();
  }
}
