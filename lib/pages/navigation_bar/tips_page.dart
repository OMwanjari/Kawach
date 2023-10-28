// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:get/get.dart%20';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

BoxDecoration butDecoration = BoxDecoration(
  color: Colors.grey[500],
  borderRadius: BorderRadius.circular(30),
  boxShadow: [
    BoxShadow(
        color: Colors.grey.shade700,
        offset: const Offset(4, 4),
        blurRadius: 15,
        spreadRadius: 1),
    //light shadow
    BoxShadow(
        color: Colors.grey.shade200,
        offset: const Offset(-4, -4),
        blurRadius: 15,
        spreadRadius: 1),
  ],
);

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    var font60 = h * 0.05;
    TextStyle newstyle = TextStyle(
        fontWeight: FontWeight.bold, fontSize: h * 0.023, color: Colors.black);
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            margin: EdgeInsets.only(left: font60),
            alignment: Alignment.topLeft,
            child: Text(
              "self".tr,
              style: newstyle,
            ),
          ),
          Container(
            height: h * 0.18,
            width: w * 0.8,
            decoration: butDecoration.copyWith(
              image: const DecorationImage(
                image: AssetImage("assets/images/technique.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: h * 0.18,
            width: w * 0.8,
            decoration: butDecoration.copyWith(
              image: const DecorationImage(
                image: AssetImage("assets/images/tools.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: font60),
            alignment: Alignment.topLeft,
            child: Text(
              "gov".tr,
              style: newstyle,
            ),
          ),
          Container(
            height: h * 0.18,
            width: w * 0.8,
            decoration: butDecoration.copyWith(
              image: const DecorationImage(
                image: AssetImage("assets/images/initiative.png"),
                fit: BoxFit.cover,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
