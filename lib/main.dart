import 'package:flutter/material.dart';

import 'views/calendar_view.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "COIN 2",
      initialRoute: '/login',
      routes: {
        '/login': (context) => MonthCalendarView(),
        '/signup': (context) => MonthCalendarView(),
        '/calendar': (context) => const MonthCalendarView(),
      },
    );
  }
}
