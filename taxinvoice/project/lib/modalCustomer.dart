class Customer {
    final int? id1;
    final int customerId; // make id nullable
    final String cuname;
    final String cuadd;
    final String cuphone;
    
    final String itemID;
    final double amt;
    // final String bname;
    // final String badd;
    // final String bacc;
    // final String bifsc;
    final String cuemail;
  
  

  Customer({this.id1,required this.customerId, required this.cuname, required this.cuadd, required this.cuphone,required this.cuemail,required this.amt,required this.itemID});

  Map<String, dynamic> toMap() {
    return {
      if (id1 != null) 'id': id1, 
      // only include id if it's not null
      'customerID' : customerId,
      'cuname': cuname,
      'cuadd': cuadd,
      'cuphone': cuphone,
      'cuemail' :cuemail,
      
      'itemID' : itemID,
      'amt' : amt,
    };
  }

  static Customer fromMap(Map<String, dynamic> map) {
    return Customer(

      id1: map['id1'],
      customerId: map['customerId'], 
      cuname: map['cuname'],
      cuadd: map['cuadd'],
      cuphone: map['cuphone'],
      cuemail: map['cuemail'],
      itemID: map['itemID'],
      amt: map['amt'],
      // bname : map['bname'],
      // badd : map['badd'],
      // bacc : map['bacc'],
      // bifsc : map['bifsc'],



    );
  }
}