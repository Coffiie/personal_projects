import 'package:flutter/material.dart';

class UpdateAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UpdateAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(
        'Flutter 3.27',
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
