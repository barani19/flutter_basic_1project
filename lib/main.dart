import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_1project/pages/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDeNHONSumC_MCYIkoW3X8DtfO5jfwCsJ4",
      appId: "1:1002630184843:android:0973af4feb500c0f06798e",
      messagingSenderId: "1002630184843",
      projectId: "fir-onee",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}


