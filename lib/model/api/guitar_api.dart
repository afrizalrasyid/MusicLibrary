import 'package:music_library/model/guitar_model.dart';
import 'package:dio/dio.dart';

class GuitarAPI {
  static Future<List<Guitar>> getGuitar() async {
    final response =
        await Dio().get('https://65337ae2d80bd20280f68634.mockapi.io/guitar');

    List<Guitar> guitars = (response.data as List)
        .map(
          (e) => Guitar(
              id: e['id'],
              name: e['name'],
              seri: e['seri'],
              price: e['price'],
              description: e['description'],
              image: e['image']),
        )
        .toList();
    return guitars;
  }
}
