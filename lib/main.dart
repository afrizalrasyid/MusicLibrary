import 'package:flutter/material.dart';
import 'package:music_library/viewmodel/product_view_model.dart';
import 'package:music_library/view/welcome_screen.dart';
import 'package:music_library/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserViewModel(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: const Welcome(),
      ),
    ),
  );
}
