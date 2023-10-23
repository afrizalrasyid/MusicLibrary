import 'package:flutter/material.dart';
import 'package:music_library/viewmodel/drum_view_model.dart';
import 'package:music_library/viewmodel/guitar_view_model.dart';
import 'package:music_library/view/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GuitarViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => DrumViewModel(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome(),
      ),
    ),
  );
}
