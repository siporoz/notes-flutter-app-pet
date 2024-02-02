import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? onDeletePressed;
  final void Function()? onEditPressed;

  const NoteTile({
    super.key,
    required this.text,
    required this.onDeletePressed,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8 )
      ),
      margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
      child: ListTile(
        title: Text(text),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onEditPressed,
              icon: const Icon(Icons.edit)
            ),
            IconButton(
              onPressed: onDeletePressed,
              icon: const Icon(Icons.delete)
            )
          ],
        ),
      ),
    );
  }
}