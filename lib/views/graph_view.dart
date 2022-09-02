import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:coin_2/widgets/commom_view.dart';
import 'package:coin_2/storage.dart';

class ChartData {
  ChartData({required this.x, required this.y});

  final DateTime x;
  final int y;
}

class GraphView extends CommonView {
  const GraphView({Key? key})
      : super(key: key, title: "Chart", builder: buildGraph);

  static bool atTheSameDay(DateTime eventTime, DateTime dayStart) {
    DateTime dayEnd = dayStart.add(const Duration(days: 1));
    return (eventTime.isAtSameMomentAs(dayStart) ||
            eventTime.isAfter(dayStart)) &&
        eventTime.isBefore(dayEnd);
  }

  static Widget buildGraph(BuildContext context) {
    int balance = storage.periodStartBalance;
    List<ChartData> chartData = [];
    int eventIDX = 0;
    for (DateTime indexDay = storage.periodStart;
        indexDay.month == storage.periodStart.month;
        indexDay = indexDay.add(const Duration(days: 1))) {
      while (eventIDX < storage.events.length &&
          atTheSameDay(storage.events[eventIDX].eventDate, indexDay)) {
        balance += storage.events[eventIDX].diff;
        eventIDX += 1;
      }
      chartData.add(ChartData(x: indexDay, y: balance));
    }
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(
          intervalType: DateTimeIntervalType.days,
          minimum: storage.periodStart,
          maximum: storage.periodEnd),
      series: <ChartSeries<ChartData, DateTime>>[
        LineSeries<ChartData, DateTime>(
            dataSource: chartData,
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
