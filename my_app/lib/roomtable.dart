import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/gymcontroller.dart';
import 'package:my_app/homecontroller.dart';
import 'package:my_app/roomcontroller.dart';

class Roomtable extends StatelessWidget {
  @override
  Roomcontroller homeController = Get.put(Roomcontroller());

  Roomtable({super.key});

  @override
  Widget build(BuildContext context) {
    homeController.roomworks = ["washroom", "sweeping", "Free"];
    final List<String> works = homeController.roomnames;

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
            for (int i = 0; i < homeController.roomworks.length; i++)
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
                        i < works.length ? homeController.roomworks[i] : '',
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
