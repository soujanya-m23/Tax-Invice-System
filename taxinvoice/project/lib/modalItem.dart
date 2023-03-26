class Item {
  final int? id3; // make id nullable
  String name;
  int quantity;
  double price;
  String cuname;
  String customerID;

  Item(
      {this.id3,
      required this.name,
      required this.quantity,
      required this.price,
      required this.cuname,
      required this.customerID,
      
      });

  Map<String, dynamic> toMap() {
    return {
      if (id3 != null) 'id': id3, // only include id if it's not null
      'name': name,
      'quantity': quantity,
      'price': price,
      'cuname': cuname,
      'customerID': customerID,
    };
  }

  static Item fromMap(Map<String, dynamic> map) {
    return Item(
      id3: map['id3'],
      name: map['name'],
      quantity: map['quantity'],
      price: map['price'],
       cuname: map['cuname'],
       customerID: map['customerID'],

    );
  }
}
