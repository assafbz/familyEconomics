import 'package:family_economics/app/models/user_data.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/expenses_view/expenses_view.dart';
import 'package:family_economics/ui/widgets/sum_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ExpensesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(builder: (context, userData, child) {
      return SumCard(
          icon: FontAwesomeIcons.creditCard,
          navigateTo: ExpensesView(),
          sum: userData?.sumOfExpenses?.toInt() ?? 0,
          title: S.of(context).expenses);
    });
  }
}
