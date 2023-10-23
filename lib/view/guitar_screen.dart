import 'package:flutter/material.dart';
import 'package:music_library/viewmodel/guitar_view_model.dart';
import 'package:provider/provider.dart';

class GuitarScreen extends StatefulWidget {
  const GuitarScreen({super.key});

  @override
  State<GuitarScreen> createState() => _GuitarScreenState();
}

class _GuitarScreenState extends State<GuitarScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<GuitarViewModel>(context, listen: false).getAllGuitars();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<GuitarViewModel>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 13, 18),
        title: const Text('Guitars'),
      ),
      body: Container(
        margin: const EdgeInsets.all(18),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
          itemCount: modelView.guitars.length,
          itemBuilder: (context, index) {
            final guitar = modelView.guitars[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 5,
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Image.network(width: 97, guitar.image),
                    ListTile(
                      title: Text(
                          style: const TextStyle(fontSize: 15), guitar.name),
                      subtitle: Text(guitar.seri),
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
