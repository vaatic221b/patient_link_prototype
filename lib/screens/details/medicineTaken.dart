import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:patient_link_prototype/constants/app_styles.dart';
import 'package:patient_link_prototype/data/db_medicine.dart';

class MedicineLogsPage extends StatefulWidget {
  const MedicineLogsPage({super.key});

  @override
  State<MedicineLogsPage> createState() => _MedicineTakenPageState();
}

class _MedicineTakenPageState extends State<MedicineLogsPage> {
  MedicineDatabase medicineDatabase = MedicineDatabase();
  final _mybox = Hive.box('medicineBox');

  @override
  void initState() {
    if (_mybox.get("medicineHistory") == null) {
      medicineDatabase.createInitialData();
    } else {
      medicineDatabase.loadData();
    }
    super.initState();
  }

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
                medicine(),
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

  Widget medicine() {
    return SizedBox(
      height: 200,
      width: 390,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/med_icon.png',
                width: 31,
                height: 31,
              ),
              const SizedBox(width: 8),
              Text(
                'Medicines Taken',
                style: interBold.copyWith(fontSize: 20, color: orange),
              ),
            ],
          ),
          const SizedBox(height: 10),
          meds('Paracetamol', 'Thrice a Day', '5/26/2024'),
          const SizedBox(
            height: 8,
          ),
          meds('Losartan', 'Twice a Day', '5/27/2024'),
        ],
      ),
    );
  }

  Widget meds(String meds, String instructions, String dateBegan) {
    return Container(
      height: 75,
      width: 390,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: orange,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meds,
                    style: interBold.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Instructions: $instructions',
                    style: interItalic.copyWith(fontSize: 12),
                  ),
                  Text(
                    'Date Began: $dateBegan',
                    style: interItalic.copyWith(fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget history() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
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
              const SizedBox(
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
        border: const TableBorder(
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
            'Medicine',
            style: interBold.copyWith(
              fontSize: 14,
            ),
          )),
          DataColumn(
              label: Text(
            'Dosage',
            style: interBold.copyWith(
              fontSize: 14,
            ),
          )),
          DataColumn(
              label: Text(
            'Administered By',
            style: interBold.copyWith(
              fontSize: 14,
            ),
          )),
        ],
        rows: [
          for (var medicineInfo in medicineDatabase.medicineHistory)
            DataRow(cells: <DataCell>[
              DataCell(Text(medicineInfo[0])),
              DataCell(Text(medicineInfo[1])),
              DataCell(Text(medicineInfo[2])),
              DataCell(Text(medicineInfo[3])),
              DataCell(Text(medicineInfo[4])),
            ]),
        ],
      ),
    );
  }
}
