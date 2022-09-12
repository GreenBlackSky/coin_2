import 'package:flutter/material.dart';
import 'package:coin_2/storage.dart';

class EditEventDialog extends StatefulWidget {
  final Event event;

  const EditEventDialog(this.event, {Key? key}) : super(key: key);

  @override
  State<EditEventDialog> createState() => _EditEventDialogState();
}

class _EditEventDialogState extends State<EditEventDialog> {
  final _diffController = TextEditingController();
  final _descriptionController = TextEditingController();
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
    _choosenDate = widget.event.eventDate;
    _diffController.text = widget.event.diff.toString();
    _descriptionController.text = widget.event.description;
    return AlertDialog(
        title: AppBar(title: const Text("Edit event")),
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
                controller: _descriptionController,
                validator: _validateDescription,
                decoration: const InputDecoration(hintText: "description"),
              ),
              TextFormField(
                controller: _diffController,
                validator: _validateNumber,
                decoration: const InputDecoration(hintText: "0"),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton.icon(
                icon: const Icon(Icons.edit_outlined),
                label: const Text("Edit event"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    storage.removeEvent(widget.event.id);
                    storage.addEvent(_choosenDate, _descriptionController.text,
                        int.parse(_diffController.text));
                    Navigator.of(context).pop();
                  }
                },
              ),
              const SizedBox(height: 8.0),
              ElevatedButton.icon(
                icon: const Icon(Icons.delete_forever_outlined),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                label: const Text("Delete event"),
                onPressed: () {
                  storage.removeEvent(widget.event.id);
                  Navigator.of(context).pop();
                },
              ),
            ]),
          ),
        ));
  }
}
