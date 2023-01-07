import 'dart:io';
import 'package:drinks/home_page.dart';
import 'package:drinks/loginRegister/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //Nose per que nessitem aquesta linea pero si no petava per culpa del package de hive q
  await Firebase.initializeApp();
  Directory directory = await path_provider.getApplicationDocumentsDirectory();
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
          scaffoldBackgroundColor: Colors.orange[400],
          primarySwatch: Colors.orange,
        ),
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomePage();
              } else if (snapshot.hasData) {
                return const Scaffold(body: Center(child: Text("Algo del login no funciona")));
              } else {
                return const LoginPage();
              }
            }));
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
