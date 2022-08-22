import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:coin_2/widgets/commom_view.dart';
import 'package:coin_2/storage.dart';

class MonthCalendarView extends CommonView {
  MonthCalendarView({Key? key})
      : super(key: key, title: "Calendar", content: buildCalendar());

  static SfCalendar buildCalendar() {
    return SfCalendar(
      view: CalendarView.month,
      minDate: storage.periodStart,
      maxDate: storage.periodEnd,
    );
  }
}
