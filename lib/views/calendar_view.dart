import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MonthCalendarView extends StatefulWidget {
  const MonthCalendarView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MonthCalendarViewState();
}

class _MonthCalendarViewState extends State<MonthCalendarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
        view: CalendarView.month,
      ),
      // drawer: buildDrawer(context),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: addNewEventDialogMethod(context),
      //     child: Icon(Icons.add),
      //     tooltip: "Add new event")
    );
  }
}
