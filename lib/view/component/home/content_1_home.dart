import 'package:flutter/material.dart';

class Content1 extends StatelessWidget {
  const Content1({super.key});

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
                  'Reach Out to Asia',
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
                    "The owner of the most expensive guitar was won by a Fender Stratocaster brand guitar with the 'Reach Out to Asia' edition which in 2005 sold for IDR 38 billion. The uniqueness of this guitar is the signature of 19 world rock stars such as Jimmy Page, Mick Jagger, Eric Clapton, Keith Richards, Brian May, David Gilmour, Jeff Beck, Liam Gallagher, Angus, Malcolm Young, and Bryan Adams.",
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
                    "This guitar was made specifically to help tsunami victims in the Asian region in 2004 coordinated by Bryan Adams. Because it's the human side that further adds to the value of this guitar.",
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
                    image: AssetImage('assets/images/content_1.png'),
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
