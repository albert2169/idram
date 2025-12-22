import 'package:flutter/material.dart';
import 'package:idram/screen/widgets/appbar.dart';

class IdramMainScreen extends StatelessWidget {
  const IdramMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: IdramAppbar(),
    );
  }
}