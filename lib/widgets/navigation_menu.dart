import 'package:flutter/material.dart';

Widget buildNavigationMenu(BuildContext context) {
  return ListView(
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
}
