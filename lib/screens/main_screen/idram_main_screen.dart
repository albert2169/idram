import 'package:flutter/material.dart';
import 'package:idram/screens/main_screen/constants/idram_constants.dart';
import 'package:idram/screens/main_screen/models/service_enum.dart';
import 'package:idram/screens/scanner_screen.dart';
import 'package:idram/screens/main_screen/widgets/appbar.dart';
import 'package:idram/screens/main_screen/widgets/bottom_navigation_bar.dart';
import 'package:idram/screens/main_screen/widgets/images_card.dart';
import 'package:idram/screens/main_screen/widgets/rocket_line_and_wallet.dart';
import 'package:idram/screens/main_screen/widgets/option_tab_bar.dart';
import 'package:idram/screens/main_screen/widgets/service_tab_bar.dart';
import 'package:idram/screens/main_screen/widgets/top_tab_bar.dart';

class IdramMainScreen extends StatefulWidget {
  const IdramMainScreen({super.key});

  @override
  State<IdramMainScreen> createState() => _IdramMainScreenState();
}

class _IdramMainScreenState extends State<IdramMainScreen>
    with TickerProviderStateMixin {
  int _currentNavBarIndex = 0;
  final int _imageLength = 6;
  ServiceEnum _currentService = ServiceEnum.all;
  late TabController _topTapBarcontroller;
  late TabController _financeTapBarcontroller;
  late TabController _optionTapBarcontroller;
  late TabController _serviceTapBarcontroller;
  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    _topTapBarcontroller = TabController(
      animationDuration: const Duration(milliseconds: 200),
      length: IdramConstants.topTabs.length,
      vsync: this,
    );
    _financeTapBarcontroller = TabController(
      animationDuration: const Duration(milliseconds: 200),
      length: IdramConstants.financeTabs.length,
      vsync: this,
    );
    _optionTapBarcontroller = TabController(
      animationDuration: const Duration(milliseconds: 200),
      length: IdramConstants.optionTabs.length,
      vsync: this,
    );
    _serviceTapBarcontroller = TabController(
      animationDuration: const Duration(milliseconds: 200),
      length: IdramConstants.servicesMap[_currentService]!.length,
      vsync: this,
    );
    _listenToControllers();
  }

  void _listenToControllers() {
    _optionTapBarcontroller.addListener(() {
      final servicesList = IdramConstants.servicesMap.keys.toList();
      setState(() {
        _currentService = servicesList[_optionTapBarcontroller.index];
      });
    });
  }

  @override
  void dispose() {
    _topTapBarcontroller.dispose();
    _financeTapBarcontroller.dispose();
    _optionTapBarcontroller.dispose();
    _serviceTapBarcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: IdramAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopTabBar(
                isAboutStories: true,
                controller: _topTapBarcontroller,
                tabs: IdramConstants.topTabs,
              ),
              SingleChildScrollView(
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
              TopTabBar(
                isAboutStories: false,
                controller: _financeTapBarcontroller,
                tabs: IdramConstants.financeTabs,
              ),
              const SizedBox(height: 10),
              RocketLineAndWallet(),
              const SizedBox(height: 20),
              OptionTabBar(
                tabs: IdramConstants.optionTabs,
                controller: _optionTapBarcontroller,
              ),
              const SizedBox(height: 10),
              ServiceTabBar(
                currentService: _currentService,
                controller: _serviceTapBarcontroller,
                tabs: IdramConstants.servicesMap[_currentService]!,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          backgroundColor: const Color(0xFFFF6B1A),
          elevation: 4,
          shape: const CircleBorder(),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ScannerScreen()),
            );
          },
          child: Icon(
            IdramConstants.bottomNavigationBar[2].iconData,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
      bottomNavigationBar: IdramBottomNavigationBar(
        currentIndex: _currentNavBarIndex,
        onTap: (index) {
          setState(() {
            _currentNavBarIndex = index;
          });
        },
      ),
    );
  }
}
