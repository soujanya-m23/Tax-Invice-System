import 'package:flutter/material.dart';

class QuotationTaxInvoiceForm extends StatefulWidget {
  @override
  _QuotationTaxInvoiceFormState createState() =>
      _QuotationTaxInvoiceFormState();
}

class _QuotationTaxInvoiceFormState extends State<QuotationTaxInvoiceForm> {
  final _formKey = GlobalKey<FormState>();
  late String _companyName;
  late String _companyAddress;
  late String _companyPhone;
  late String _customerName;

  late String _customerAddress;
  late String _customerPhone;
  late String _bankName;
  late String _bankAddress;
  late String _bankAccountNumber;
  late String _bankIFSCCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotation Tax Invoice Form'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Company Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.white)),
                      hintText: 'Enter the Name',
                      labelText: 'Name',
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter customer name' : null,
                  onSaved: (value) => _customerName = value!,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color:Colors.white)),
                      hintText: 'Enter the Address',
                      labelText: 'Address',
                      icon: Icon(Icons.location_city),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter customer name' : null,
                  onSaved: (value) => _customerName = value!,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color:Colors.white)),
                      hintText: 'Enter the phone',
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      icon: Icon(Icons.phone)),
                  validator: (value) => value!.isEmpty
                      ? 'Please enter customer phone number'
                      : null,
                  keyboardType: TextInputType.phone,
                  onSaved: (value) => _customerPhone = value!,
                ),
                SizedBox(height: 32.0),
                Text(
                  'Customer Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Enter the Name',
                      labelText: 'Name',
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter customer name' : null,
                  onSaved: (value) => _customerName = value!,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.white)),
                      hintText: 'Enter the Address',
                      labelText: 'Address',
                      icon: Icon(Icons.location_city),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter customer name' : null,
                  onSaved: (value) => _customerName = value!,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.white)),
                      hintText: 'Enter the phone',
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      icon: Icon(Icons.phone)),
                  validator: (value) => value!.isEmpty
                      ? 'Please enter customer phone number'
                      : null,
                  keyboardType: TextInputType.phone,
                  onSaved: (value) => _customerPhone = value!,
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
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.white)),
                        hintText: 'Enter the Bank Name',
                        labelText: 'Name',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                        icon: Icon(Icons.person)),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter bank name' : null,
                    onSaved: (value) => _bankName = value!),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.white)),
                      hintText: 'Enter the Address',
                      labelText: 'Bank Address',
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      icon: Icon(Icons.location_city)),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter bank address' : null,
                  onSaved: (value) => _bankAddress = value!,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.white)),
                      hintText: 'Enter Account Number',
                      labelText: 'Bank Account Number',
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      icon: Icon(Icons.account_circle)),
                  validator: (value) => value!.isEmpty
                      ? 'Please enter bank account number'
                      : null,
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _bankAccountNumber = value!,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.white)),
                      hintText: 'Enter IFSC Code',
                      labelText: 'Bank IFSC Code',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      icon: Icon(Icons.account_circle)),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter bank IFSC code' : null,
                  onSaved: (value) => _bankIFSCCode = value!,
                ),
                SizedBox(height: 32.0),
                Center(
                  child: ElevatedButton(
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
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
