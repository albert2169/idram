import 'package:flutter/material.dart';
import 'package:idram/screens/car_penalties_screen/widgets/car_info_section.dart';
import 'package:idram/screens/main_screen/constants/idram_constants.dart';
import 'package:idram/screens/main_screen/models/service.dart';
import 'package:idram/screens/main_screen/models/service_enum.dart';
import 'package:idram/screens/main_screen/widgets/service_tab_bar.dart';

class CarPenaltiesMainScreen extends StatefulWidget {
  final IdramService service;
  const CarPenaltiesMainScreen({super.key, required this.service});

  @override
  State<CarPenaltiesMainScreen> createState() => _CarPenaltiesMainScreenState();
}

class _CarPenaltiesMainScreenState extends State<CarPenaltiesMainScreen>
    with TickerProviderStateMixin {
  late TabController _serviceTapBarcontroller;

  @override
  void initState() {
    super.initState();
    _serviceTapBarcontroller = TabController(
      animationDuration: const Duration(milliseconds: 200),
      length: IdramConstants.serviceTabsCar.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(backgroundColor: Color(0xFFEEEEEE)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          spacing: 20,
          children: [
            CarInfoSection(service: widget.service),
            ServiceTabBar(
              currentService: ServiceEnum.all,
              tabs: IdramConstants.serviceTabsCar,
              controller: _serviceTapBarcontroller,
            ),
          ],
        ),
      ),
    );
  }
}
