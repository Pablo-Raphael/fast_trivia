import 'package:checkmob_quiz/core/inject/inject.dart';
import 'package:checkmob_quiz/layers/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  Inject.init();

  runApp(
    MaterialApp(
      title: 'CheckMob Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: const HomePage(),
    ),
  );
}
