import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: const Color.fromARGB(255, 233, 233, 233),
            child: Center(
              child: Column(
                children: [
                  Ink(
                    decoration: const ShapeDecoration(
                      color: Color.fromARGB(255, 92, 131, 116),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    child: IconButton(
                      iconSize: 50,
                      icon: const Icon(Icons.android),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  const Text(
                    'Guitar',
                  ),
                ],
              ),
            ),
          ),
          Material(
            color: const Color.fromARGB(255, 233, 233, 233),
            child: Center(
              child: Column(
                children: [
                  Ink(
                    decoration: const ShapeDecoration(
                      color: Color.fromARGB(255, 92, 131, 116),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    child: IconButton(
                      iconSize: 50,
                      icon: const Icon(Icons.android),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  const Text(
                    'Piano',
                  ),
                ],
              ),
            ),
          ),
          Material(
            color: const Color.fromARGB(255, 233, 233, 233),
            child: Center(
              child: Column(
                children: [
                  Ink(
                    decoration: const ShapeDecoration(
                      color: Color.fromARGB(255, 92, 131, 116),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    child: IconButton(
                      iconSize: 50,
                      icon: const Icon(Icons.android),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  const Text(
                    'Drum',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
