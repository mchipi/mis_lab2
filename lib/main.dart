import 'package:flutter/material.dart';
import 'package:mis_lab1/screens/subjects_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('203057',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            ),),
            backgroundColor: const Color.fromRGBO(82, 121, 111, 1),
            foregroundColor:const Color.fromRGBO(202,210,197,1),
          ),
          body: SubjectsList(),
          ),
          
    );
  }
}
