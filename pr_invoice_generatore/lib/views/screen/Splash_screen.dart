import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr_invoice_generatore/Utils/rout_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  FlutterLogoStyle Mystyle = FlutterLogoStyle.markOnly;

  changePage()
  {
    Future.delayed(Duration(seconds: 3), (){
      setState(() {
        Mystyle = FlutterLogoStyle.horizontal;
      });
    });

    Timer.periodic(Duration(seconds: 3), (timer) {
      Navigator.of(context).pushReplacementNamed(MyRoutes.bottomNavBar);
      timer.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    changePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/Image/Invoice.gif",scale: 1),
              const SizedBox(height: 30,),
              const CupertinoActivityIndicator(
                radius: 30,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
