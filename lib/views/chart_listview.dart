import 'package:flutter/material.dart';
import 'package:intro_to_charts/data/list_item.dart';

class ChartListView extends StatefulWidget {
  final List<ListItem> items;
  ChartListView({this.items});

  @override
  _ChartListViewState createState() => _ChartListViewState();
}

class _ChartListViewState extends State<ChartListView> {
  Widget _buildList() {
    return ListView.separated(
        itemBuilder: (BuildContext context, int i) {
          final ListItem item = widget.items[i];
          return ListTile(
            title: item.buildTitle(context),
            subtitle: item.buildChart(context));
        },
        separatorBuilder: (BuildContext context, int i) =>
            Divider(thickness: 2.0),
        itemCount: widget.items.length);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(24, 24, 24, 1.0),
        canvasColor: Color.fromRGBO(46, 49, 49, 1.0),
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Introduction to charts"),
        ),
        body: _buildList(),
      ),
    );
  }
}
