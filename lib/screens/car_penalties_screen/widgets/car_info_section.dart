import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idram/screens/main_screen/models/service.dart';

class CarInfoSection extends StatelessWidget {
  final VoidCallback? onCopy;
  final IdramService service;

  const CarInfoSection({super.key, this.onCopy, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            children: [
              SvgPicture.asset(
                'assets/images/lamborghini.svg',
                width: 30,
                height: 30,
              ),
              Text(
                service.secondaryInfo.toUpperCase(),
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
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFE4E4E4), width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/arm_flag.jpg',
                        width: 16,
                        height: 16,
                      ),
                      Text(
                        'AM',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Container(width: 3.5, height: 24, color: Colors.orange),
                  Text(
                    service.name.toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
