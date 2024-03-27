import 'package:flutter/material.dart';

class CustomizedDrawer extends StatelessWidget {
  const CustomizedDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
              child: Icon(
            Icons.music_note,
            size: 40.0,
          )),
          const SizedBox(
            height: 10.0,
          ),
          ListTile(
            title: const Text("H O M E"),
            leading: const Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text("S E T T I N G S"),
            leading: const Icon(Icons.settings),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
