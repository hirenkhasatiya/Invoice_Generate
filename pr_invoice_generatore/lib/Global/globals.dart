import 'package:flutter/widgets.dart';

class Globals {
  static String? name;
  static int?  number;
  static String?  date;

  static List items = [];
  static List<TextEditingController> itemsController = List.filled(1, TextEditingController(),growable: true);

  static List<Map> allItems = [];
}