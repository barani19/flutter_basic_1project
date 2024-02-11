import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
  Future addEmployee(Map<String,dynamic> Employeemap,String Id)async{
    return await FirebaseFirestore.instance.
    collection('Employee').
    doc(Id).
    set(Employeemap);
  }
}