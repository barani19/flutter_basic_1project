import 'package:flutter/material.dart';

class Abar extends StatelessWidget {
  const Abar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}