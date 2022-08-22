import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:coin_2/widgets/commom_view.dart';

class ChartData {
  ChartData({required this.x, required this.y});

  final DateTime x;
  final int y;
}

class GraphView extends CommonView {
  GraphView({Key? key})
      : super(key: key, title: "Chart", content: buildGraph());

  static Widget buildGraph() {
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(
        intervalType: DateTimeIntervalType.days,
        // minimum: storage.periodStart,
        // maximum: storage.periodEnd
      ),
      series: <ChartSeries<ChartData, DateTime>>[
        LineSeries<ChartData, DateTime>(
            dataSource: [],
            xValueMapper: (ChartData val, _) => val.x,
            yValueMapper: (ChartData val, _) => val.y,
            selectionBehavior: SelectionBehavior(
                enable: true,
                selectedColor: Colors.red,
                selectedBorderWidth: 5,
                unselectedBorderWidth: 5),
            width: 5)
      ],
      trackballBehavior: TrackballBehavior(
          enable: true,
          activationMode: ActivationMode.singleTap,
          tooltipDisplayMode: TrackballDisplayMode.nearestPoint,
          tooltipSettings: const InteractiveTooltip(format: 'point.x: point.y'),
          hideDelay: 2000),
      // onSelectionChanged: (selectionArgs) {},
    );
  }
}
