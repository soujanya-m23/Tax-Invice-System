import 'package:flutter/material.dart';
import 'package:taxinvoice/Dashboard1.dart';

class InvoiceForm extends StatefulWidget {
  const InvoiceForm({Key? key}) : super(key: key);

  @override
  _InvoiceFormState createState() => _InvoiceFormState();
}

class _InvoiceFormState extends State<InvoiceForm> {
  // text controllers for user inputs
  TextEditingController _clientNameController = TextEditingController();
  TextEditingController _invoiceNumberController = TextEditingController();
  TextEditingController _invoicePhoneController = TextEditingController();
  TextEditingController _invoiceDateController = TextEditingController();
  TextEditingController _totalAmountController = TextEditingController();
  TextEditingController _quotationNumberController = TextEditingController();
  TextEditingController _quotationDateController = TextEditingController();
  
  var _formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child:Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Client Name',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: _clientNameController,
                decoration: InputDecoration(
                  hintText: 'Enter client name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Phone',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: _invoicePhoneController,
                decoration: InputDecoration(
                  hintText: 'Enter client phone',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Invoice Number',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: _invoiceNumberController,
                decoration: InputDecoration(
                  hintText: 'Enter invoice number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Invoice Date',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: _invoiceDateController,
                decoration: InputDecoration(
                  hintText: 'Enter invoice date',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Total Amount',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: _totalAmountController,
                decoration: InputDecoration(
                  hintText: 'Enter total amount',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Quotation Number',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: _quotationNumberController,
                decoration: InputDecoration(
                  hintText: 'Enter quotation number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Quotation Date',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: _quotationDateController,
                decoration: InputDecoration(
                  hintText: 'Enter quotation date',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Row(
                children:[ 
                  IconButton(onPressed: () { 
                    Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyDashboard()));
                  }, icon: Icon(Icons.arrow_back_ios_outlined)),
                  SizedBox( 
                    width: 200,
                  ),
                  Center(
                  child: CircleAvatar(
                    child: IconButton(
                      onPressed: () {
                        
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                
                          //TODO: Add your code to save form data to database or send data to server
                
                          
                        }
                      },
                      icon: Icon(Icons.save_alt_outlined),
                    ),
                  ),
                ),
                
                //IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back))
                ]
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class InvoiceForm extends StatefulWidget {
//   // late final String clientName;
//   // late final String invoiceNumber;
//   // late final String invoiceDate;
//   // late final String totalAmount;
//   // late final String quotationNumber;
//   // late final String quotationDate;

//   // const InvoiceForm({
//   //   Key? key,
//   //   required this.clientName,
//   //   required this.invoiceNumber,
//   //   required this.invoiceDate,
//   //   required this.totalAmount,
//   //   required this.quotationNumber,
//   //   required this.quotationDate,
//   // }) : super(key: key);

//   @override
//   _InvoiceFormState createState() => _InvoiceFormState();
// }

// class _InvoiceFormState extends State<InvoiceForm> {
//   // text controllers for user inputs
//   TextEditingController _clientNameController = TextEditingController();
//   TextEditingController _invoiceNumberController = TextEditingController();
//   TextEditingController _invoiceDateController = TextEditingController();
//   TextEditingController _totalAmountController = TextEditingController();
//   TextEditingController _quotationNumberController = TextEditingController();
//   TextEditingController _quotationDateController = TextEditingController();

//   // form key for validation
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();

//     // set initial values for text controllers
//     // _clientNameController.text = widget.clientName;
//     // _invoiceNumberController.text = widget.invoiceNumber;
//     // _invoiceDateController.text = widget.invoiceDate;
//     // _totalAmountController.text = widget.totalAmount;
//     // _quotationNumberController.text = widget.quotationNumber;
//     // _quotationDateController.text = widget.quotationDate;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice Form'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Customer Details',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Client Name',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 TextFormField(
//                   controller: _clientNameController,
//                   decoration: InputDecoration(
//                     hintText: 'Enter client name',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter client name';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Invoice Details',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Invoice Number',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 TextFormField(
//                   controller: _invoiceNumberController,
//                   decoration: InputDecoration(
//                     hintText: 'Enter invoice number',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter invoice number';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Invoice Date',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 TextFormField(
//                   controller: _invoiceDateController,
//                   decoration: InputDecoration(
//                     hintText: 'Enter invoice date',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter invoice date';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Total Amount',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 // SizedBox(
//                 //   child: TextFormField(
//                 //                 SizedBox(height: 16),
//                 //             Text(
//                 //               'Quotation Number',
//                 //               style: TextStyle(fontSize: 16),
//                 //             ),
//                 //             TextFormField(
//                 //               controller: _quotationNumberController,
//                 //               decoration: InputDecoration(
//                 //   hintText: 'Enter quotation number',
//                 //   border: OutlineInputBorder(),
//                 //               ),
//                 //               validator: (value) {
//                 //   if (value == null || value.isEmpty) {
//                 //     return 'Please enter quotation number';
//                 //   }
//                 //   return null;
//                 //               },
//                 //             ),
//                 //             SizedBox(height: 16),
//                 //             Text(
//                 //               'Quotation Date',
//                 //               style: TextStyle(fontSize: 16),
//                 //             ),
//                 //             TextFormField(
//                 //               controller: _quotationDateController,
//                 //               decoration: InputDecoration(
//                 //   hintText: 'Enter quotation date',
//                 //   border: OutlineInputBorder(),
//                 //               ),
//                 //               validator: (value) {
//                 //   if (value == null || value.isEmpty) {
//                 //     return 'Please enter quotation date';
//                 //   }
//                 //   return null;
//                 //               },
//                 //             ),
//                 //             SizedBox(height: 32),
//                 //             Center(
//                 //               child: ElevatedButton(
//                 //   onPressed: () {
//                 //     // validate form
//                 //     if (_formKey.currentState!.validate()) {
//                 //       // save user inputs
//                 //       String clientName = _clientNameController.text;
//                 //       String invoiceNumber = _invoiceNumberController.text;
//                 //       String invoiceDate = _invoiceDateController.text;
//                 //       String totalAmount = _totalAmountController.text;
//                 //       String quotationNumber = _quotationNumberController.text;
//                 //       String quotationDate = _quotationDateController.text;
                
//                 //       // do something with user inputs
//                 //       // ...
                
//                 //       // navigate back to previous screen
//                 //       Navigator.pop(context);
//                 //     }
//                 //   },
//                 //   child: Text('Save'),
//                 //               ),
//                 //             ),
//                 //   ),
//                 // )
//           ],
//         ),
//       ),
//     ),
//   ),
// );
//   }
// }
