import 'package:flutter/material.dart';

class OptionTabBar extends StatelessWidget {
  final List<IconData> tabs;
  final TabController controller;

  const OptionTabBar({
    super.key,
    required this.tabs,
    required this.controller,
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
            final iconData = tabs[index];
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
                      color: isSelected ? Color(0xFFEA6E1F) : Color(0xFFDDDDDD),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      iconData,
                      color: isSelected ? Colors.white : Color(0xFF5C5C5C),
                    ),
                  );
                },
              ),
            );
          }),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              //Implement by yourself // Recommended to provide Function on tap as a callback from idram main screen
            },
            child: Text(
              'Բոլորը',
              style: TextStyle(
                color: Color(0xFF141414),
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
