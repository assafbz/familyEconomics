import 'package:family_economics/app/models/user_data.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/widgets/sum_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TotalCashFlowCard extends StatelessWidget {
  TotalCashFlowCard();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(builder: (context, userData, child) {
      int sumOfIncomes = userData?.sumOfIncomes?.toInt() ?? 0;
      int sumOfExpenses = userData?.sumOfExpenses?.toInt() ?? 0;
      int totalCashFlow = sumOfIncomes - sumOfExpenses;
      return SumCard(
          icon: FontAwesomeIcons.coins,
          sum: totalCashFlow,
          title: S.of(context).monthly_profit);
    });
  }
}
