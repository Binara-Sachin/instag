import 'package:Instag/Libraries/AdmobLibraries.dart';
import 'package:flutter/material.dart';

import 'package:Instag/Assets/Class_HashtagList.dart';

import 'HashtagListBuilder.dart';

class ExpansionViewBuilder extends StatefulWidget {
  @override
  _ExpansionViewBuilderState createState() => _ExpansionViewBuilderState();

}

class _ExpansionViewBuilderState extends State<ExpansionViewBuilder> {

  Widget _buildExpansionTile(HashtagList hashtagObject) {
    return new ExpansionTile(
      title: Text(
        hashtagObject.title,
      ),
      children: <Widget>[
          HashtagListBuilder(hashtagObject.hashtagList),
      ],
    );
  }

  Widget _buildExpansionView() {
    return new ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      itemCount: hashtagObjectList.length,
      itemBuilder: (context, i) {
        if (hashtagObjectList[i].title.toString() == "Ad Here") {
          return showBannerAd();
        }
        return _buildExpansionTile(hashtagObjectList[i]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildExpansionView();
  }
}