import 'package:flutter/material.dart';
import 'package:music_library/model/api/drum_api.dart';
import 'package:music_library/model/drum_model.dart';

class DrumViewModel with ChangeNotifier {
  List<Drum> _drums = [];
  List<Drum> get drums => _drums;

  getAllDrums() async {
    final d = await DrumAPI.getDrum();
    _drums = d;
    notifyListeners();
  }
}
