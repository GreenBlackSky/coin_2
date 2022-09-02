import 'package:coin_2/widgets/edit_event_dialog.dart';
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
    return storage.events[index].eventDate;
  }

  @override
  DateTime getEndTime(int index) {
    return storage.events[index].eventDate;
  }

  @override
  String getSubject(int index) {
    return storage.events[index].description;
  }

  @override
  bool isAllDay(int index) {
    return false;
  }
}

class MonthCalendarView extends CommonView {
  const MonthCalendarView({Key? key})
      : super(key: key, title: "Calendar", builder: buildCalendar);

  static SfCalendar buildCalendar(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      minDate: storage.periodStart,
      maxDate: storage.periodEnd,
      dataSource: CalendarEventList(),
      monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
      onTap: (details) {
        if (details.appointments!.length == 1) {
          showDialog(
              context: context,
              builder: (context) => EditEventDialog(details.appointments![0]));
        }
      },
    );
  }
}
