import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EditReview extends StatefulWidget {
  final String productId;
  final String id;
  final String name;
  final String message;

  EditReview(
      {required this.productId,
      required this.id,
      required this.name,
      required this.message});

  @override
  State<EditReview> createState() => _EditReviewState();
}

class _EditReviewState extends State<EditReview> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalDialog(context);
      },
      child: const Icon(
        Icons.edit,
      ),
    );
  }

  void showModalDialog(BuildContext context) {
    nameController.text = widget.name;
    messageController.text = widget.message;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Edit the review",
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

                nameController.clear();
                messageController.clear();
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
                final editedName = nameController.text;
                final editedMessage = messageController.text;

                editReview(
                    widget.productId, editedName, editedMessage, widget.id);
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

void editReview(
    String productId, String name, String message, String id) async {
  try {
    Dio dio = Dio();
    Response response = await dio.put(
        'https://65337ae2d80bd20280f68634.mockapi.io/product/$productId/users/$id',
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
