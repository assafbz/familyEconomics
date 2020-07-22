import 'package:family_economics/app/models/user_data.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/widgets/sum_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TotalNetWorthCard extends StatelessWidget {
  TotalNetWorthCard();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(builder: (context, userData, child) {
      int sumOfAssets = userData?.sumOfAssets?.toInt() ?? 0;
      int sumOfLiabilites = userData?.sumOfLiabilites?.toInt() ?? 0;
      int totalNetWorth = sumOfAssets - sumOfLiabilites;
      return SumCard(
          icon: FontAwesomeIcons.coins,
          sum: totalNetWorth,
          title: S.of(context).total_net_worth);
    });
  }
}
