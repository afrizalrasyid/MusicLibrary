import 'package:music_library/model/user_model.dart';
import 'package:dio/dio.dart';

class UserAPI {
  deleteUserData(String id, String productId) async {
    final response = await Dio().delete(
        'https://65337ae2d80bd20280f68634.mockapi.io/product/$productId/users/$id');

    if (response.statusCode == 200) {
      print('Data berhasil dihapus');
    } else {
      print('Gagal menghapus data. Status code: ${response.statusCode}');
    }
  }

  static Future<List<User>> getUser(String productId) async {
    final response = await Dio().get(
        'https://65337ae2d80bd20280f68634.mockapi.io/product/$productId/users');

    List<User> users = (response.data as List)
        .map(
          (e) => User(
            id: e['id'],
            productId: e['productId'],
            name: e['name'],
            message: e['message'],
          ),
        )
        .toList();
    return users;
  }
}
