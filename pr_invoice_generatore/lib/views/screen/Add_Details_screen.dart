import 'package:flutter/material.dart';
import 'package:pr_invoice_generatore/Global/globals.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({Key? key}) : super(key: key);

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("Details Page"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  Globals.itemsController.add(TextEditingController());
                });
              },
              icon: Icon(
                Icons.add
              ))
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(bottom: 20,top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                  Globals.itemsController.length, (index) =>
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: 20
                      ),
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
                      padding: EdgeInsets.all(10),
                      width: 350,
                      child: Column(
                        children: [
                          TextFormField(
                            // initialValue: Globals.,
                            validator: (val){
                              if(val!.isEmpty)
                              {
                                return "Please Product Name";
                              }
                              else
                              {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                hintText: "Product Name",
                                labelText: "Product",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)
                                )
                            ),
                            onChanged: (val){
                              setState(() {
                                // Globals.itemName = val;
                              });
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (val){
                              if(val!.isEmpty)
                              {
                                return "Enter Price";
                              }
                              else
                              {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                hintText: "Enter Price",
                                labelText: "Price",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)
                                )
                            ),
                            onChanged: (val){
                              setState(() {
                                // Globals.price = val as double?;
                              });
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (val){
                              if(val!.isEmpty)
                              {
                                return "Enter Quantity";
                              }
                              else
                              {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                hintText: "Enter Quantity",
                                labelText: "Quantity",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)
                                )
                            ),
                            onChanged: (val){
                              setState(() {
                                // Globals.quantity = val as int?;
                              });
                            },
                          ),

                          SizedBox(height: 20,),
                          ElevatedButton(
                              onPressed: (){
                                setState(() {
                                  Globals.itemsController.removeAt(index);
                                });
                              },
                              child: const Text("Delete")
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
