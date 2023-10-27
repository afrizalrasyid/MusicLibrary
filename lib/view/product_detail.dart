import 'package:flutter/material.dart';
import 'package:music_library/model/api/user_api.dart';
import 'package:music_library/model/product_model.dart';
import 'package:music_library/view/component/product_detail/edit_review_modal.dart';
import 'package:music_library/view/component/product_detail/write_review_modal.dart';
import 'package:music_library/viewmodel/product_view_model.dart';
import 'package:music_library/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  final String productId;

  ProductDetail({required this.productId});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late Product _product = Product(
      id: 'id',
      name: 'name',
      seri: 'seri',
      type: 'type',
      price: 'price',
      description: 'description',
      image: 'image');
  // late User _user =
  //     User(id: 'id', productId: 'productId', name: 'name', message: 'message');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserViewModel>(context, listen: false)
          .getReviewById(widget.productId);
    });
  }

  @override
  void initState() {
    super.initState();
    getProductData();
    // getUserReview();
  }

  // void getUserReview() async {
  //   final user = await Provider.of<UserViewModel>(context, listen: false)
  //       .getReviewById(widget.productId);
  //   setState(() {
  //     _user = user;
  //   });
  // }

  void getProductData() async {
    final product = await Provider.of<ProductViewModel>(context, listen: false)
        .getProductById(widget.productId);
    setState(() {
      _product = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_product == false) {
      return const CircularProgressIndicator();
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 4, 13, 18),
          title: const Text('Detail Product'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.network(height: 370, _product.image),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                        _product.name),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Rp',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins'),
                    ),
                    Text(
                      _product.price,
                      style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins'),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      '*Retail price (including VAT)',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  _product.description,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 190,
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Reviews',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                        Consumer<UserViewModel>(
                          builder: (context, modelView, child) {
                            if (modelView.users.isEmpty) {
                              return const Center(
                                child: Text("No reviews available."),
                              );
                            }
                            return Expanded(
                              child: ListView.builder(
                                itemCount: modelView.users.length,
                                itemBuilder: (context, index) {
                                  final user = modelView.users[index];
                                  return ListTile(
                                    leading: const Icon(Icons.person),
                                    title: Text(user.name),
                                    subtitle: Text(user.message),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        EditReview(
                                            productId: widget.productId,
                                            id: user.id,
                                            name: user.name,
                                            message: user.message),
                                        IconButton(
                                          onPressed: () {
                                            UserViewModel().deleteReview(
                                                user.id, widget.productId);
                                          },
                                          icon: const Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [WriteReview(productId: widget.productId)],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
