import 'package:flutter/material.dart';
import 'package:patient_link_prototype/constants/app_styles.dart';

class UpdateOperations extends StatefulWidget {
  const UpdateOperations({super.key});

  @override
  State<UpdateOperations> createState() => _UpdateOperationsPageState();
}

class _UpdateOperationsPageState extends State<UpdateOperations> {
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
                operations(),
                const SizedBox(height: 24),
                update(),
                const SizedBox(height: 5),
                confirmButton()
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

  Widget operations() {
    return SizedBox(
      height: 140,
      width: 390,
      child: Column(
        children: [
          header('assets/icons/glove_icon.png', 'Upcoming Operation'),
          const SizedBox(height: 5),
          operation('Dialysis', 'July 13, 2024', 'Dr. Jane Doe', 'Dr. Jane Doe')
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

  Widget operation(name, schedule, administer, suggested) {
    return Container(
      width: 390,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFFE8570)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: interBold.copyWith(fontSize: 14, color: black),
            ),
            Text('Date of operation: $schedule',
                style: interItalic.copyWith(fontSize: 12)),
            Text('To be administered by: $administer',
                style: interItalic.copyWith(fontSize: 12)),
            Text('Suggested by: $schedule',
                style: interItalic.copyWith(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget update() {
    TextEditingController dateController = TextEditingController();

    return SizedBox(
      height: 300,
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
          const SizedBox(height: 10),
          textBox(390, 'Generic Name'),
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
                      // Handle selected date
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
                        suffixIcon: Icon(Icons.calendar_today,
                            color: Color(0xFFFE8570)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              textBox(191, 'Time'),
            ],
          ),
          const SizedBox(height: 10),
          textBox(390, 'Suggested by'),
          const SizedBox(height: 10),
          textBox(390, 'Remarks'),
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
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 16),
              Image.asset(
                'assets/icons/yes.png',
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 4),
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
    return SizedBox(
      width: width,
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
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
