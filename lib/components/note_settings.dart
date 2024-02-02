import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  final void Function()? onEditTab;
  final void Function()? onDeleteTab;

  const NoteSettings({
    super.key,
    required this.onEditTab,
    required this.onDeleteTab,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Edit
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onEditTab!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: Text(
                'Edit',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onDeleteTab!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: Text(
                'Delete',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
          ),
        )
      ],
    );
  }
}