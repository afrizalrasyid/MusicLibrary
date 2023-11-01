import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  var inputFirstNameController = TextEditingController();
  var inputEmailController = TextEditingController();
  var inputMessageController = TextEditingController();

  bool _validateFirstName(String firstname) {
    if (firstname.isEmpty) {
      return false;
    }
    return true;
  }

  bool _validateEmail(String email) {
    if (email.isEmpty) {
      return false;
    }
    return true;
  }

  bool _validateMessage(String message) {
    if (message.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Contact us',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 22,
              ),
              SizedBox(
                width: 335,
                child: Text(
                  'Need to get in touch with us? Either fill out the form with your inquiry or find the departement email you like to contact below.',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('First name*'),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 170,
                      child: TextField(
                        controller: inputFirstNameController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 228, 228, 228),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Last Name'),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 170,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 228, 228, 228),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email*'),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: inputEmailController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 228, 228, 228),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('What can we help you with?*'),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: inputMessageController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 228, 228, 228),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 92, 131, 116)),
                onPressed: () {
                  String firstname = inputFirstNameController.text;
                  String email = inputEmailController.text;
                  String message = inputMessageController.text;

                  if (_validateFirstName(firstname) &&
                      _validateEmail(email) &&
                      _validateMessage(message)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Data Submitted!'),
                          content: const Text(
                              "Your message have been submitted, thank's for contacting us!"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Okay'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Please fill the form!'),
                          content: const Text(
                              'The First name, Email, and Message form must be filled.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Okay'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text(
                  'Submit',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
