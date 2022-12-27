/*import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const TopBar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return topBarWid();
  }

  Widget topBarWid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              color: Colors.white.withOpacity(0.8),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("COCKTAILMATCH", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            )),
        const Divider(),
        GestureDetector(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: Colors.white.withOpacity(0.8),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.menu,
                  size: 40,
                ),
              )),
          onTap: () {
            scaffoldKey.currentState?.openEndDrawer();
          },
        ),
      ],
    );
  }
}
*/