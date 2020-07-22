import 'package:family_economics/app/models/user_data.dart';
import 'package:family_economics/app/navigation/pop_up_menu.dart';
import 'package:family_economics/app/services/user_data_service.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/widgets/info_banner.dart';
import 'package:family_economics/ui/views/net_worth/widgets/liabilities_card.dart';
import 'package:family_economics/ui/views/net_worth/widgets/total_net_worth_card.dart';
import 'package:family_economics/ui/views/net_worth/widgets/assets_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/net_worth_chart.dart';

class NetWorthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).net_worth),
          actions: [PopUpMenu()],
        ),
        body: Consumer<UserDataService>(
            builder: (context, userDataService, child) {
          return StreamProvider<UserData>.value(
              value: userDataService.onUserDataChanged(),
              child: ListView(children: <Widget>[
                InfoBanner(infoMessage: S.of(context).net_worth_banner),
                TotalNetWorthCard(),
                NetWorthChart(),
                AssetsCard(),
                LiabilitiesCard()
              ]));
        }));
  }
}
