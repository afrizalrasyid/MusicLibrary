import 'package:flutter/material.dart';

class CustomerService extends StatelessWidget {
  const CustomerService({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Customer Service'),
        ),
        body: const Text('Customer Service'),
      ),
    );
  }
}
