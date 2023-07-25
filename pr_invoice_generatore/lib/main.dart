import 'package:flutter/material.dart';
import 'package:pr_invoice_generatore/views/screen/Bottom_Nav_Bar.dart';
import 'package:pr_invoice_generatore/Utils/rout_utils.dart';
import 'package:pr_invoice_generatore/views/screen/Home_Page.dart';
import 'package:pr_invoice_generatore/views/screen/PDF_screen.dart';
import 'package:pr_invoice_generatore/views/screen/Splash_screen.dart';


void main()
{
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: MyRoutes.splashScreen,
      routes: {
        MyRoutes.bottomNavBar:(context) => const BottomNavBar(),
        MyRoutes.splashScreen:(context)=>const SplashScreen(),
        MyRoutes.pdfScreen: (context)=> const PDF(),
      },
    );
  }
}
