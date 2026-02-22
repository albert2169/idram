import 'package:flutter/material.dart';
import 'package:idram/screens/main_screen/constants/idram_constants.dart';

class RocketLineAndWallet extends StatelessWidget {
  const RocketLineAndWallet({super.key});

  @override
  Widget build(BuildContext context) {
    final fullScreenWidthWithPaddingAndSpacing =
        MediaQuery.of(context).size.width - 32 - 10;

    return Row(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 100,
                width: fullScreenWidthWithPaddingAndSpacing / 2,
                child: Image.asset(
                  '${IdramConstants.imagePath}black-painted-wall-textured-background.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(1),
                  child: Icon(Icons.add, color: Colors.white, size: 12,),
                ),
              ),
            ),
            const Positioned(
              left: 15,
              top: 10,
              child: Text(
                'Ստացիր մինչև',
                style: TextStyle(
                  color: Color(0xFF9B9B9B),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Positioned(
              left: 5,
              top: 30,
              child: Text(
                '10,000,000.00 AMD',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const Positioned(
              left: 15,
              top: 75,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFFC76E31)),
                child: Text(
                  'Rocket line սահմանաչափը',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              height: 100,
              width: fullScreenWidthWithPaddingAndSpacing / 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF8C8C8C), width: 1.5),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(1),
                  child: Icon(Icons.add, color: Color(0xFF8C8C8C), size: 12),
                ),
              ),
            ),
            const Positioned(
              left: 15,
              top: 10,
              child: Text(
                'Դրամապանակ',
                style: TextStyle(
                  color: Color(0xFF303030),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Positioned(
              left: 15,
              top: 30,
              child: Text(
                '660,000.43 EUR',
                style: TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 75,
              child: Row(
                spacing: 5,
                children: [
                  Image.asset(
                    '${IdramConstants.imagePath}idram_logo.png',
                    width: 20,
                    height: 20,
                  ),
                  const Text(
                    'ID: 266791455',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF303030),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
