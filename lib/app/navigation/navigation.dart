import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/cash_flow/cash_flow.dart';
import 'package:family_economics/ui/views/net_worth/net_worth.dart';
import 'package:family_economics/ui/views/roadmap_view/roadmap_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationBar extends StatefulWidget {
  final FirebaseAnalyticsObserver observer;
  final FirebaseAnalytics analytics;

  MainNavigationBar(this.analytics, this.observer);
  @override
  State<StatefulWidget> createState() {
    return MainNavigationBarState(this.analytics, this.observer);
  }
}

class MainNavigationBarState extends State<MainNavigationBar> {
  final FirebaseAnalyticsObserver observer;
  final FirebaseAnalytics analytics;

  MainNavigationBarState(this.analytics, this.observer);
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final List<Widget> _widgetOptions = <Widget>[
    NetWorthWidget(),
    CashFlowWidget(),
    RoadmapView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.wb_incandescent,
                  size: 40,
                ),
                title: Text(S.of(context).net_worth),
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.coins, size: 40),
                title: Text(S.of(context).cash_flow),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle, size: 40),
                title: Text(S.of(context).what_more),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped));
  }
}
