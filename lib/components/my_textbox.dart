import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;
  const MyTextBox(
      {super.key,
      required this.text,
      required this.sectionName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(h * 0.015)),
      padding: EdgeInsets.only(left: h * 0.015, bottom: h * 0.015),
      margin: EdgeInsets.only(left: h * 0.01, right: h * 0.01, top: h * 0.01),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sectionName,
              style: TextStyle(color: Colors.grey[500], fontSize: h * 0.015),
            ),
            IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.settings,
                  color: Colors.grey[500],
                  size: h * 0.02,
                ))
          ],
        ),
        Text(text, style: TextStyle(fontSize: h * 0.015)),
      ]),
    );
  }
}
