import 'package:flutter/material.dart';

class TopTabBar extends StatelessWidget {
  final List<String> tabs;
  final TabController controller;
  final bool isAboutStories;

  const TopTabBar({
    super.key,
    required this.tabs,
    required this.controller,
    required this.isAboutStories,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TabBar(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          dividerHeight: 0,
          tabAlignment: TabAlignment.start,
          controller: controller,
          isScrollable: true,
          indicatorColor: Colors.transparent,
          labelPadding: const EdgeInsets.symmetric(horizontal: 2),
          tabs: List.generate(tabs.length, (index) {
            final title = tabs[index];
            return Tab(
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, _) {
                  final bool isSelected = controller.index == index;
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFCECECE)
                          : Color(0xFFDEDEDE),
                      borderRadius: BorderRadius.circular(50),
                      border: isSelected
                          ? Border.all(color: Color(0xFF9F9F9F))
                          : Border.all(color: Colors.transparent),
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: isSelected
                            ? Color(0xFF2A2A2A)
                            : Color(0xFF141414),
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ),
      ],
    );
  }
}
