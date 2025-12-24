import 'package:flutter/material.dart';
import 'package:idram/screen/models/service.dart';

class IdramConstants {
  static const imagePath = 'assets/images/';
  static const List<String> topTabs = ['Սթորիներ', 'Տոմսեր', 'Շոփինգ'];
  static const List<String> financeTabs = ['Ֆինանսներ', 'idcoin և թվ. քարտեր'];
  static const List<IconData> optionTabs = [
    Icons.apps,
    Icons.favorite,
    Icons.local_activity,
    Icons.directions_car,
    Icons.account_balance_wallet,
  ];

  static const List<IdramService> serviceTabs = [
    IdramService(name: 'Բջջային կապ', iconData: Icons.phone_iphone_rounded),
    IdramService(name: 'Բանկային քարտի', iconData: Icons.credit_card_outlined),
    IdramService(name: 'Իմ հաշիվների միջև', iconData: Icons.sync_alt),
    IdramService(
      name: 'Բանկային հաշվի',
      iconData: Icons.account_balance_outlined,
    ),
    IdramService(name: 'Swift փոխանցում', iconData: Icons.language_outlined),
  ];
  static const List<IdramService> bottomNavigationBar = [
    IdramService(name: 'Գլխավոր', iconData: Icons.home_filled),
    IdramService(name: 'Բանկինգ', iconData: Icons.credit_score_outlined),
    IdramService(name: 'QR', iconData: Icons.qr_code_scanner_rounded),
    IdramService(
      name: 'Պատմություն',
      iconData: Icons.access_time_filled_rounded,
    ),
    IdramService(name: 'Ավելին', iconData: Icons.menu_rounded),
  ];
}
