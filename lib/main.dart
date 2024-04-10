import 'package:flutter/material.dart';

import 'package:patient_link_prototype/screens/welcome.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
//test again
Future<void> main() async {
  await Hive.initFlutter();

  var medicineBox = await Hive.openBox('medicineBox');

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
