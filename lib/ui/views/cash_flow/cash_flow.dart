import 'package:family_economics/app/models/user_data.dart';
import 'package:family_economics/app/navigation/pop_up_menu.dart';
import 'package:family_economics/app/services/user_data_service.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/widgets/info_banner.dart';
import 'package:family_economics/ui/views/cash_flow/widgets/cash_flow_chart.dart';
import 'package:family_economics/ui/views/cash_flow/widgets/expenses_card.dart';
import 'package:family_economics/ui/views/cash_flow/widgets/incomes_card.dart';
import 'package:family_economics/ui/views/cash_flow/widgets/total_cash_flow_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CashFlowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).cash_flow),
          actions: [PopUpMenu()],
        ),
        body: Consumer<UserDataService>(
            builder: (context, userDataService, child) {
          return StreamProvider<UserData>.value(
              value: userDataService.onUserDataChanged(),
              child: ListView(children: <Widget>[
                InfoBanner(infoMessage: S.of(context).cash_flow_banner),
                TotalCashFlowCard(),
                CashFlowChart(),
                IncomesCard(),
                ExpensesCard()
              ]));
        }));
  }
}
