import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/homecontroller.dart';

class TablePage extends StatelessWidget {
  @override
  final HomeController homeController = Get.put(HomeController());

  TablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      "balcony",
      "Dish Wash",
      "Sweeping",
      "Rice",
      "Curries",
      "Free"
    ];
    final List<String> works = homeController.works;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Submitted Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(color: Colors.grey),
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
          },
          children: [
            // Header row with different background color
            const TableRow(
              decoration: BoxDecoration(color: Colors.blueAccent),
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Work',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            // Data rows with alternating colors
            for (int i = 0; i < names.length; i++)
              TableRow(
                decoration: BoxDecoration(
                  color: i % 2 == 0 ? Colors.grey[200] : Colors.white,
                ),
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        works[i],
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        i < works.length ? names[i] : '',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
