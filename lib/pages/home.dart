import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_1project/pages/Employee.dart';
import 'package:flutter_basic_1project/services/database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
  

class _HomeState extends State<Home> {

   TextEditingController namecontroller =  TextEditingController();
  TextEditingController agecontroller =  TextEditingController();
  TextEditingController locationcontroller =  TextEditingController();

  Stream? empstream;

getonload()async{
  empstream = await Database().getEmployee();
  setState((){

  });
}

@override
  void initState() {
    // TODO: implement initState
    getonload();
    super.initState();
  }

Widget allemployee(){
  return StreamBuilder(
    stream: empstream,
   builder: (context,AsyncSnapshot snapshot){
    return snapshot.hasData ?
    ListView.builder(
      itemCount: snapshot.data.docs.length,
      itemBuilder: (context,index){
        DocumentSnapshot ds = snapshot.data.docs[index];
        return  Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(30),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                  ),
                  child: Column( 
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ignore: prefer_interpolation_to_compose_strings
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Name: '+ds['Name'],style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                 GestureDetector(onTap: (){
                            namecontroller.text = ds['Name'];
                            agecontroller.text = ds['Age'];
                            locationcontroller.text = ds['Location'];
                            editemployee(ds['Id']);
                          }, child: Icon(Icons.edit,color: Colors.orange,)),
                          SizedBox(width: 7,),
                 GestureDetector(
                            onTap: () async{
          await Database().deleteemployee(ds["Id"]);
                            },
                            child: Icon(Icons.delete,color: Colors.orange,))
                            ],
                          )
                         
                        ],
                      ),
                       Text('Age: '+ds['Age'],style: TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.bold),),
                        Text('Location: '+ds['Location'],style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
        );
      }
      )
    : Container();
   });
}

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
        margin: EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            Expanded(child: allemployee()),
          ],
        ),
      ),
    );
  }

  Future editemployee(String id)=> showDialog(context:  context, builder: (context)=>AlertDialog(
     content: Container(
      height: 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 60,),
              Text('Update',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(width: 10,),
              Text('Details',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(width: 30,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.close)
                ),
            ],
          ),
          Spacer(),
           Text('Name',
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
            Spacer(),
            Center(
              child: ElevatedButton(onPressed: ()async{
                Map<String, dynamic> updatemap = {
                  'Name': namecontroller.text,
                  'Age': agecontroller.text,
                  'Location': locationcontroller.text,
                  'Id': id,
                };
              await Database().updateemployee(id, updatemap).then((value) => Navigator.pop(context));
              }, child: Text('Update',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),)),
            )
        ],
      ),
     ),
     elevation: 10,
     backgroundColor: Color.fromARGB(255, 254, 254, 254),
  ));
}

