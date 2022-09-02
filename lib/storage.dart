class Event {
  final DateTime eventDate;
  final int diff;
  final String description;
  late final int _id;

  static int totalId = 0;

  Event(this.eventDate, this.description, this.diff) {
    _id = totalId;
    totalId++;
  }

  get id => _id;

  @override
  String toString() {
    return "${eventDate.toString()}: $description $diff";
  }
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

  void addEvent(DateTime date, String description, int diff) {
    var event = Event(date, description, diff);
    int i = 0;
    while (i < events.length && events[i].eventDate.day < event.eventDate.day) {
      i++;
    }
    events.insert(i, event);
  }

  void removeEvent(int id) {
    int i = 0;
    for (int i = 0; i < this.events.length; i++) {
      if (events[i].id == id) {
        events.removeAt(i);
        break;
      }
    }
  }
}

var storage = DataStorage();
