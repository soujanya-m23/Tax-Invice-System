import 'dart:async';
import 'customer.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

import 'modal.dart';
import 'Quotation1.dart';

class DatabaseHelper {
  static Future<void> createTables(sql.Database database) async {
   await database.execute(""" 
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,  
        coname TEXT,
        coadd TEXT,
        cophone TEXT,
        gstnum TEXT,
        qnum TEXT,
        qdate TEXT
        
      )
    """);

    await database.execute(""" 
      CREATE TABLE customers(
        id INTEGER PRIMARY KEY AUTOINCREMENT,  
        cuname TEXT,
        cuadd TEXT,
        cuphone TEXT,
        bname TEXT,
        badd TEXT,
        bacc TEXT,
        bifsc TEXT
      )
    """);
  }
 
 static Future<sql.Database> db() async {
    // database creation ....
    return sql.openDatabase(
      'tax.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
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
        gstnum: maps[i]['gstnum'],
        qnum: maps[i]['qnum'],
        qdate: maps[i]['qdate'],
        
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
      cuname: maps[i]['cuname'],
      cuadd: maps[i]['cuadd'],
      cuphone: maps[i]['cuphone'],
      bname: maps[i]['bname'],
      badd: maps[i]['badd'],
      bacc: maps[i]['bacc'],
      bifsc: maps[i]['bifsc'],
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



}


