class Company {
  final int? id; // make id nullable
  final String coname;
  final String coadd;
  final String cophone;
  final String qnum;
  final String qdate;
  final String gstnum;


  Company({this.id, required this.coname, required this.coadd, required this.cophone,required this.qnum,required this.qdate,required this.gstnum});

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id, // only include id if it's not null
      'coname': coname,
      'coadd': coadd,
      'cophone': cophone,
      'gstnum' : gstnum,
      'qnum' : qnum,
      'qdate' : qdate,
      

    };
  }

  static Company fromMap(Map<String, dynamic> map) {
    return Company(
      id: map['id'],
      coname: map['coname'],
      coadd: map['coadd'],
      cophone: map['cophone'],
      gstnum: map['gstnum'],
      qnum: map['qnum'],
      qdate: map['qdate'],
      
    );
  }
}


class Customer {
    final int? id1; // make id nullable
    final String cuname;
    final String cuadd;
    final String cuphone;
    final String bname;
    final String badd;
    final String bacc;
    final String bifsc;
  
  

  Customer({this.id1,required this.cuname, required this.cuadd, required this.cuphone,required this.bname, required this.badd, required this.bacc, required this.bifsc});

  Map<String, dynamic> toMap() {
    return {
      if (id1 != null) 'id': id1, // only include id if it's not null
      'cuname': cuname,
      'cuadd': cuadd,
      'cuphone': cuphone,
      'bname' : bname,
      'badd' : badd,
      'bacc' : bacc,
      'bifsc' : bifsc,
    };
  }

  static Customer fromMap(Map<String, dynamic> map) {
    return Customer(
      id1: map['id1'],
      cuname: map['cuname'],
      cuadd: map['cuadd'],
      cuphone: map['cuphone'],
      bname : map['bname'],
      badd : map['badd'],
      bacc : map['bacc'],
      bifsc : map['bifsc'],


    );
  }
}