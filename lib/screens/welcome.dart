import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_link_prototype/screens/select_category.dart';
import 'package:patient_link_prototype/screens/patient_info.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFE8570),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              appName(),
              mainBody(context),
            ],
          ),
        ),
      ),
    );
  }

//METHODS
  Positioned appName() {
    return Positioned(
        top: 80,
        child: Text('PatientLink',
            style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white)));
  }

  Positioned mainBody(BuildContext context) {
    return Positioned(
      top: 200,
      child: SizedBox(
        width: 300,
        height: 600,
        child: Column(
          children: [
            inputTitle(),
            const SizedBox(height: 17),
            patientIDfield(),
            const SizedBox(height: 15),
            passwordField(),
            const SizedBox(height: 30),
            trackButton(context),
            const Spacer(),
            alternative(),
            const Spacer(),
            updateTitle(),
            const SizedBox(height: 50),
            scanQR()
          ],
        ),
      ),
    );
  }

  Widget scanQR() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const EntryCategoryPage();
            },
          ),
        );
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/scanQR.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget alternative() {
    return Text('OR',
        style:
            GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600));
  }

  Container passwordField() {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          hintText: 'Password',
          hintStyle: GoogleFonts.poppins(
            fontSize: 12,
            color: const Color(0xFFA7A7A7),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Transform.scale(
              scale: 0.5,
              child: Image.asset('assets/icons/key_icon.png',
                  width: 5, height: 5)),
          suffixIcon: GestureDetector(
            onTap: () {
              // Handle the tap on the suffix icon
            },
            child: Transform.scale(
                scale: 0.5,
                child: Image.asset('assets/icons/eye_icon.png',
                    width: 5, height: 5)),
          ),
        ),
      ),
    );
  }

  Container patientIDfield() {
    return Container(
        margin: const EdgeInsets.only(left: 0, right: 0),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            hintText: 'Phone number',
            hintStyle: GoogleFonts.poppins(
                fontSize: 12, color: const Color(0xFFA7A7A7)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Transform.scale(
                scale: 0.5,
                child: Image.asset('assets/icons/patient_icon.png',
                    width: 5, height: 5)),
          ),
        ));
  }

  Widget inputTitle() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text('Patient Log',
            style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white)));
  }

  ElevatedButton trackButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const PatientInfoPage();
            },
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(265, 45),
        backgroundColor: const Color.fromARGB(255, 97, 95, 95),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'View Log',
        style: GoogleFonts.montserrat(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget updateTitle() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text('Update Log',
            style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white)));
  }
}
