import 'package:flutter/material.dart';
import 'package:idram/screens/main_screen/models/service.dart';
import 'package:idram/screens/main_screen/models/service_enum.dart';

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
  static const List<IdramService> serviceTabsAll = [
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

  static const Map<ServiceEnum, List<IdramService>> servicesMap = {
    ServiceEnum.all: serviceTabsAll,
    ServiceEnum.favorite: [],
    ServiceEnum.star: [
      IdramService(name: 'Կոմունալ վճարումներ', iconData: Icons.wifi),
      IdramService(name: 'Վարկեր', iconData: Icons.percent_outlined),
      IdramService(
        name: 'փոխանցումներ',
        iconData: Icons.transfer_within_a_station_outlined,
      ),
    ],
    ServiceEnum.car: [
      IdramService(
        name: '00 XX 000',
        iconData: Icons.directions_car,
        isCarService: true,
        secondaryInfo: 'Lamborghini Urus',
      ),
    ],
    ServiceEnum.wallet: [],
  };
  static const emptyFavorite =
      'Դեռ չկան հիշված վճարումներ:\n Երբ տեսնեք 🖤 նշանը, պարզապես սեղմեք դրա վրա և\n գործարքի տվյալները կհիշվեն այստեղ որպես\nձևանմուշ';
  static const emptyWallet =
      'Դեռ չկան թվային դրամապանակներ կամ idcoin-ներ:\n Երբ տեսնեք 🖤 նշանը, պարզապես սեղմեք դրա վրա և\nգործարքի տվյալները կհիշվեն այստեղ որպես\nձևանմուշ';

  static const List<IdramService> serviceTabsCar = [
    IdramService(
      name: 'Կայանման վճարում',
      iconData: Icons.local_parking_rounded,
    ),
    IdramService(
      name: 'ՃՈ և այլ տուգանքներ',
      iconData: Icons.traffic_outlined,
    ),
    IdramService(
      name: 'ԱՊՊԱ',
      iconData: Icons.check_box_outlined,
    ),
    IdramService(
      name: 'Գույքահարկ',
      iconData: Icons.car_crash,
    ),
  ];
}
