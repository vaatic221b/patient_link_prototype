import 'package:flutter/material.dart';
import 'package:patient_link_prototype/constants/app_styles.dart';

class VitalsLogsPage extends StatefulWidget {
  const VitalsLogsPage({super.key});

  @override
  State<VitalsLogsPage> createState() => _VitalsPageState();
}

class _VitalsPageState extends State<VitalsLogsPage> {
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
                history(),
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
              Text('Real Niggas',
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget history() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'History',
                    style: interBold.copyWith(fontSize: 20, color: orange),
                  ),
                  Image.asset(
                    'assets/icons/dots.png',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              historyTable(),
            ],
          ),
        ),
      ],
    );
  }

  Widget historyTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor:
            MaterialStateColor.resolveWith((states) => lightOrange),
        border: TableBorder(
            horizontalInside: BorderSide(color: orange),
            top: BorderSide(color: orange),
            bottom: BorderSide(color: orange)),
        columns: <DataColumn>[
          DataColumn(
              label: Text(
            'Date',
            style: interBold.copyWith(
              fontSize: 14,
            ),
          )),
          DataColumn(
              label: Text(
            'Time',
            style: interBold.copyWith(
              fontSize: 14,
            ),
          )),
          DataColumn(
              label: Text(
            'BP',
            style: interBold.copyWith(
              fontSize: 14,
            ),
          )),
          DataColumn(
              label: Text(
            'HR',
            style: interBold.copyWith(
              fontSize: 14,
            ),
          )),
          DataColumn(
              label: Text(
            'Glucose Lvl',
            style: interBold.copyWith(
              fontSize: 14,
            ),
          )),
          DataColumn(
              label: Text(
            'Body Temp',
            style: interBold.copyWith(
              fontSize: 14,
            ),
          )),
          DataColumn(
              label: Text(
            'Oxy Saturation',
            style: interBold.copyWith(
              fontSize: 14,
            ),
          )),
          DataColumn(
              label: Text(
            'Respiratory Rate',
            style: interBold.copyWith(
              fontSize: 14,
            ),
          )),
        ],
        rows: const <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(Text('5/26/2024')),
            DataCell(Text('3:00 PM')),
            DataCell(Text('140/90')),
            DataCell(Text('95')),
            DataCell(Text('99')),
            DataCell(Text('37')),
            DataCell(Text('29')),
            DataCell(Text('30')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('5/27/2024')),
            DataCell(Text('4:30 PM')),
            DataCell(Text('130/85')),
            DataCell(Text('90')),
            DataCell(Text('102')),
            DataCell(Text('37.5')),
            DataCell(Text('30')),
            DataCell(Text('32')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('5/28/2024')),
            DataCell(Text('2:15 PM')),
            DataCell(Text('135/88')),
            DataCell(Text('92')),
            DataCell(Text('97')),
            DataCell(Text('36.8')),
            DataCell(Text('31')),
            DataCell(Text('29')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('5/29/2024')),
            DataCell(Text('10:00 AM')),
            DataCell(Text('142/95')),
            DataCell(Text('96')),
            DataCell(Text('105')),
            DataCell(Text('37.2')),
            DataCell(Text('28')),
            DataCell(Text('28')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
          ]),
        ],
      ),
    );
  }
}
