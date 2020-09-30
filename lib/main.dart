import 'package:flutter/material.dart';
import 'package:intro_to_charts/data/assement_tile.dart';
import 'package:intro_to_charts/data/list_item.dart';
import 'package:intro_to_charts/views/chart_listview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intro to charts',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(24, 24, 24, 1.0),
        canvasColor: Color.fromRGBO(46, 49, 49, 1.0),
        brightness: Brightness.dark,
      ),
      home: ChartListView(
        items: List<ListItem>.generate(
            5, (index) => AssessmentTile(heading: "Assignment $index")),
      ),
    );
  }
}
