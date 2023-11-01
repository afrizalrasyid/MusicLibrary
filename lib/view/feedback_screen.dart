import 'package:flutter/material.dart';
import 'package:music_library/view/component/feedback/feedback_form.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 233, 233, 233),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 4, 13, 18),
            title: const Text('Feedback'),
          ),
          body: const SingleChildScrollView(
            child: Column(
              children: [FeedbackForm()],
            ),
          )),
    );
  }
}
