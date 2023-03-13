import 'package:flutter/material.dart';

import 'Dashboard1.dart';

class DebitForm extends StatefulWidget {
  @override
  _DebitFormState createState() => _DebitFormState();
}

class _DebitFormState extends State<DebitForm> {
  final _formKey = GlobalKey<FormState>();

  String _debitType = '';
  double _debitAmount = 0.0;
  String _date ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debit Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors. black)),
                      hintText: 'Enter the Invoice Number',
                      labelText: 'Invoice Number',
                      icon: Icon(Icons.receipt_long_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter the invoice number' : null,
                  onSaved: (value) => _date = value!,
                ),
              SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors. black)),
                      hintText: 'Enter the Date',
                      labelText: 'Date',
                      icon: Icon(Icons.calendar_month),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter the date' : null,
                  onSaved: (value) => _date = value!,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors. black)),
                      hintText: 'Enter the Vendor',
                      labelText: 'Vendor',
                      icon: Icon(Icons.person_2_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter the vendor' : null,
                  onSaved: (value) => _date = value!,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors. black)),
                      hintText: 'Enter the Account number',
                      labelText: 'Account Number',
                      icon: Icon(Icons.account_circle_outlined  ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter the account number' : null,
                  onSaved: (value) => _date = value!,
                ),
              SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Enter the Debit Type',
                      labelText: 'Debit Type',
                      icon: Icon(Icons.credit_card_sharp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter the debit type' : null,
                  onSaved: (value) => _date = value!,
                ),
              SizedBox(height: 16.0),
              SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Enter the Debit Amount',
                      labelText: 'Debit Amount',
                      icon: Icon(Icons.payment_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter the amount' : null,
                  onSaved: (value) => _date = value!,
                ),
              SizedBox(height: 16.0),
                Row(
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
                  
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Form data saved successfully.'),
                              ),
                            );
                          }
                        },
                        icon: Icon(Icons.save_alt_outlined),
                      ),
                    ),
                  ),
                
                //IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back))
                  ]
                )
            ],
          ),
        ),
      ),
    );
  }
}
