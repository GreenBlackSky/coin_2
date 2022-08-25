import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:coin_2/storage.dart';

String? _validateName(String? value) {
  if (value == null) {
    return "Diff can not be empty.";
  }
  return null;
}

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

class CreateEventDialog extends AlertDialog {
  static final diffController = TextEditingController();
  static final nameController = TextEditingController();
  static final dateController = DateRangePickerController();

  CreateEventDialog(BuildContext context, {Key? key})
      : super(
            key: key,
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
                  controller: nameController,
                  validator: _validateName,
                  decoration: const InputDecoration(hintText: "description"),
                ),
                TextFormField(
                  controller: diffController,
                  validator: _validateNumber,
                  decoration: const InputDecoration(hintText: "0"),
                ),
                TextButton(
                  child: const Text("Create event"),
                  onPressed: () {
                    storage.events.add(Event(dateController.selectedDate!,
                        nameController.text, int.parse(diffController.text)));
                    Navigator.of(context).pop();
                  },
                ),
              ]),
            ));
}
