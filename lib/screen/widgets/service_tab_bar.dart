import 'package:flutter/material.dart';
import 'package:idram/screen/models/service.dart';

class ServiceTabBar extends StatelessWidget {
  final List<IdramService> tabs;
  final TabController controller;

  const ServiceTabBar({
    super.key,
    required this.tabs,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    const double tabWidth = 120;
    const double tabHeight = 100.0;

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
                onTap: () => controller.animateTo(index),
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
                        Icon(
                          idramService.iconData,
                          color: const Color(0xFF6F6F6F),
                          size: 24,
                        ),
                        Spacer(),
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
