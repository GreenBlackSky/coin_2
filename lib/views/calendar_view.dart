import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:coin_2/widgets/commom_view.dart';
import 'package:coin_2/storage.dart';

class CalendarEventList extends CalendarDataSource {
  CalendarEventList() {
    appointments = storage.events;
  }

  @override
  DateTime getStartTime(int index) {
    return storage.events[index].eventTime;
  }

  @override
  DateTime getEndTime(int index) {
    return storage.events[index].eventTime;
  }

  @override
  String getSubject(int index) {
    return storage.events[index].name;
  }

  @override
  bool isAllDay(int index) {
    return false;
  }
}

class MonthCalendarView extends CommonView {
  MonthCalendarView({Key? key})
      : super(key: key, title: "Calendar", content: buildCalendar());

  static SfCalendar buildCalendar() {
    return SfCalendar(
        view: CalendarView.month,
        minDate: storage.periodStart,
        maxDate: storage.periodEnd,
        dataSource: CalendarEventList(),
        monthViewSettings: const MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment));
  }
}
