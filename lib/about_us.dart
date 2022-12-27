import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text(
            "Alberto Hernando",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          Text(
            "Ignasi Sánchez",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          Text(
            "David Busoms",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
