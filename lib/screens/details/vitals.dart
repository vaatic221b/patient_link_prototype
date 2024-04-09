import 'package:flutter/material.dart';
import 'package:patient_link_prototype/constants/app_styles.dart';

class Vitals extends StatefulWidget {
  const Vitals({super.key});

  @override
  State<Vitals> createState() => _VitalsPageState();
}

class _VitalsPageState extends State<Vitals> {
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
                vitalsStatistics(),
                // history(),
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

  Widget vitalsStatistics() {
    return Container(
      height: 1720,
      width: 390,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/heart_icon.png',
                width: 31,
                height: 31,
              ),
              const SizedBox(width: 8),
              Text(
                'Vital Statistics',
                style: interBold.copyWith(fontSize: 20, color: orange),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
              width: 390,
              height: 232,
              decoration: BoxDecoration(
                color: const Color(0xFFFBEDE8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      statistics(112.67, 'Blood Pressure', '140/90'),
                      const SizedBox(
                        width: 10,
                      ),
                      statistics(112.67, 'Heart Rate', '95'),
                      const SizedBox(
                        width: 10,
                      ),
                      statistics(112.67, 'Glucose Level', '89.72'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      statistics(174, 'Body Temperature', '28.03'),
                      const SizedBox(
                        width: 10,
                      ),
                      statistics(174, 'Oxygen Saturation', '28.03'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      statistics(358, 'Respiratory Rate', '28.03')
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget statistics(width, statistic, number) {
    return Container(
      height: 60,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 12,
              top: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  statistic,
                  style: interItalicBold.copyWith(
                    color: orange,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  number,
                  textAlign: TextAlign.start,
                  style: interBold.copyWith(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget history() {
  //   return
  // }
}
