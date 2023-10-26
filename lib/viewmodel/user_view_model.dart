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
    final reviewProduct =
        allUsers.where((user) => user.id == productId).toList();
    _users = reviewProduct;
    notifyListeners();

    return reviewProduct;
  }

  createReview(String productId) async {
    final getData = await UserAPI.postUser(productId);
    final createReview = getData.where((user) => user.id == productId).toList();
    _users = createReview;
    notifyListeners();

    return createReview;
  }
}
