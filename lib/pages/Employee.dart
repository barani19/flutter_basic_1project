import 'package:flutter/material.dart';
import 'package:flutter_basic_1project/services/database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class Employee_form extends StatefulWidget {
  const Employee_form({super.key});

  @override
  State<Employee_form> createState() => _Employee_formState();
}

class _Employee_formState extends State<Employee_form> {

  TextEditingController namecontroller =  TextEditingController();
  TextEditingController agecontroller =  TextEditingController();
  TextEditingController locationcontroller =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Employee',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            SizedBox(width: 10.0,),
            Text(
              'Form',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 236, 167, 4),
              ),
            )
          ],
        ),
      ),
       body: Container(
        margin: EdgeInsets.only(left: 15,top: 20,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20,),
             Text(
              'Age',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ), 
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: agecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20,),
             Text(
              'Location',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: locationcontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20,),
            Center(child: ElevatedButton(onPressed: ()async{
              print('baa');
              String id = randomAlphaNumeric(10);
              print(id);
               Map<String,dynamic> Employeemap = {
                'Name': namecontroller.text,
                'Age': agecontroller.text,
                'Location': locationcontroller.text
               };
        await Database().addEmployee(Employeemap,id).then((event)=>{
          Fluttertoast.showToast(
        msg: "Employee details are added  successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    )
        });
            },
             child: Text('ADD',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)))
          ],
        ),
      ),
    );
  }
}