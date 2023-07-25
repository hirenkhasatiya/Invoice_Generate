import 'package:flutter/widgets.dart';

class Globals {
  static String? name;
  static String?  number;
  static  String? paymentMethod;
  static  String? maleFemale;

  static List items = [];
  static List<TextEditingController> itemsController = List.filled(1, TextEditingController(),growable: true);

  static List<List> allItems = [];
}