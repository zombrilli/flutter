import 'package:appflutter/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterApp extends StatelessWidget {
  const FlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.anonymousProTextTheme()),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
