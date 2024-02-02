import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minimal_notes_app/components/draw_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // header
          const DrawerHeader(child: Icon(Icons.note)),

          // notes title
          DrawerTile(
            title: 'Notes',
            leading: const Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),

          // settings title

          DrawerTile(
            title: 'Setting',
            leading: const Icon(Icons.settings),
            onTap: () {},
          )
        ]
      ),
    );
  }}