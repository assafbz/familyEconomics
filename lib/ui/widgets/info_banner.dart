import 'package:flutter/material.dart';

class InfoBanner extends StatefulWidget {
  final String infoMessage;

  InfoBanner({this.infoMessage});

  @override
  State<StatefulWidget> createState() {
    return InfoBannerState(infoMessage: this.infoMessage);
  }
}

class InfoBannerState extends State<InfoBanner> {
  final String infoMessage;

  InfoBannerState({this.infoMessage});

  Widget buildBanner() {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: ListTile(
          title: Text(this.infoMessage),
          leading: CircleAvatar(
            child: Icon(Icons.accessibility_new, color: colorScheme.onPrimary),
            backgroundColor: colorScheme.primary,
          )),
      color: colorScheme.background,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget banner = buildBanner();
    return Dismissible(key: ValueKey(banner), child: banner);
  }
}
