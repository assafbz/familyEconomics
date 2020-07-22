import 'package:family_economics/app/models/user_data.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/loans_view/loans_view.dart';
import 'package:family_economics/ui/widgets/sum_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoansCard extends StatelessWidget {
  LoansCard();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(builder: (context, userData, child) {
      return SumCard(
          icon: FontAwesomeIcons.shoppingBasket,
          navigateTo: LoansView(),
          sum: userData?.sumOfLoans?.toInt() ?? 0,
          title: S.of(context).loans);
    });
  }
}
