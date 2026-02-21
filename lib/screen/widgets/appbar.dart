import 'package:flutter/material.dart';

class IdramAppbar extends StatelessWidget implements PreferredSizeWidget {
  const IdramAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/codify_pix_logo.png',
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover, 
                ),
              ),
            ),

            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Codify',
                      style: TextStyle(color: Color(0xFF141850), fontSize: 18),
                    ),
                    Text(
                      'Pix',
                      style: TextStyle(color: Color(0xFF52D5C8), fontSize: 18),
                    ),
                  ],
                ),

                Text(
                  'Նույնականանալ IDBank-ում',
                  style: TextStyle(
                    color: Color.fromARGB(255, 234, 112, 25),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Spacer(),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF444444),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.notification_add_rounded,
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 234, 112, 25),
                    ),
                    child: Text(
                      '99+',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
