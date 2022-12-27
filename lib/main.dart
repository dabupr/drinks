import 'dart:io';

import 'package:drinks/home_page.dart';
import 'package:drinks/loginRegister/login.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Nose per que nessitem aquesta linea pero si no petava per culpa del package de hive q

  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COCKTAILMATCH',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 233, 141, 54),
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}


/*
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
*/
