import 'package:flutter/material.dart';
import 'package:music_library/model/api/product_api.dart';
import 'package:music_library/model/product_model.dart';

class ProductViewModel with ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;

  Future<Product> getProductById(String productId) async {
    final allProducts = await ProductAPI.getProduct();
    final detailProduct = allProducts.firstWhere(
      (product) => product.id == productId,
      orElse: () => Product(
          id: '0',
          name: 'Product Not Found',
          seri: '',
          type: '',
          price: '',
          description: '',
          image: ''),
    );

    return detailProduct;
  }

  getGuitarsOnly() async {
    final allProducts = await ProductAPI.getProduct();
    final guitarProducts =
        allProducts.where((product) => product.type == 'Guitar').toList();
    _products = guitarProducts;
    notifyListeners();

    return guitarProducts;
  }

  getDrumsOnly() async {
    final allProducts = await ProductAPI.getProduct();
    final guitarProducts =
        allProducts.where((product) => product.type == 'Drum').toList();
    _products = guitarProducts;
    notifyListeners();

    return guitarProducts;
  }

  getPianosOnly() async {
    final allProducts = await ProductAPI.getProduct();
    final guitarProducts =
        allProducts.where((product) => product.type == 'Piano').toList();
    _products = guitarProducts;
    notifyListeners();

    return guitarProducts;
  }
}
