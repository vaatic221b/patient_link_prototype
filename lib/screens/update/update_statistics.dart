import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:patient_link_prototype/constants/app_styles.dart';

class UpdateStatistics extends StatefulWidget {
  const UpdateStatistics({super.key});

  @override
  State<UpdateStatistics> createState() => _UpdateStatisticsPageState();
}

class _UpdateStatisticsPageState extends State<UpdateStatistics> {
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
                const SizedBox(
                  height: 24,
                ),
                update(),
                confirmButton(),
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

  Widget vitalsStatistics() {
    return Container(
      height: 274,
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget update() {
    return Container(
      height: 250,
      width: 390,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/information_icon.png',
                width: 31,
                height: 31,
              ),
              const SizedBox(width: 8),
              Text(
                'Update Statistics',
                style: interBold.copyWith(fontSize: 20, color: orange),
              ),
            ],
          ),
          const SizedBox(height: 10),
          textBox(390, 'Blood Pressure'),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              textBox(191, 'Heart Rate'),
              SizedBox(
                width: 8,
              ),
              textBox(191, 'Glucose Level'),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              textBox(191, 'Body Temperature'),
              SizedBox(
                width: 8,
              ),
              textBox(191, 'Oxygen Saturation'),
            ],
          ),
        ],
      ),
    );
  }

  Widget confirmButton() {
    return Container(
      height: 44,
      width: 390,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12), color: orange),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Image.asset(
                'assets/icons/yes.png',
                width: 20,
                height: 20,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Confirm Updates',
                style: interBold.copyWith(fontSize: 14, color: kWhite),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget textBox(width, description) {
    return Container(
      width: width,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: description,
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
            (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : orange;
              return TextStyle(color: color, letterSpacing: 1.3);
            },
          ),
        ),
        autovalidateMode: AutovalidateMode.always,
      ),
    );
  }
}
