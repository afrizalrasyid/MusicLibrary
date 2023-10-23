import 'package:music_library/model/piano_model.dart';
import 'package:dio/dio.dart';

class PianoAPI {
  static Future<List<Piano>> getPiano() async {
    final response =
        await Dio().get('https://65337ae2d80bd20280f68634.mockapi.io/guitar');

    List<Piano> pianos = (response.data as List)
        .map(
          (e) => Piano(
              id: e['id'],
              name: e['name'],
              seri: e['seri'],
              price: e['price'],
              description: e['description'],
              image: e['image']),
        )
        .toList();
    return pianos;
  }
}
