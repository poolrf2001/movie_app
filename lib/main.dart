import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}
//Bien API
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Movie",
      theme: ThemeData(
        primaryColor: Colors.yellow,
        textTheme: GoogleFonts.manropeTextTheme(),

      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}



