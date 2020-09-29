import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_charts/data/assessment.dart';
import 'package:intro_to_charts/data/list_item.dart';
import 'dart:math';

class AssessmentTile implements ListItem {
  final String heading;
  // List<Series<Assessment, String>> _seriesList;

  AssessmentTile({this.heading});

  @override
  Widget buildChart(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [Expanded(child: _displayChart(_createSampleData(), true))],
        ),
      ),
    );
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        heading,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  List<Series> _createSampleData() {
    final assessmentData = [
      Assessment(name: "A", marks: _next(0, 100)),
      Assessment(name: "B", marks: _next(0, 100)),
      Assessment(name: "C", marks: _next(0, 100)),
      Assessment(name: "D", marks: _next(0, 100)),
      Assessment(name: "E", marks: _next(0, 100)),
      Assessment(name: "F", marks: _next(0, 100)),
      Assessment(name: "G", marks: _next(0, 100)),
      Assessment(name: "H", marks: _next(0, 100))
    ];

    return [Series(
      id: "Assessment Marks",
      data: assessmentData,
      // x-axis
      domainFn: (assessment, int _) => assessment.name,
      // y-axis
      measureFn: (assessment, int _) => assessment.marks,


    )];
  }

  BarChart _displayChart(List<Series> sampleData, bool animate) {
    return BarChart(
      sampleData,
      animate: animate,
      vertical: true,

      // y-axis styling
      primaryMeasureAxis: NumericAxisSpec(
          showAxisLine: true,

          // display axis label
          renderSpec: GridlineRendererSpec(
              labelStyle:
                  TextStyleSpec(fontSize: 10, color: MaterialPalette.white),
              lineStyle:
                  LineStyleSpec(color: MaterialPalette.gray.shadeDefault))),

      // x-axis styling
      domainAxis: OrdinalAxisSpec(
        renderSpec: GridlineRendererSpec(
              labelStyle:
                  TextStyleSpec(fontSize: 10, color: MaterialPalette.white),
              lineStyle:
                  LineStyleSpec(color: MaterialPalette.gray.shadeDefault))),
    );
  }

  int _next(int min, int max) {
    return Random().nextInt(max - min) + min;
  }
}
