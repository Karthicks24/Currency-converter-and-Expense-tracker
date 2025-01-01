import 'package:currency_converter/material.dart';
import 'package:currency_converter/pages/first_page.dart';
import 'package:currency_converter/pages/expenseTracker.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MaterialHomePage(),
      routes: {
        '/firstpage' : (context) => const ExpenseTracker(),
        '/secondpage' : (context)=> SecondPage(),
      },
    );
  }
}