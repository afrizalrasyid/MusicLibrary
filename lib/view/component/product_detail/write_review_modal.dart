import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WriteReview extends StatefulWidget {
  final String productId;

  WriteReview({required this.productId});

  @override
  State<WriteReview> createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalDialog(context);
      },
      child: const Text(
        'Write Review >',
        style: TextStyle(
            decoration: TextDecoration.underline,
            fontFamily: 'Poppins',
            fontSize: 13,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  void showModalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Write your review!",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          content: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 92, 131, 116),
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 92, 131, 116),
                    ),
                  ),
                  hintText: 'Input your name..',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: messageController,
                maxLength: 250,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Review',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 92, 131, 116),
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 92, 131, 116),
                    ),
                  ),
                  hintText: "Tell me about our product",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Close",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 24, 61, 61),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                addReview(widget.productId, nameController.text,
                    messageController.text);
                Navigator.of(context).pop();

                nameController.clear();
                messageController.clear();
              },
              child: const Text(
                "Submit",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 24, 61, 61),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

void addReview(String productId, String name, String message) async {
  try {
    Dio dio = Dio();
    Response response = await dio.post(
        'https://65337ae2d80bd20280f68634.mockapi.io/product/$productId/users',
        data: {
          'productId': productId,
          'name': name,
          'message': message,
        });

    if (response.statusCode == 200) {
      print('Review added successfully');
    } else {
      print('Failed to add review');
    }
  } catch (error) {
    print('Error: $error');
  }
}
