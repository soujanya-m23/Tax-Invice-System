import 'package:flutter/material.dart';
import 'package:project/DisplayC.dart';
import 'package:project/Quotation1.dart';
import 'displayQ.dart';

import 'package:table_calendar/table_calendar.dart';

//import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'modal.dart';

import 'DashBoard.dart';
import 'db_helper.dart';

class CustomerForm extends StatefulWidget {
  final Customer? customers;
  const CustomerForm({super.key, this.customers});

  @override
  _customerFormState createState() => _customerFormState();
}

class _customerFormState extends State<CustomerForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _customerName = TextEditingController();
  TextEditingController _customerAddress = TextEditingController();
  TextEditingController _customerPhone = TextEditingController();
  TextEditingController _bankName = TextEditingController();
  TextEditingController _bankAddress = TextEditingController();
  TextEditingController _bankAccountNumber = TextEditingController();
  TextEditingController _bankIFSCCode = TextEditingController();

  var customerId;

  @override
  void initState() {
    super.initState();

    _customerName = TextEditingController(text: widget.customers?.cuname ?? '');
    _customerAddress =
        TextEditingController(text: widget.customers?.cuadd ?? '');
    _customerPhone =
        TextEditingController(text: widget.customers?.cuphone ?? '');
    _bankName = TextEditingController(text: widget.customers?.bname ?? '');
    _bankAddress = TextEditingController(text: widget.customers?.badd ?? '');
    _bankAccountNumber =
        TextEditingController(text: widget.customers?.bacc ?? '');
    _bankIFSCCode = TextEditingController(text: widget.customers?.bifsc ?? '');
  }

  @override
  void dispose() {
    _customerName.dispose();
    _customerAddress.dispose();
    _customerPhone.dispose();
    _bankName.dispose();
    _bankAddress.dispose();
    _bankAccountNumber.dispose();
    _bankIFSCCode.dispose();

    super.dispose();
  }

  void _handleSubmit() async {
    final user1 = Customer(
      id1: widget.customers?.id1, // use the id of the user being edited, if provided
      cuname: _customerName.text,
      cuadd: _customerAddress.text,
      cuphone: _customerPhone.text,
      bname: _bankName.text,
      badd: _bankAddress.text,
      bacc: _bankAccountNumber.text,
       bifsc: _bankIFSCCode.text,
    );
    bool shouldProceed = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(widget.customers == null
                  ? 'Add User'
                  : 'Update User ${widget.customers!.cuname}?'),
              content: Text(widget.customers == null
                  ? 'Are you sure you want to add this user?'
                  : 'Are you sure you want to update ${widget.customers!.cuname}?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('No')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text('Yes')),
              ],
            ));

    if (shouldProceed) {
      int result;
      if (widget.customers == null) {
        result = await DatabaseHelper.addCustomer(user1 );
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User added successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
        _customerName.clear();
        _customerAddress.clear();
        _customerPhone.clear();
        _bankName.clear();
        _bankAddress.clear();
        _bankAccountNumber.clear();
        _bankIFSCCode.clear();
          
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to add user.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        result = await DatabaseHelper.updateCustomer(user1.id1!, user1);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User updated successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
           _customerName.clear();
       _customerAddress.clear();
       _customerPhone.clear();
       _bankName.clear();
       _bankAddress.clear();
       _bankAccountNumber.clear();
        _bankIFSCCode.clear();
         
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to update user.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Customer Details")),
        body: ListView(padding: EdgeInsets.all(16.0), children: <Widget>[
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Customer Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.category,
                ),
                SizedBox(width: 20),
                DropdownButton<String>(
                  
                  value: customerId,
                  onChanged: (newValue) {
                    setState(() {
                      customerId = newValue;
                    });
                    print("Selected Category: $newValue");
                  },
                  items: [
                    DropdownMenuItem(
                      
                      value: "Hardware",
                      child: Text("Hardware"),
                    ),
                    DropdownMenuItem(
                      value: "Software",
                      child: Text("Software"),
                    ),
                  ],
                  hint: Text("Select Category"),
                  underline: Container(height: 2, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _customerName,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Enter the Name',
                  labelText: 'Name',
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              // validator: (value) =>
              //     value!.isEmpty ? 'Please enter customer name' : null,
              // onSaved: (value) =>
              //     _customerName = value! as TextEditingController,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _customerAddress,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Enter the Address',
                  labelText: 'Address',
                  icon: Icon(Icons.location_city),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              // validator: (value) =>
              //     value!.isEmpty ? 'Please enter customer name' : null,
              // onSaved: (value) =>
              //     _customerName = value! as TextEditingController,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _customerPhone,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Enter the phone',
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  icon: Icon(Icons.phone)),
              // validator: (value) =>
              //     value!.isEmpty ? 'Please enter customer phone number' : null,
              // keyboardType: TextInputType.phone,
              // onSaved: (value) =>
              //     _customerPhone = value! as TextEditingController,
            ),
            SizedBox(height: 32.0),
            Text(
              'Bank Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _bankName,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Enter the Bank Name',
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  icon: Icon(Icons.person)),
              // validator: (value) =>
              //     value!.isEmpty ? 'Please enter bank name' : null,
              // onSaved: (value) =>
              //     _bankName = value! as TextEditingController
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _bankAddress,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Enter the Address',
                  labelText: 'Bank Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  icon: Icon(Icons.location_city)),
              // validator: (value) =>
              //     value!.isEmpty ? 'Please enter bank address' : null,
              // onSaved: (value) =>
              //     _bankAddress = value! as TextEditingController,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _bankAccountNumber,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Enter Account Number',
                  labelText: 'Bank Account Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  icon: Icon(Icons.account_circle)),
              // validator: (value) =>
              //     value!.isEmpty ? 'Please enter bank account number' : null,
              // keyboardType: TextInputType.number,
              // onSaved: (value) =>
              //     _bankAccountNumber = value! as TextEditingController,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _bankIFSCCode,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Enter IFSC Code',
                  labelText: 'Bank IFSC Code',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  icon: Icon(Icons.account_circle)),
              // validator: (value) =>
              //     value!.isEmpty ? 'Please enter bank IFSC code' : null,
              // onSaved: (value) =>
              //     _bankIFSCCode = value! as TextEditingController,
            ),
            SizedBox(width: 30),
            SizedBox(height: 32.0),
            Row(children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuotationTaxInvoiceForm()));
                  },
                  icon: Icon(Icons.arrow_back_ios_outlined)),
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: _handleSubmit,
                child: Text("Submit"),
              ),
              SizedBox(
                width: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisplayCustomer()));
                },
                child: Text("see data inserted "),
              ),
            ])
          ])
        ]));
  }
}
