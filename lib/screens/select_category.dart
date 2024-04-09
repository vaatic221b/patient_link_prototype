import 'package:flutter/material.dart';
import 'package:patient_link_prototype/constants/app_styles.dart';
import 'package:patient_link_prototype/screens/details/medicineTaken.dart';
import 'package:patient_link_prototype/screens/details/vitals.dart';
import 'package:patient_link_prototype/screens/update/update_statistics.dart';

class EntryCategoryPage extends StatefulWidget {
  const EntryCategoryPage({super.key});

  @override
  State<EntryCategoryPage> createState() => _EntryCategoryPageState();
}

class _EntryCategoryPageState extends State<EntryCategoryPage> {
  List<Map<String, dynamic>> items = [
    {'icon': 'assets/icons/heart_icon.png', 'label': 'Vital Statistics'},
    {'icon': 'assets/icons/med_icon.png', 'label': 'Medicine Track'},
    {'icon': 'assets/icons/glove_icon.png', 'label': 'Upcoming Operations'},
    {'icon': 'assets/icons/sheet_icon.png', 'label': 'Operation History'},
  ];

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
                const SizedBox(height: 25),
                logCategory(),
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
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Daniel Caesar',
                  style: interBold.copyWith(color: orange, fontSize: 24)),
              const SizedBox(height: 5),
              Text('June 26, 2024',
                  style: interRegular.copyWith(color: orange, fontSize: 16)),
              Text('Date Admitted',
                  style: interItalic.copyWith(color: orange, fontSize: 13)),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFFFE8570),
                size: 30,
              ),
            ),
          )
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
            padding: const EdgeInsets.only(
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

  Row header(icon, title) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 31,
          height: 31,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: interBold.copyWith(fontSize: 20, color: orange),
        ),
      ],
    );
  }

  Widget logCategory() {
    return SizedBox(
      width: 390,
      height: 500,
      child: Column(
        children: [
          header('assets/icons/info_icon.png', 'Add Log Entry To'),
          const SizedBox(height: 5),
          SizedBox(
            width: 390,
            height: 400,
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                items.length,
                (index) => GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const UpdateVitalsPage();
                            },
                          ),
                        );
                        break;
                      case 1:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const MedicineLogsPage();
                            },
                          ),
                        );
                        break;
                      case 2:
                        // Navigate to Upcoming Operations page
                        break;
                      case 3:
                        // Navigate to Operation History page
                        break;
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFFE8570)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          items[index]['icon'],
                          width: 64,
                          height: 64,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          items[index]['label'],
                          style: interRegular.copyWith(
                            fontSize: 16,
                            color: orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
