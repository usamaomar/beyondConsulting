// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'dart:js';

import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';

Future convertAndDownload(String csvString) async {
  List<List<dynamic>> csvData = CsvToListConverter().convert(csvString);

  // Create a file name with timestamp to make it unique
  String fileName = 'export_${DateTime.now().millisecondsSinceEpoch}.csv';

  // Get the directory for storing the file
  Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
  String filePath = '${appDocumentsDirectory.path}/$fileName';

  // Write the CSV data to a file
  File file = File(filePath);
  String csvContent = const ListToCsvConverter().convert(csvData);
  await file.writeAsString(csvContent);
}
