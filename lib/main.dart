import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agriculture/pages/home_page.dart';
import 'package:agriculture/pages/Login _page.dart';
import 'package:agriculture/pages/splashscreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   title: 'Agriculture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: GoogleFonts.mulishTextTheme(),
      ),
      home: const SplashScreen(),
    );
  }
}