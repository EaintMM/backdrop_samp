import 'package:backdrop_samp/step1.dart';
import 'package:backdrop_samp/step2.dart';
import 'package:backdrop_samp/step3.dart';
import 'package:backdrop_samp/step4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text(title),
      ),
      body:  SafeArea(
          child:  ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
           const SizedBox(
            height: 32.0,
          ),
           TextButton(
            onPressed: () {
              Navigator.push(
                context, 
                 MaterialPageRoute(
                  builder: (context)=>  Step1Page()
                )
              );
            },
            child:  const Text('Step1'),
          ),

          TextButton(
            onPressed: () {
              Navigator.push(
                context, 
                 MaterialPageRoute(
                  builder: (context)=>  Step2Page()
                )
              );
            },
            child:  const Text('Step2'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context, 
                 MaterialPageRoute(
                  builder: (context)=>  Step3Page()
                )
              );
            },
            child:  const Text('Step3'),
          ),

          TextButton(
            onPressed: () {
              Navigator.push(
                context, 
                 MaterialPageRoute(
                  builder: (context)=>  Step4Page()
                )
              );
            },
            child:  const Text('Step4'),
          ),
        ],
      )),
    );
  }
}
