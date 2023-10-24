import 'package:flutter/material.dart';
import 'package:music_library/view/product_detail.dart';
import 'package:music_library/viewmodel/product_view_model.dart';
import 'package:provider/provider.dart';

class PianoScreen extends StatefulWidget {
  const PianoScreen({super.key});

  @override
  State<PianoScreen> createState() => _PianoScreenState();
}

class _PianoScreenState extends State<PianoScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductViewModel>(context, listen: false).getPianosOnly();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<ProductViewModel>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 13, 18),
        title: const Text('Pianos'),
      ),
      body: Container(
        margin: const EdgeInsets.all(18),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
          itemCount: modelView.products.length,
          itemBuilder: (context, index) {
            final piano = modelView.products[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 10,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductDetail(
                        productId: piano.id,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Image.network(width: 97, piano.image),
                    ListTile(
                      title: Text(
                          style: const TextStyle(fontSize: 15), piano.name),
                      subtitle: Text(piano.seri),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
