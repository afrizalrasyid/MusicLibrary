import 'package:flutter/material.dart';

class CardDrum extends StatelessWidget {
  const CardDrum({super.key});

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
            debugPrint('Card tapped.');
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
                    image: AssetImage('assets/images/category/card_drum.jpg'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    'Drum',
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
