import 'dart:async';
import 'package:project/modalInvoice.dart';
import 'package:sqflite/sqlite_api.dart';

import 'customer.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:project/modalCustomer.dart';
import 'modalCompany.dart';
import 'company.dart';
import 'package:project/modalTransaction.dart';
import 'modalInvoice.dart';

class DatabaseHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(""" 
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
          
        coname TEXT,
        coadd TEXT,
        cophone TEXT,
        email TEXT,
        companyID INTEGER,
        contactphone TEXT
        )
    """);
    //CUSTOMER TABLE---------------------------------------------------

    await database.execute(""" 
      CREATE TABLE customers(
        id INTEGER PRIMARY KEY AUTOINCREMENT,  
        customerId INTEGER,
        cuname TEXT,
        cuadd TEXT,
        cuphone TEXT,
        cuemail TEXT,
        itemID TEXT,
        amt REAL
        )
    """);
    // //Transaction table----------------------------------------------------------
    // await database.execute("""
    //   CREATE TABLE bank_details(
    //     id INTEGER PRIMARY KEY AUTOINCREMENT,
    //     bname TEXT,
    //     badd TEXT,
    //     bacc TEXT,
    //     bifsc TEXT
    //   )
    // """);

    // await database.execute("""
    //   CREATE TABLE invoices(
    //     id INTEGER PRIMARY KEY AUTOINCREMENT,
    //     user_id INTEGER,
    //     customer_id INTEGER,
    //     total_amount REAL,
    //     FOREIGN KEY (user_id) REFERENCES users(id),
    //     FOREIGN KEY (customer_id) REFERENCES customers(id)

    //   )
    // """);
  }

  static Future<sql.Database> db() async {
    // database creation ....
    return sql.openDatabase(
      'tax.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        //var result =await database.query('users',orderBy: '$coname ASC');
        await createTables(database);
      },
    );
  }

  static Future<int> addUser(Company company) async {
    // insert data to table
    final dbClient = await db();
    return dbClient.insert('users', company.toMap(),
        conflictAlgorithm:
            sql.ConflictAlgorithm.replace); // add conflictAlgorithm
  }

  static Future<List<Company>> getUsers() async {
    //fetching data to display details.....
    final dbClient = await db();

    final List<Map<String, dynamic>> maps = await dbClient.query('users');

    return List.generate(maps.length, (i) {
      return Company(
        id: maps[i]['id'],

        coname: maps[i]['coname'],
        coadd: maps[i]['coadd'],
        cophone: maps[i]['cophone'],
        email: maps[i]['email'],
        companyID: maps[i]['companyID'],
        contactphone: maps[i]['contactphone'],

        // gstnum: maps[i]['gstnum'],
        // qnum: maps[i]['qnum'],
        // qdate: maps[i]['qdate'],
      );
    });
  }

  static Future<int> updateUser(int id, Company company) async {
    final dbClient = await db();
    return dbClient.update(
      'users',
      company.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> deleteUser(int id) async {
    final dbClient = await db();
    return await dbClient.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
// static Future<List<Map<String, dynamic>>> rawQuery(String query, List<String> list) async {
//   final dbClient = await db();
//   print(db());

//   return dbClient.rawQuery(query,list);
// }

  static Future<List<Map<String, dynamic>>> rawQuery(String query) async {
    final dbClient = await db();

    print(db());

    return dbClient.rawQuery(query);
  }

//Customer details......................................................

  static Future<int> addCustomer(Customer customer) async {
    final dbClient = await db();
    return dbClient.insert('customers', customer.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Customer>> getCustomers() async {
    final dbClient = await db();
    final List<Map<String, dynamic>> maps = await dbClient.query('customers');

    return List.generate(maps.length, (i) {
      return Customer(
        id1: maps[i]['id'],
        customerId: maps[i]['customerId'],
        cuname: maps[i]['cuname'],
        cuadd: maps[i]['cuadd'],
        cuphone: maps[i]['cuphone'],
        cuemail: maps[i]['cuemail'],
        itemID: maps[i]['itemID'],
        amt: maps[i]['amt'],
      );
    });
  }

  static Future<int> updateCustomer(int id1, Customer customer) async {
    final dbClient = await db();
    return dbClient.update(
      'customers',
      customer.toMap(),
      where: 'id = ?',
      whereArgs: [id1],
    );
  }

  static Future<int> deleteCustomer(int id1) async {
    final dbClient = await db();
    return await dbClient.delete(
      'customers',
      where: 'id = ?',
      whereArgs: [id1],
    );
  }

//Transaction database operations------------------------------------

  static Future<int> addTransaction(Transactions transaction) async {
    // insert data to table
    final dbClient = await db();
    return dbClient.insert('bank_details', transaction.toMap(),
        conflictAlgorithm:
            sql.ConflictAlgorithm.replace); // add conflictAlgorithm
  }

  static Future<List<Transactions>> getDetails() async {
    //fetching data to display details.....
    final dbClient = await db();
    final List<Map<String, dynamic>> maps =
        await dbClient.query('bank_details');

    return List.generate(maps.length, (i) {
      return Transactions(
        id2: maps[i]['id'],
        bname: maps[i]['bname'],
        badd: maps[i]['badd'],
        bacc: maps[i]['bacc'],
        bifsc: maps[i]['bifsc'],
      );
    });
  }
//-----------------------------Invoice details-----------------------------

//  static Future<int> addInvoice(Company company) async {
//     // insert data to table
//     final dbClient = await db();
//     return dbClient.insert('invoices', company.toMap(),
//         conflictAlgorithm:
//             sql.ConflictAlgorithm.replace); // add conflictAlgorithm
//   }

//   static Future<List<Invoice>> getInvoice() async {
//     //fetching data to display details.....
//     final dbClient = await db();
//     final List<Map<String, dynamic>> maps = await dbClient.query('invoices');

// return List.generate(maps.length, (i) {
//       return Invoice(
//         id4: maps[i]['id'],

//         // iconame: maps[i]['iconame'],
//         // icoadd: maps[i]['icoadd'],
//         // icophone: maps[i]['icophone'],
//         // iemail: maps[i]['iemail'],
//         // icontactphone: maps[i]['icontactphone'],
//         // icuname: maps[i]['icuname'],
//         // icuadd: maps[i]['icuadd'],
//         // icuemail: maps[i]['icuemail'],
//         // icuphone: maps[i]['icuphone'],

//       );
//     });
}
