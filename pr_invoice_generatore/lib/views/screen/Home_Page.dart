import 'package:flutter/material.dart';
import 'package:pr_invoice_generatore/Utils/rout_utils.dart';
import 'package:pr_invoice_generatore/views/components/my_back_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("Invoice Generator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Spacer(flex: 2,),
              Image.asset("assets/Image/empty_invoice.png",color: Colors.white,scale: 2),
              Spacer(),
              const Text(
                "Please press + for add items",
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                  fontSize: 22
                ),
              ),
              Spacer(flex: 2,),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
