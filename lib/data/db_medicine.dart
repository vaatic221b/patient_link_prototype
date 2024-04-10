import 'package:hive/hive.dart';

class MedicineDatabase {
  List medicineList = [];
  List medicineHistory = [];

  final _medicineBox = Hive.box('medicineBox');

  void createInitialData() {
    medicineList = [
      ["Aspirin", "Take 1 tablet daily", "2022-01-01"],
      ["Ibuprofen", "Take 1 tablets daily", "2022-01-02"],
    ];

    medicineHistory = [
      ["5/27/2024", "10:30 AM", "Aspirin", "1", "Nurse Smith"],
      ["5/28/2024", "12:00 PM", "Ibuprofen", "2", "Nurse Johnson"],
      ["5/29/2024", "2:00 PM", "Aspirin", "1", "Nurse Lee"],
    ];
  }

  void loadData() {
    medicineList = _medicineBox.get("medicineList");
    medicineHistory = _medicineBox.get("medicineHistory");
  }

  void updateDatabase() {
    _medicineBox.put("medicineList", medicineList);
    _medicineBox.put("medicineHistory", medicineHistory);
  }
}
