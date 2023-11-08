import 'package:flutter/material.dart';
import 'package:music_library/view/component/home/carousel_slider_home.dart';
import 'package:music_library/view/component/home/content_1_home.dart';
import 'package:music_library/view/component/home/content_2_home.dart';
import 'package:music_library/view/component/home/content_3_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true;
          } else {
            _showBackToTopButton = false;
          }
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 233, 233),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 4, 13, 18),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/home/music_library_logo.png'),
                width: 150,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: const Column(
            children: [
              Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/home/header_home.jpg'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Discover Your Music',
                        style: TextStyle(
                            fontSize: 24,
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
                        height: 270,
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          textAlign: TextAlign.center,
                          '“When you play, never mind who listens to you.” – Robert Schumann',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              CarouselImage(),
              SizedBox(
                height: 60,
              ),
              Content1(),
              Divider(
                thickness: 2,
                height: 60,
                indent: 20,
                endIndent: 20,
              ),
              Content2(),
              Divider(
                thickness: 2,
                height: 60,
                indent: 20,
                endIndent: 20,
              ),
              Content3(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        floatingActionButton: _showBackToTopButton == false
            ? null
            : FloatingActionButton(
                onPressed: _scrollToTop,
                backgroundColor: const Color.fromARGB(255, 24, 61, 61),
                child: const Icon(Icons.arrow_upward),
              ),
      ),
    );
  }
}
