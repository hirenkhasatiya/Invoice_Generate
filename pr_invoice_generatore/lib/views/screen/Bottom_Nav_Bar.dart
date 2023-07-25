import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pr_invoice_generatore/views/screen/Add_Details_screen.dart';
import 'package:pr_invoice_generatore/views/screen/Customer_Details_screen.dart';
import 'package:pr_invoice_generatore/views/screen/Home_Page.dart';
import 'package:pr_invoice_generatore/views/screen/PDF_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  List Screens = [
    HomePage(),
    AddDetails(),
    CustomerDetails(),
    PDF(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        animationDuration: Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home),
          Icon(Icons.add_circle),
          Icon(Icons.description),
          Icon(Icons.picture_as_pdf_rounded),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: Screens[selectedIndex],
    );
  }
}
