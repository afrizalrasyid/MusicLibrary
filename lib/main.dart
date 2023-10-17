import 'package:flutter/material.dart';
import 'package:music_library/view/guitar/guitar_view_mode.dart';
import 'package:music_library/view/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GuitarViewModel(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    ),
  );
}