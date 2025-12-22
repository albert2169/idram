import 'package:flutter/material.dart';

class IdramAppbar extends StatelessWidget implements PreferredSizeWidget {
  const IdramAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle,),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.person),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20);
}
