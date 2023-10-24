import 'package:flutter/material.dart';
import 'package:music_library/model/product_model.dart';
import 'package:music_library/viewmodel/product_view_model.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  final String productId;

  ProductDetail({required this.productId});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late Product _product;

  @override
  void initState() {
    super.initState();
    getProductData();
  }

  void getProductData() async {
    final product = await Provider.of<ProductViewModel>(context, listen: false)
        .getProductById(widget.productId);
    setState(() {
      _product = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_product == null) {
      return CircularProgressIndicator();
    } else {
      // Tampilkan data produk di sini
      return Scaffold(
        appBar: AppBar(
          title: Text('Detail Produk'),
        ),
        body: Center(
          child: Column(
            children: [
              Image.network(_product.image),
              Text(_product.name),
              Text(_product.description),
              // Tampilkan informasi produk lainnya
            ],
          ),
        ),
      );
    }
  }
}
