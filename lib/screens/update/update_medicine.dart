import 'package:flutter/material.dart';
import 'package:patient_link_prototype/constants/app_styles.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class UpdateMedicine extends StatefulWidget {
  const UpdateMedicine({super.key});

  @override
  State<UpdateMedicine> createState() => _UpdateMedicinePageState();
}

class _UpdateMedicinePageState extends State<UpdateMedicine> {
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

  Widget medicine() {
    return Container(
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
          SizedBox(
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
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meds,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Instructions: $instructions',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Date Began: $dateBegan',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
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
          textBox(390, 'Generic Name'),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              dateBox(191, 'Date'),
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

  Widget dateBox(double width, String description) {
    String selectedDate = ''; // To store the selected date

    return Container(
      width: width,
      child: TextFormField(
        onTap: () {
          DatePicker.showDatePicker(
            context,
            showTitleActions: true,
            minTime: DateTime(2000, 1, 1), // Optional: minimum date
            maxTime: DateTime(2100, 12, 31), // Optional: maximum date
            onConfirm: (date) {
              selectedDate = date.toString(); // Store the selected date
            },
            currentTime: DateTime.now(), // Optional: initial date
          );
        },
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
        controller:
            TextEditingController(text: selectedDate), // Set initial value
        readOnly: true, // Ensure that the user can't manually edit the field
      ),
    );
  }
}
