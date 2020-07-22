import 'package:family_economics/app/models/user_data.dart';
import 'package:family_economics/app/navigation/pop_up_menu.dart';
import 'package:family_economics/app/services/user_data_service.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/roadmap_view/widgets/goals_card.dart';
import 'package:family_economics/ui/views/roadmap_view/widgets/insurances_card.dart';
import 'package:family_economics/ui/views/roadmap_view/widgets/loans_card.dart';
import 'package:family_economics/ui/views/roadmap_view/widgets/suggestions_card.dart';
import 'package:family_economics/ui/widgets/info_banner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoadmapView extends StatelessWidget {
  const RoadmapView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).what_more),
          actions: [PopUpMenu()],
        ),
        body: Consumer<UserDataService>(
            builder: (context, userDataService, child) {
          return StreamProvider<UserData>.value(
              value: userDataService.onUserDataChanged(),
              child: Column(
                children: <Widget>[
                  InfoBanner(infoMessage: S.of(context).goals_info_banner),
                  GoalsCard(),
                  InfoBanner(infoMessage: S.of(context).insurance_info_banner),
                  InsurancesCard(),
                  InfoBanner(infoMessage: S.of(context).loans_info_banner),
                  LoansCard(),
                  InfoBanner(
                      infoMessage: S.of(context).suggestions_info_banner),
                  SuggestionsCard()
                ],
              ));
        }));
  }
}
