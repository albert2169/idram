import 'package:flutter/widgets.dart';

class IdramService {
  final String name;
  final String secondaryInfo;
  final IconData iconData;
  final bool isCarService;

  const IdramService({
    required this.name,
    required this.iconData,
    this.isCarService = false,
    this.secondaryInfo = '',
  });
}
