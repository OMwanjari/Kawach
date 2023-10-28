import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;
  const MyListTile(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return ListTile(
      leading: Icon(
        icon,
        size: h * 0.03,
        color: Colors.black,
      ),
      title: Text(text, style: TextStyle(fontSize: h * 0.015)),
      onTap: onTap,
    );
  }
}
