import 'package:flutter/material.dart';

class PatientInfoPage extends StatefulWidget {
  const PatientInfoPage({super.key});

  @override
  State<PatientInfoPage> createState() => _PatientInfoPageState();
}

class _PatientInfoPageState extends State<PatientInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 400,
                  color: Colors.amber,
                ),

                //test
              ],
            ),
          ),
        ),
      ),
    );
  }
}
