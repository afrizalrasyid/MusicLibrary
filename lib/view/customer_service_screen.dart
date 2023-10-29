import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(CustomerService());

class CustomerService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatbotScreen(),
    );
  }
}

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  List<String> messages = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();

  Future<void> _submitForm() async {
    String key = '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';
    if (_formKey.currentState!.validate()) {
      final apiKey = key;
      const apiUrl = 'https://api.openai.com/v1/completions';

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode(
          <String, dynamic>{
            'model': 'text-davinci-003',
            'prompt':
                'Kamu adalah chatbot yang bernama M-Assistant yang bertugas untuk membantu user jika user ingin bertanya tentang aplikasi ini. Aplikasi ini bernama Music Library yang merupakan aplikasi untuk menampilkan macam-macam alat musik gitar, piano, dan drum. Aplikasi ini juga bisa memberikan review terhadap alat musik tersebut.' +
                    _textController.text,
            'max_tokens': 50,
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        String userMessage = _textController.text;
        String chatbotMessage = responseData['choices'][0]['text'];

        setState(() {
          messages.add(userMessage);
          messages.add(chatbotMessage);
          _textController.clear();
        });
      } else {
        print('Print failed. Failed to get response: ${response.statusCode}');
      }
    } else {
      print('Insert Value');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 13, 18),
        title: const Text('M-Assistant'),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final isUserMessage = index % 2 == 0;
                  // Pesan user memiliki indeks genap, pesan chatbot memiliki indeks ganjil
                  return ListTile(
                    title: Align(
                      alignment: isUserMessage
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: isUserMessage
                              ? const Color.fromARGB(255, 24, 61, 61)
                              : const Color.fromARGB(255, 4, 13, 18),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          messages[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: 95,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        hintText: 'Type a message',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (_textController.text.isNotEmpty) {
                        _submitForm();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
