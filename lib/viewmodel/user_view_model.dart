import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:music_library/model/api/user_api.dart';
import 'package:music_library/model/user_model.dart';

class UserViewModel with ChangeNotifier {
  List<User> _users = [];
  List<User> get users => _users;

  Future deleteReview(String id, String productId) async {
    try {
      await UserAPI().deleteUserData(id, productId);
      print('Data berhasil dihapus');
    } catch (error) {
      print('Gagal menghapus data: $error');
    }
  }

  getReviewById(String productId) async {
    final allUsers = await UserAPI.getUser(productId);
    _users = allUsers;
    notifyListeners();

    return allUsers;
  }

  createReview(String productId) async {
    final postData = await UserAPI.postUser(productId);
    final createReview = postData.toList();
    _users = createReview;
    notifyListeners();

    return createReview;
  }

  Future<void> editReview(String reviewId, String newMessage) async {
    try {
      final updatedReview = users.firstWhere((user) => user.id == reviewId);

      // Panggil notifyListeners() untuk memberi tahu widget bahwa data telah berubah
      notifyListeners();
    } catch (error) {
      print('Error editing review: $error');
    }
  }
}
