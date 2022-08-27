import 'package:coin_2/widgets/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:coin_2/widgets/create_event_dialog.dart';

class CommonView extends StatelessWidget {
  final Widget content;
  final String title;

  const CommonView({Key? key, required this.content, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget navigationMenu = buildNavigationMenu(context);
    Widget button = FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => showDialog(
          context: context, builder: ((context) => const CreateEventDialog())),
    );

    final screenWidth = MediaQuery.of(context).size.width;
    const breakpoint = 600;
    const double menuWidth = 240;

    if (screenWidth >= breakpoint) {
      return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Row(
            children: [
              SizedBox(
                width: menuWidth,
                child: navigationMenu,
              ),
              Container(width: 0.5, color: Colors.black),
              Expanded(child: content),
            ],
          ),
          floatingActionButton: button);
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: content,
          drawer: Drawer(
              child: Scaffold(
                  appBar: AppBar(
                    title: const Text("Menu"),
                  ),
                  body: navigationMenu)),
          floatingActionButton: button);
    }
  }
}
