import 'package:flutter/material.dart';
import 'package:coin_2/storage.dart';

class CreateEventDialog extends StatefulWidget {
  const CreateEventDialog({Key? key}) : super(key: key);

  @override
  State<CreateEventDialog> createState() => _CreateEventDialogState();
}

class _CreateEventDialogState extends State<CreateEventDialog> {
  final diffController = TextEditingController();
  final descriptionController = TextEditingController();
  var _choosenDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  String? _validateDescription(String? value) {
    if (value == null || value == "") {
      return "Descritption can not be empty.";
    }
    return null;
  }

  String? _validateNumber(String? value) {
    if (value == null || value == "") {
      return "Value can not be empty.";
    }
    try {
      int.parse(value);
    } catch (e) {
      return "Value must be integer";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: AppBar(title: const Text("Create event")),
        content: Scaffold(
          body: Form(
            key: _formKey,
            child: Column(children: [
              CalendarDatePicker(
                initialDate: _choosenDate,
                firstDate: storage.periodStart,
                lastDate: storage.periodEnd,
                onDateChanged: (value) {
                  setState(() {
                    _choosenDate = value;
                  });
                },
              ),
              TextFormField(
                controller: descriptionController,
                validator: _validateDescription,
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
                  if (_formKey.currentState!.validate()) {
                    storage.addEvent(Event(
                        _choosenDate,
                        descriptionController.text,
                        int.parse(diffController.text)));
                    Navigator.of(context).pop();
                  }
                },
              ),
            ]),
          ),
        ));
  }
}
