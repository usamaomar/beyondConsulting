import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

List<PrioritieModelStruct> fromJsonToModelList(dynamic jsonBody) {
  return jsonBody
      .map((e) => e != null && e != '' ? PrioritieModelStruct.fromMap(e) : null)
      .toList()
      .toList()
      .cast<PrioritieModelStruct>();
}

String calculateFutureDate(String dateString) {
  DateTime currentDate = DateTime.now();
  DateTime inputDate = DateTime.parse(dateString);

  // Check if the date is in the future and not today
  if (inputDate.isAfter(currentDate) &&
      !(currentDate.year == inputDate.year &&
          currentDate.month == inputDate.month &&
          currentDate.day == inputDate.day)) {
    // Check if the date is tomorrow
    if (inputDate.difference(currentDate).inDays == 1) {
      return "Tomorrow";
    } else {
      // Format the date as "day, month" (e.g., "5, May")
      return DateFormat("d, MMM").format(inputDate);
    }
  } else {
    return DateFormat("d, MMM").format(inputDate);
  }
}

List<ProjectModelStruct>? fromProjectJsonToModelList(dynamic jsonBody) {
  return jsonBody
      .map((e) => e != null && e != '' ? ProjectModelStruct.fromMap(e) : null)
      .toList()
      .toList()
      .cast<ProjectModelStruct>();
}

String? getFullImage(String image) {
  if (image == "null" || image == null || image.isEmpty) {
    return "https://beyond.api.matterhr.com/Files/Uploads/82b9c31f-49aa-4c2f-8577-fa13f8698289.jpg";
  } else {
    return "https://beyond.api.matterhr.com/${image}";
  }
}

String? formatLastUpdated(
  String? dateString,
  String? lang,
) {
  if (dateString == null) {
    return null; // or a default value if you prefer
  }

  // Parse the input date string
  DateTime lastUpdated = DateTime.parse(dateString);

  // Get current date and time
  DateTime now = DateTime.now();

  // Check if the date is today
  if (now.year == lastUpdated.year &&
      now.month == lastUpdated.month &&
      now.day == lastUpdated.day) {
    return lang == 'ar' ? 'اخر تعديل اليوم' : 'Last Updated Today';
  }

  // Check if the date is yesterday
  DateTime yesterday = now.subtract(Duration(days: 1));
  if (yesterday.year == lastUpdated.year &&
      yesterday.month == lastUpdated.month &&
      yesterday.day == lastUpdated.day) {
    return lang == 'ar' ? 'اخر تعديل البارحذ' : 'Last Updated Yesterday';
  }

  // Format the date as '11, May' (for example)
  String formattedDate = DateFormat('dd, MMM').format(lastUpdated);
  return lang == 'ar'
      ? 'اخر تعديل $formattedDate'
      : 'Last Updated $formattedDate';
}
