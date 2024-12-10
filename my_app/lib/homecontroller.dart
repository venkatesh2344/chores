// controllers/home_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:my_app/Tablescreen.dart';

class HomeController extends GetxController {
  // Store selected date
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  late List<String> works = [
    "Venkatesh",
    "Vamsi",
    "Chiranjevi",
    "Ashok",
    "Venkat",
  ];
  // TextField controller
  TextEditingController textFieldController = TextEditingController();

  // Method to pick a date
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  // Method to calculate the week number
  int getWeekNumber(DateTime date) {
    DateTime firstDayOfYear = DateTime(date.year, 1, 1);
    int daysSinceStartOfYear = date.difference(firstDayOfYear).inDays;
    return ((daysSinceStartOfYear + firstDayOfYear.weekday) / 7).ceil();
  }

  getwork(int weeknumber) {
    works = [
      "Venkatesh",
      "Vamsi",
      "Chiranjevi",
      "Ashok",
      "Venkat",
    ];
    int wd = weeknumber - 35;
    int a = wd % 5;
    int s = 0;
    print(a);
    while (s != a) {
      String t = works[4];
      for (int i = 4; i > 0; i--) {
        works[i] = works[i - 1];
      }
      works[0] = t;
      s = s + 1;
    }
  }

  // Method to handle form submission
  void submitData(BuildContext context) {
    if (selectedDate.value != null) {
      String formattedDate =
          "${selectedDate.value!.day}/${selectedDate.value!.month}/${selectedDate.value!.year}";
      String textFieldData = textFieldController.text;
      getwork(getWeekNumber(selectedDate.value!));
      print("Date: $formattedDate");
      print(getWeekNumber(selectedDate.value!));
      Get.to(TablePage());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data Submitted! Navigating to the table...'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a date and enter text!'),
        ),
      );
    }
  }
}
