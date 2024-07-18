import 'package:dashboards/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
        textTheme: GoogleFonts.poppinsTextTheme(TextTheme(
          bodyMedium: const TextStyle(fontSize: 11),
          headlineLarge: GoogleFonts.poppins(
              textStyle: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            height: 2,
          )),
        )),
        useMaterial3: true,
      ),
      home: MenuDashboardPage(),
    );
  }
}
