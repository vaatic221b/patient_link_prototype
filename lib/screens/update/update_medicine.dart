import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:patient_link_prototype/constants/app_styles.dart';
import 'package:patient_link_prototype/data/db_medicine.dart';

class UpdateMedPage extends StatefulWidget {
  const UpdateMedPage({Key? key}) : super(key: key);

  @override
  State<UpdateMedPage> createState() => _UpdateMedPageState();
}

class _UpdateMedPageState extends State<UpdateMedPage> {
  MedicineDatabase medicineDatabase = MedicineDatabase();
  final _mybox = Hive.box('medicineBox');
  TextEditingController medicineController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dosageController = TextEditingController();
  TextEditingController administeredByController = TextEditingController();
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              name(),
              const SizedBox(height: 20),
              details(),
              medicine(),
              const SizedBox(height: 24),
              update(),
              const SizedBox(height: 5),
              confirmButton(),
            ],
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
    return Padding(
      padding: EdgeInsets.only(
        right: 25,
      ),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              // Implement delete functionality here
            },
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
        ]),
        child: Container(
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
        ),
      ),
    );
  }

  Widget update() {
    return SizedBox(
      height: 350,
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
                'Update Medicine Timetable',
                style: interBold.copyWith(fontSize: 20, color: orange),
              ),
            ],
          ),
          const SizedBox(height: 20),
          textBox(390, 'Generic Name', medicineController),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null) {
                      dateController.text =
                          "${picked.month}/${picked.day}/${picked.year}";
                    }
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: dateController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Select Date',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              textBox(191, 'Time', timeController),
            ],
          ),
          const SizedBox(height: 10),
          textBox(390, 'Dosage', dosageController),
          const SizedBox(height: 10),
          textBox(390, 'Administered By', administeredByController),
        ],
      ),
    );
  }

  Widget confirmButton() {
    return ElevatedButton(
      onPressed: () {
        addMedicineToHistory();
      },
      child: const Text('Confirm Updates'),
    );
  }

  Widget textBox(width, description, TextEditingController controller) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: description,
        ),
        autovalidateMode: AutovalidateMode.always,
      ),
    );
  }

  void addMedicineToHistory() {
    String medicine = medicineController.text;
    String date = dateController.text;
    String time = timeController.text;
    String dosage = dosageController.text;
    String administeredBy = administeredByController.text;

    medicineDatabase.medicineHistory
        .add([date, time, medicine, dosage, administeredBy]);
    medicineDatabase.updateDatabase();

    setState(() {});
  }
}
