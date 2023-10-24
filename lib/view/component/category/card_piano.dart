import 'package:flutter/material.dart';
import 'package:music_library/view/piano_screen.dart';

class CardPiano extends StatelessWidget {
  const CardPiano({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: InkWell(
          splashColor: Colors.grey.shade800,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const PianoScreen(),
              ),
            );
          },
          child: const SizedBox(
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Image(
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/category/card_piano.jpg'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    'Piano',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Find the most comfortable place to rest',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
