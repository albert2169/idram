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
        height: 60,
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
    final Color color = isSelected
        ? const Color(0xFFFF6B1A)
        : const Color(0xFF4A4A4A);

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.iconData, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              item.name,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
