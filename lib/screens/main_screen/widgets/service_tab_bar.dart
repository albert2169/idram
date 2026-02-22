import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idram/screens/car_penalties_screen/car_penalties_main_screen.dart';
import 'package:idram/screens/main_screen/constants/idram_constants.dart';
import 'package:idram/screens/main_screen/models/service.dart';
import 'package:idram/screens/main_screen/models/service_enum.dart';

class ServiceTabBar extends StatelessWidget {
  final ServiceEnum currentService;
  final List<IdramService> tabs;
  final TabController controller;

  const ServiceTabBar({
    super.key,
    required this.tabs,
    required this.controller,
    required this.currentService,
  });

  @override
  Widget build(BuildContext context) {
    const double tabWidth = 120;
    const double tabHeight = 100.0;
    if (currentService == ServiceEnum.favorite ||
        currentService == ServiceEnum.wallet) {
      return Container(
        height: tabHeight,
        decoration: BoxDecoration(
          color: Color(0xFFDDDDDD),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [],
        ),
        child: Center(
          child: Text(
            currentService == ServiceEnum.favorite
                ? IdramConstants.emptyFavorite
                : IdramConstants.emptyWallet,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF212121),
              fontSize: 12,
              height: 1.4,
            ),
          ),
        ),
      );
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final idramService = tabs[index];

          return AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              final bool isSelected = controller.index == index;

              return GestureDetector(
                onTap: () {
                  if (currentService == ServiceEnum.car) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            CarPenaltiesMainScreen(service: tabs.first),
                      ),
                    );
                  }
                },
                child: Container(
                  width: tabWidth,
                  height: tabHeight,
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      if (!isSelected)
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        !idramService.isCarService
                            ? Icon(
                                idramService.iconData,
                                color: const Color(0xFF6F6F6F),
                                size: 24,
                              )
                            : SvgPicture.asset(
                                'assets/images/lamborghini.svg',
                                width: 40,
                                height: 40,
                              ),
                        Spacer(),
                        if (idramService.secondaryInfo.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              idramService.secondaryInfo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: const Color(0xFF6F6F6F),
                                fontSize: 10,
                                height: 1.2,
                              ),
                            ),
                          ),
                        Text(
                          idramService.name,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: const Color(0xFF303030),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
