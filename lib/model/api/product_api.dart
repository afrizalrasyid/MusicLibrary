import 'package:music_library/model/product_model.dart';
import 'package:dio/dio.dart';

class ProductAPI {
  static Future<List<Product>> getProduct() async {
    final response =
        await Dio().get('https://65337ae2d80bd20280f68634.mockapi.io/product');

    List<Product> products = (response.data as List)
        .map(
          (e) => Product(
              id: e['id'],
              name: e['name'],
              seri: e['seri'],
              type: e['type'],
              price: e['price'],
              description: e['description'],
              image: e['image']),
        )
        .toList();
    return products;
  }
}
