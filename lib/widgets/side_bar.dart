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
          const Divider(),
          ListTile(
            leading: const Icon(Icons.thumb_up_alt),
            title: const Text('Likes'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.thumb_down_alt),
            title: const Text('Dislikes'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.create),
            title: const Text('Your cocktails'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('About us'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () {},
          ),
          const Divider()
        ],
      ),
    );
  }
}
