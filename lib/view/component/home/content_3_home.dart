import 'package:flutter/material.dart';

class Content3 extends StatelessWidget {
  const Content3({super.key});

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
                  'Start from Young',
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
                    "Music can play a role in growing intelligence and improving children's memory, this is because when listening to music, children's brain cells work more actively. Playing a musical instrument can train motor skills and ear sensitivity to develop coordination between various senses.",
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
                    image: AssetImage('assets/images/content_3.jpg'),
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
