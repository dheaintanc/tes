import 'package:flutter/material.dart';
import 'package:kuismobile/book_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Buku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookList(),
    );
  }
}
