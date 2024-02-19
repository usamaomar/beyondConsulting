import 'package:flutter/material.dart';

class MySingletonClass {
  // Private constructor
  MySingletonClass._privateConstructor();

  // Singleton instance
  static final MySingletonClass _instance = MySingletonClass._privateConstructor();

  // Factory constructor to return the singleton instance
  factory MySingletonClass() => _instance;

  // Variable to hold the BuildContext
  late BuildContext _context;

  // Getter for the BuildContext
  BuildContext get context => _context;

  // Setter for the BuildContext
  set context(BuildContext value) {
    _context = value;
  }
}