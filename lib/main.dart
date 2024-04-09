import 'package:flutter/material.dart';
import 'package:patient_link_prototype/screens/details/medicineTaken.dart';
import 'package:patient_link_prototype/screens/details/operationHistory.dart';
import 'package:patient_link_prototype/screens/details/vitals.dart';
import 'package:patient_link_prototype/screens/welcome.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'PatientLink Prototype',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
