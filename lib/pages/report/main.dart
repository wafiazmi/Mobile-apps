import 'package:flutter/material.dart';
import 'screens/report_home.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Report',
      theme: ThemeData(
        primaryColor: const Color(0xFF00A884),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00A884),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF00A884),
          foregroundColor: Colors.white,
        ),
      ),
      home: const ReportHome(),
    );
  }
}