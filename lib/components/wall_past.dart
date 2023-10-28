import 'package:flutter/material.dart';

class WallPost extends StatelessWidget {
  final String message;
  final String user;

  const WallPost({super.key, required this.message, required this.user});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(h * 0.01)),
      margin:
          EdgeInsets.only(top: h * 0.025, left: h * 0.025, right: h * 0.025),
      padding: EdgeInsets.all(h * 0.025),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user,
                style: TextStyle(color: Colors.grey[500]),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Text(
                message,
                style: TextStyle(fontSize: h * 0.015),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
