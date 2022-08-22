import 'package:flutter/material.dart';

class CommonView extends StatelessWidget {
  final Widget content;
  final String title;

  const CommonView({Key? key, required this.content, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget menu = ListView(
      padding: EdgeInsets.zero,
      children: <ListTile>[
        ListTile(
            title: const Text("Calendar"),
            onTap: () {
              Navigator.pushNamed(context, '/calendar');
            }),
        ListTile(
            title: const Text("Chart"),
            onTap: () {
              Navigator.pushNamed(context, '/graph');
            })
      ],
    );

    final screenWidth = MediaQuery.of(context).size.width;
    const breakpoint = 600;
    const double menuWidth = 240;

    Widget body;
    Widget? drawer;

    if (screenWidth >= breakpoint) {
      body = Row(
        children: [
          SizedBox(
            width: menuWidth,
            child: menu,
          ),
          Container(width: 0.5, color: Colors.black),
          Expanded(child: content),
        ],
      );
      drawer = null;
    } else {
      body = content;
      drawer = Drawer(
          child: Scaffold(
              appBar: AppBar(
                title: const Text("Menu"),
              ),
              body: menu));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      drawer: drawer,

      // floatingActionButton: FloatingActionButton(
      //     onPressed: addNewEventDialogMethod(context),
      //     child: Icon(Icons.add),
      //     tooltip: "Add new event")
    );
  }
}
