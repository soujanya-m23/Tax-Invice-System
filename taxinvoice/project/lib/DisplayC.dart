import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project/customer.dart';

import 'db_helper.dart';
import 'modal.dart';

class DisplayCustomer extends StatefulWidget {
  const DisplayCustomer({super.key});

  @override
  State<DisplayCustomer> createState() => _DisplayCustomerState();
}

class _DisplayCustomerState extends State<DisplayCustomer> {
  List<Customer> _customer = [];

@override
  void initState() {
    super.initState();
    _fetchCustomers();
  }

  Future<void> _fetchCustomers() async {
    final cust = await DatabaseHelper.getCustomers();
    setState(() {
      _customer = cust;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Customers'),
        ),
        body: ListView.builder(
          itemCount: _customer.length,
          itemBuilder: (context, index) {
            final user1 = _customer[index];
            
            return ListTile(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerForm(customers: user1),
                  ),
                );
                if (result != null) {
                  final updatedCustomer = result['user1'] as Customer;
                  final user1Id = result['id1'] as int;
                  await DatabaseHelper.updateCustomer(user1Id, updatedCustomer as Customer);
                  await _fetchCustomers();
                }
              },
              // title: Text(user.coname),
              // subtitle: Text('${user.coadd}/n, ${user.cophone}/n,${user.qnum}/n,${user.qdate}/n,${user.gstnum}/n'),
              title: Card(
                color: Colors.lightBlue,
                child: Column(
                children: [
                  SizedBox(height: 30,),
                
                  Column(
                    children: [
                      Text('Customer Name:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 10),
             
                     Text('${user1.cuname}',style:const TextStyle(fontSize: 20)),
                    ],
                  ),
                
                  SizedBox(height: 30),
                
                  Column(
                    children: [
                      Text('Customer Address:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                
                      SizedBox(width: 20),
                      Text('${user1.cuadd}',style:TextStyle(fontSize: 20)),
                   ],
                  ),
                
                  SizedBox(height: 30),
                
                  Column(
                    children: [
                      Text('Customer Phone:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 20),
                      Text('${user1.cuphone}',style:TextStyle(fontSize: 20),),
                    ],
                  ),
                
                  SizedBox(height: 30),
                
                  Column(
                    children: [
                      Text('Bank Name:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 20),
                      Text('${user1.bname}',style:TextStyle(fontSize: 20)),
                    ],
                  ),
                  
                  SizedBox(height: 30),
                
                  Column(
                    children: [
                      Text('Bank Address:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 20),
                      Text('${user1.badd}',style:TextStyle(fontSize: 20)),
                    ],
                  ),
                
                  SizedBox(height: 30),
                
                  Column(
                    children: [
                      Text('Bank Account number',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 20),
                      Text('${user1.bacc}',style:TextStyle(fontSize: 20)),
                    ],
                  ),
                
                  SizedBox(height: 30),

                  Column(
                    children: [
                      Text('Bank IFSC number',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 20),
                      Text('${user1.bifsc}',style:TextStyle(fontSize: 20)),
                    ],
                  ),
                
                  SizedBox(height: 50),
                
                  // add other desired attributes here
                 ] ),
              ),
  



              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  bool confirmDelete = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Confirm Delete"),
                        content:
                            Text("Are you sure you want to delete this user?"),
                        actions: [
                          TextButton(
                            child: Text("Cancel"),
                            onPressed: () => Navigator.pop(context, false),
                          ),
                          TextButton(
                            child: Text("Delete"),
                            onPressed: () => Navigator.pop(context, true),
                          ),
                        ],
                      );
                    },
                  );
                  if (confirmDelete != null && confirmDelete) {
                    
                    await DatabaseHelper.deleteCustomer(user1.id1!);
                    await _fetchCustomers();
                  }
                },
              ));

             
   } )






    );
  }
}