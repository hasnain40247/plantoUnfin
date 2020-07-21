import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices{
  FirebaseDatabase _database=FirebaseDatabase.instance;
  String ref="users";

  createUser(Map value){
    String id= value["userId"];
    _database.reference().
    child("$ref/$id")
        .set(
      value
    ).catchError((e) {
      print(e.toString());
    });
    }
  }





















//import 'package:firebase_database/firebase_database.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//
////class UserServices{
////  FirebaseDatabase firebaseDatabase=FirebaseDatabase.instance;
////  String ref = "users";
////
////createUser(Map value){
////  firebaseDatabase.reference().child(ref).push().set(
////    value
////  ).catchError((e)=>{
////    print(e.toString())
////  });
////}
////}
//
//class User{
//  final String uid;
//
//  User(this.uid);
//
//
//}