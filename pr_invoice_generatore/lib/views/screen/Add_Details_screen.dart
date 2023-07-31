import 'package:flutter/material.dart';
import 'package:pr_invoice_generatore/Global/globals.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({Key? key}) : super(key: key);

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {

  Map items = {
    "p_number" : 0,
    "name" : "",
    "price" : 0,
    "quantity" : 0,
    "discount" : 0,
    "gst" : 0,
    "gst_value" : 0,
    "sub_total" : 0,
    "total" : 0,
  };


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
                          TextField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            maxLength: 5,
                            decoration: InputDecoration(
                                hintText: "Enter Product Number",
                                labelText: "Product Id",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)
                                )
                            ),
                            onChanged: (val){
                              setState(() {
                                items["p_number"] = int.parse(val);
                              });
                            },
                          ),
                          SizedBox(height: 20,),
                          TextField(
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
                                items["name"] = val;
                              });
                            },
                          ),
                          SizedBox(height: 20,),
                          TextField(
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
                                items["price"] = int.parse(val);
                              });
                            },
                          ),
                          SizedBox(height: 20,),
                          TextField(
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
                                items["quantity"] = int.parse(val);
                              });
                            },
                          ),
                          SizedBox(height: 20,),
                          TextField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                hintText: "Enter GST",
                                labelText: "GST",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)
                                )
                            ),
                            onChanged: (val){
                              setState(() {
                                items["gst"] = int.parse(val);
                              });
                            },
                          ),

                          SizedBox(height: 20,),
                         Row(
                           children: [
                             ElevatedButton(
                                 onPressed: (){
                                       items["sub_total"] = (items["price"] * items["quantity"]);
                                       items["gst_value"] = (items["sub_total"] * items["gst"])/100;
                                       items["total"] = (items["price"] * items["quantity"] + items["gst_value"]);

                                       Globals.allItems.add(items);
                                 },
                                 child: Text("save"),
                             ),
                             Spacer(),
                             ElevatedButton(
                                 onPressed: (){
                                   setState(() {
                                     Globals.itemsController.removeAt(index);
                                   });
                                 },
                                 child: const Text("Delete")
                             ),
                           ],
                         )
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
