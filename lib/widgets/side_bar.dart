import 'package:drinks/about_us.dart';
import 'package:drinks/likes_dislikes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.orange,
      elevation: 0,
      child: ListView(
        children: [
          //const Divider(endIndent: 20, indent: 20, thickness: 5, height: 5),
          ListTile(
            leading: const Icon(Icons.thumb_up_alt),
            title: const Text('Likes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LikeDislike(liked: true)),
              );
            },
          ),
          const Divider(endIndent: 20, indent: 20, thickness: 5, height: 5),
          ListTile(
            leading: const Icon(Icons.thumb_down_alt),
            title: const Text('Dislikes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LikeDislike(liked: false)),
              );
            },
          ),
          const Divider(endIndent: 20, indent: 20, thickness: 5, height: 5),
          ListTile(
            leading: const Icon(Icons.create),
            title: const Text('Your cocktails'),
            onTap: () {},
          ),
          const Divider(endIndent: 20, indent: 20, thickness: 5, height: 5),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('About us'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUs()),
              );
            },
          ),
          const Divider(endIndent: 20, indent: 20, thickness: 5, height: 5),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
          //const Divider(endIndent: 20, indent: 20, thickness: 5, height: 5),
        ],
      ),
    );
  }
}
