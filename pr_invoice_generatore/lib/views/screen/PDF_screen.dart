import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pr_invoice_generatore/Global/globals.dart';
import 'package:printing/printing.dart';

class PDF extends StatefulWidget {
  const PDF({Key? key}) : super(key: key);

  @override
  State<PDF> createState() => _PDFState();
}

class _PDFState extends State<PDF> {

  Future<Uint8List> pdfGenerator() async {
    pw.Document pdf = pw.Document();

    var image = await networkImage("https://i.pinimg.com/564x/13/19/17/131917e94193b701114ab672913deb45.jpg");
    var image1 = await networkImage("https://www.freepnglogos.com/uploads/company-logo-png/company-logo-transparent-png-19.png");

    pdf.addPage(
        pw.Page(
          margin: pw.EdgeInsets.zero,
            build: (pw.Context context) => pw.Center(
                child: pw.Stack(
                    children: [
                      pw.Image(
                        image,
                        fit: pw.BoxFit.cover,
                      ),
                      pw.Container(
                        height: double.infinity,
                        width: 120,
                        child: pw.Center(
                          child: pw.Text(
                              "T\nH\nA\nN\nK\n\nY\nO\nU",
                              style: pw.TextStyle(
                                  fontSize: 80,
                                  fontWeight: pw.FontWeight.bold,
                                color: PdfColors.white,
                              )
                          )
                        )
                      ),
                      pw.Align(
                        alignment: pw.Alignment.topRight,
                        child: pw.Container(
                            height: 165,
                            width: 130,
                          decoration: pw.BoxDecoration(
                            color: PdfColors.blue50,
                            image: pw.DecorationImage(
                                image: image1,
                              fit: pw.BoxFit.cover
                            )
                          )
                        ),
                      ),
                      pw.Align(
                        alignment: pw.Alignment.topCenter,
                        child: pw.Container(
                          decoration: pw.BoxDecoration(
                            color: PdfColors.blue50
                          ),
                          padding: pw.EdgeInsets.all(20),
                            height: 165,
                            width: 335,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children:[
                              pw.Text(
                                "Customer Name : ${Globals.name}",
                                style: pw.TextStyle(
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold
                                )
                              ),
                              pw.Text(
                                "Number : ${Globals.number}",
                                style: pw.TextStyle(
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold
                                )
                              ),
                              pw.Text(
                                "Date : ${Globals.date}",
                                style: pw.TextStyle(
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold
                                )
                              ),
                            ]
                          )
                        ),
                      ),
                      pw.Align(
                        alignment: pw.Alignment.bottomRight,
                        child: pw.Container(
                          padding: pw.EdgeInsets.all(10),
                            height: 670,
                            width: 465,
                          child: pw.Column(
                            children: [
                              pw.Row(
                                children: [
                                  pw.Container(
                                    child: pw.Row(
                                      children: [
                                        pw.Text("Product number"),
                                        pw.SizedBox(width: 40),
                                        pw.Text("Product Name "),
                                        pw.SizedBox(width: 40),
                                        pw.Text("Price"),
                                        pw.SizedBox(width: 40),
                                        pw.Text("Quantity"),
                                        pw.SizedBox(width: 40),
                                        pw.Text("Total"),
                                      ],
                                    ),
                                    padding: pw.EdgeInsets.all(10),
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(width: 1),
                                      color: PdfColors.blue100
                                    )
                                  ),
                                ]
                              ),
                              ...List.generate(Globals.allItems.length, (index) => pw.Column(
                                children: [
                                  pw.Row(
                                    children: [
                                      pw.Container(
                                        width: 100,
                                        padding: pw.EdgeInsets.all(5),
                                        child: pw.Center(
                                            child: pw.Text("${Globals.allItems[index]["p_number"]}")
                                        ),
                                      ),
                                      pw.SizedBox(width: 10),
                                      pw.Container(
                                        width: 120,
                                        padding: pw.EdgeInsets.all(5),
                                        child: pw.Center(
                                          child: pw.Text("${Globals.allItems[index]["name"]}")
                                        ),
                                      ),
                                      pw.SizedBox(width: 10),
                                      pw.Container(
                                        width: 60,
                                        padding: pw.EdgeInsets.all(5),
                                        child: pw.Center(
                                            child: pw.Text("${Globals.allItems[index]["price"]}")
                                        ),
                                      ),
                                      pw.SizedBox(width: 10),
                                      pw.Container(
                                        width: 75,
                                        padding: pw.EdgeInsets.all(5),
                                        child: pw.Center(
                                            child: pw.Text("${Globals.allItems[index]["quantity"]}")
                                        ),
                                      ),
                                      pw.SizedBox(width: 10),
                                      pw.Container(
                                        width: 50,
                                        padding: pw.EdgeInsets.all(5),
                                        child: pw.Center(
                                          child: pw.Text("${Globals.allItems[index]["sub_total"]}"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  pw.SizedBox(
                                    height: 530,
                                  ),
                                  pw.Align(
                                    alignment: pw.Alignment.bottomRight,

                                    child: pw.Column(
                                      children: [
                                        pw.Container(
                                          width: 550,
                                          decoration: pw.BoxDecoration(
                                            border: pw.Border.all(width: 1),
                                            color: PdfColors.blue100
                                          ),
                                          child: pw.Column(
                                            mainAxisSize: pw.MainAxisSize.min,
                                            children: [
                                              pw.Container(
                                                width: 300,
                                                padding: pw.EdgeInsets.all(5),
                                                child: pw.Center(
                                                  child: pw.Text(
                                                      "GST  ${Globals.allItems[index]["gst"]}%  : ${Globals.allItems[index]["gst_value"]}",
                                                  ),
                                                ),
                                              ),
                                              pw.SizedBox(height: 10),
                                              pw.Container(
                                                width: 300,
                                                padding: pw.EdgeInsets.all(5),
                                                child: pw.Center(
                                                  child: pw.Text("Total : ${Globals.allItems[index]["total"]}"),
                                                ),
                                              ),
                                            ]
                                          )
                                        )
                                      ]
                                    )
                                  )
                                ]
                              )),
                            ],
                          )
                        ),
                      ),
                    ]
                )
            )
        )
    );
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("PDF Page"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: PdfPreview(
          build: (format) => pdfGenerator(),
        ),
      ),
    );
  }
}
