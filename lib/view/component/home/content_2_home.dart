import 'package:flutter/material.dart';

class Content2 extends StatelessWidget {
  const Content2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'From the Oldest',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 350,
                  child: Text(
                    "The Geisenklösterle flute is an ancient flute made of swan bone and mammoth ivory. This flute comes from the plains of Europe, Germany to be precise. The Geisenklösterle flute has an age of 42,000-43,000 years which makes it the oldest musical instrument in the world.",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 350,
                  child: Text(
                    "The flute was found in the Geisenklösterle Cave archaeological site about a decade ago. There are 3 flutes at once found in the cave. The flutes could have been used for an ancient ritual or simply for entertainment.",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 350,
                  child: Text(
                    "The Geisenklösterle flute has special ornamentation and high artistry which makes this instrument very special for historians. On the other hand, there are also archaeologists who believe that this flute could be 40,000-45,000 years old.",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  child: Image(
                    width: 320,
                    image: AssetImage('assets/images/content_2.jpg'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
