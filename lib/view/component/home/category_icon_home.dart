import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SizedBox(
        width: 370,
        height: 210,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Explore',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Material(
                    child: Center(
                      child: Column(
                        children: [
                          Ink(
                            decoration: const ShapeDecoration(
                              color: Color.fromARGB(255, 92, 131, 116),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            child: IconButton(
                              iconSize: 45,
                              icon: const FaIcon(FontAwesomeIcons.guitar),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                          const Text(
                            'Guitar',
                            style: TextStyle(height: 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Material(
                    child: Center(
                      child: Column(
                        children: [
                          Ink(
                            decoration: const ShapeDecoration(
                              color: Color.fromARGB(255, 92, 131, 116),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            child: IconButton(
                              iconSize: 45,
                              icon: const FaIcon(FontAwesomeIcons.music),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                          const Text(
                            'Piano',
                            style: TextStyle(height: 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Material(
                    child: Center(
                      child: Column(
                        children: [
                          Ink(
                            decoration: const ShapeDecoration(
                              color: Color.fromARGB(255, 92, 131, 116),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            child: IconButton(
                              iconSize: 45,
                              icon: const FaIcon(FontAwesomeIcons.drum),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                          const Text(
                            'Drum',
                            style: TextStyle(height: 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
