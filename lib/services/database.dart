import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
  Future addEmployee(Map<String,dynamic> Employeemap,String Id)async{
    return await FirebaseFirestore.instance.
    collection('Employee').
    doc(Id).
    set(Employeemap);
  }
  // where snapshot is used to retrieve a elements from the database()
  Future<Stream<QuerySnapshot>> getEmployee() async{
    return await FirebaseFirestore.instance.collection('Employee').snapshots();
  }

  Future updateemployee(String id,Map<String, dynamic> updatemap)async {
    return await FirebaseFirestore.instance.collection('Employee').doc(id).update(updatemap);
  }

  Future deleteemployee(String id)async{
    await FirebaseFirestore.instance.collection('Employee').doc(id).delete();
  }
}