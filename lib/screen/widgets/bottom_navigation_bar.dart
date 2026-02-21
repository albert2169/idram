import 'package:flutter/material.dart';
import 'package:idram/screen/constants/idram_constants.dart';
import 'package:idram/screen/models/service.dart';

class IdramBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const IdramBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<IdramService> items = IdramConstants.bottomNavigationBar;

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(index: 0, item: items[0]),
            _buildNavItem(index: 1, item: items[1]),
            const SizedBox(width: 48),
            _buildNavItem(index: 3, item: items[3]),
            _buildNavItem(index: 4, item: items[4]),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required int index, required IdramService item}) {
    final bool isSelected = currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedScale(
                scale: isSelected ? 1.15 : 1.0,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    item.iconData,
                    key: ValueKey(isSelected),
                    color: isSelected
                        ? const Color(0xFFFF6B1A)
                        : const Color(0xFF4A4A4A),
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                style: TextStyle(
                  color: isSelected
                      ? const Color(0xFFFF6B1A)
                      : const Color(0xFF4A4A4A),
                  fontSize: 10,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
                child: Text(item.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
