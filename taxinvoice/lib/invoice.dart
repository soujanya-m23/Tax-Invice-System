import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/services.dart';
//import 'package:generate_pdf_invoice_example/page/pdf_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}


class MyInvoice extends StatefulWidget {
  static final String title = 'Invoice';

 

  @override
  State<MyInvoice> createState() => _MyInvoiceState();
}

class _MyInvoiceState extends State<MyInvoice> {
  @override
  Widget build(BuildContext context)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        // lab: label('invoice'),
        theme: ThemeData(primarySwatch: Colors.deepOrange), 
    
  );
}