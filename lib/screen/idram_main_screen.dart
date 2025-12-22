import 'package:flutter/material.dart';
import 'package:idram/screen/constants/idram_constants.dart';
import 'package:idram/screen/widgets/appbar.dart';
import 'package:idram/screen/widgets/images_card.dart';

class IdramMainScreen extends StatefulWidget {
  const IdramMainScreen({super.key});

  @override
  State<IdramMainScreen> createState() => _IdramMainScreenState();
}

class _IdramMainScreenState extends State<IdramMainScreen> {
  final int _imageLength = 6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IdramAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 1; i < _imageLength + 1; ++i)
                SlantedRectangle(
                  imagePath: '${IdramConstants.imagePath}image$i.png',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
