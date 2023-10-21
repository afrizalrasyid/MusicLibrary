import 'package:flutter/material.dart';
import 'package:music_library/view/component/category/card_drum.dart';
import 'package:music_library/view/component/category/card_guitar.dart';
import 'package:music_library/view/component/category/card_piano.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 233, 233),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 4, 13, 18),
          title: const Text('Category'),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CardGuitar(),
              CardDrum(),
              CardPiano(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
