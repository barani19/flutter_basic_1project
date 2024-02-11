import 'package:flutter/material.dart';
import 'package:flutter_basic_1project/pages/Employee.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        print('hello');
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Employee_form()));
      },child: Icon(Icons.add),),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flutter',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            SizedBox(width: 10.0,),
            Text(
              'Firebase',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 236, 167, 4),
              ),
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: EdgeInsets.all(30),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                ),
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: M.Barani',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                     Text('Age: 19',style: TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.bold),),
                      Text('Location: Puducherry',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}