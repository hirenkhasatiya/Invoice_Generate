import 'package:flutter/material.dart';
import '../../Global/globals.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("Customer Details Page"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.amber,
                blurRadius: 10,
                spreadRadius: 3,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          width: double.infinity,
          padding: EdgeInsets.all(5),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    initialValue: Globals.name,
                    validator: (val){
                      if(val!.isEmpty)
                      {
                        return "Please Enter Name";
                      }
                      else
                      {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: "Customer Name",
                        labelText: "Name",
                        prefixIcon: Icon(
                          Icons.person,
                          size: 25,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        )
                    ),
                    onChanged: (val){
                      setState(() {
                        Globals.name = val;
                      });
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    initialValue: Globals.number,
                    validator: (val){
                      if(val!.isEmpty)
                      {
                        return "Please Enter your number";
                      }
                      else
                      {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    maxLength: 10,
                    decoration: InputDecoration(
                        hintText: "Customer number",
                        labelText: "number",
                        prefixIcon: Icon(
                          Icons.phone,
                          size: 25,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        )
                    ),
                    onChanged: (val){
                      setState(() {
                        Globals.number = val;
                      });
                    },
                  ),
                  const Text(
                    "* Gender",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  RadioListTile(
                    title: const Text("Male"),
                    value: "Male",
                    groupValue: Globals.maleFemale,
                    onChanged: (val){
                      setState(() {
                        Globals.maleFemale = val;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("female"),
                    value: "Female",
                    groupValue: Globals.maleFemale,
                    onChanged: (val){
                      setState(() {
                        Globals.maleFemale = val;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
