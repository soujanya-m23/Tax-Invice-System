class Customer {
    final int? id1; // make id nullable
    final String cuname;
    final String cuadd;
    final String cuphone;
    // final String bname;
    // final String badd;
    // final String bacc;
    // final String bifsc;
    final String cuemail;
  
  

  Customer({this.id1,required this.cuname, required this.cuadd, required this.cuphone,required this.cuemail});

  Map<String, dynamic> toMap() {
    return {
      if (id1 != null) 'id': id1, // only include id if it's not null
      'cuname': cuname,
      'cuadd': cuadd,
      'cuphone': cuphone,
      'cuemail' :cuemail,
    };
  }

  static Customer fromMap(Map<String, dynamic> map) {
    return Customer(
      id1: map['id1'],
      cuname: map['cuname'],
      cuadd: map['cuadd'],
      cuphone: map['cuphone'],
      cuemail: map['cuemail'],
      // bname : map['bname'],
      // badd : map['badd'],
      // bacc : map['bacc'],
      // bifsc : map['bifsc'],



    );
  }
}