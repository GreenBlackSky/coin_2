class Event {
  final DateTime eventTime;
  final int diff;

  Event(this.eventTime, this.diff);
}

class DataStorage {
  List<Event> events = [];
  late DateTime periodStart;
  late DateTime periodEnd;
  int periodStartBalance = 0;

  DataStorage() {
    clear();
  }

  void clear() {
    DateTime now = DateTime.now();
    periodStart = DateTime(now.year, now.month);
    periodEnd = (now.month < 12)
        ? DateTime(now.year, now.month + 1, 0)
        : DateTime(now.year + 1, 1, 0);
    events.clear();
  }
}

var storage = DataStorage();
