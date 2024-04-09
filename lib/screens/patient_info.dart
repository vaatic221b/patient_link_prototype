import 'package:flutter/material.dart';
import 'package:patient_link_prototype/constants/app_styles.dart';

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
                name(),
                const SizedBox(height: 20),
                details(),
                doctors(),
                const SizedBox(height: 20),
                vitals(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget name() {
    return SizedBox(
      height: 150,
      width: 390,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/samplePatient.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Real Niggas',
                  style: interBold.copyWith(color: orange, fontSize: 24)),
              const SizedBox(height: 5),
              Text('June 26, 2024',
                  style: interRegular.copyWith(color: orange, fontSize: 16)),
              Text('Date Admitted',
                  style: interItalic.copyWith(color: orange, fontSize: 13)),
            ],
          ),
          const SizedBox(width: 20)
        ],
      ),
    );
  }

  Widget details() {
    return SizedBox(
      width: 390,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          age(),
          weight(),
          bloodType(),
          room(),
        ],
      ),
    );
  }

  Column age() {
    return Column(
      children: [
        detailHead('Age'),
        detailData('68'),
      ],
    );
  }

  Column weight() {
    return Column(
      children: [
        detailHead('Weight'),
        detailData('58 Kg'),
      ],
    );
  }

  Column bloodType() {
    return Column(
      children: [
        detailHead('Blood Type'),
        detailData('O+'),
      ],
    );
  }

  Column room() {
    return Column(
      children: [
        detailHead('Room no.'),
        detailData('301'),
      ],
    );
  }

  Widget detailData(String content) {
    return Text(content,
        style: interBold.copyWith(fontSize: 24, color: Colors.black));
  }

  Widget detailHead(String content) {
    return Text(content,
        style: interBold.copyWith(fontSize: 16, color: orange));
  }

  Widget doctors() {
    return SizedBox(
      height: 216,
      width: 390,
      child: Column(
        children: [
          header(),
          const SizedBox(height: 10),
          Container(
            width: 390,
            height: 172,
            decoration: BoxDecoration(
              color: const Color(0xFFFBEDE8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: RawScrollbar(
                thumbVisibility: true,
                thumbColor: const Color(0xFFFE8570),
                radius: const Radius.circular(20),
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 343,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 65,
                            width: 72,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFE8570),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Dr. Jane Doe',
                                style: interBold.copyWith(
                                    fontSize: 14, color: black),
                              ),
                              Text(
                                'Nephrologist',
                                style: interItalic.copyWith(
                                    fontSize: 12, color: black),
                              )
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                              'assets/icons/dots_icon.png',
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row header() {
    return Row(
      children: [
        Image.asset(
          'assets/icons/heart_icon.png',
          width: 31,
          height: 31,
        ),
        const SizedBox(width: 8),
        Text(
          'Doctors Assigned',
          style: interBold.copyWith(fontSize: 20, color: orange),
        ),
      ],
    );
  }

  Widget vitals() {
    return Container(
      width: 390,
      height: 131,
      color: Colors.amber,
    );
  }
}
