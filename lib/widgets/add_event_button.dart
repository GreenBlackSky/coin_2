import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:coin_2/storage.dart';

String? _validateNumber(String? value) {
  if (value == null) {
    return "Diff can not be empty.";
  }
  try {
    int.parse(value);
  } catch (e) {
    return "Value must be integer";
  }
  return null;
}

Widget buildAddEventButton(BuildContext context) {
  final diffController = TextEditingController();
  final dateController = DateRangePickerController();

  return FloatingActionButton(
      onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
              title: AppBar(title: const Text("Create event")),
              content: Scaffold(
                body: Column(children: [
                  SfDateRangePicker(
                    view: DateRangePickerView.month,
                    selectionMode: DateRangePickerSelectionMode.single,
                    allowViewNavigation: false,
                    minDate: storage.periodStart,
                    maxDate: storage.periodEnd,
                    controller: dateController,
                  ),
                  TextFormField(
                    controller: diffController,
                    validator: _validateNumber,
                  ),
                  TextButton(
                    child: const Text("Create event"),
                    onPressed: () {
                      storage.events.add(Event(dateController.selectedDate!,
                          int.parse(diffController.text)));
                      Navigator.of(context).pop();
                    },
                  ),
                ]),
              ))),
      child: const Icon(Icons.add),
      tooltip: "Add new event");
}
