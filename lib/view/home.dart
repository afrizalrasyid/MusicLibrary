import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 233, 233),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 4, 13, 18),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/music_library_logo.png'),
                width: 150,
              ),
            ],
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/header_home.jpg'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Welcome To Our Furniture',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 240,
                      ),
                      Text(
                        'Comfort is our priority',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
