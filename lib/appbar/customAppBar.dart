import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class customAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool back;
  const customAppBar({required this.title, this.back = true, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: back
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : null,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(title),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
