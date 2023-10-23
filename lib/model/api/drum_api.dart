import 'package:music_library/model/drum_model.dart';
import 'package:dio/dio.dart';

class DrumAPI {
  static Future<List<Drum>> getDrum() async {
    final response =
        await Dio().get('https://65337ae2d80bd20280f68634.mockapi.io/drum');

    List<Drum> drums = (response.data as List)
        .map(
          (e) => Drum(
              id: e['id'],
              name: e['name'],
              seri: e['seri'],
              price: e['price'],
              description: e['description'],
              image: e['image']),
        )
        .toList();
    return drums;
  }
}
