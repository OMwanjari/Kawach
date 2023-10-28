// ignore: depend_on_referenced_packages
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart%20';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
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
  gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.pink.shade300, Colors.pink.shade100],
      stops: const [0.1, 0.9]),
);

// ignore: non_constant_identifier_names
BoxDecoration NearDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(30),
);

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    var font30 = h * 0.025;
    var font40 = h * 0.027;
    var font60 = h * 0.05;
    var sizedboxlen = h * 0.01;
    String googlemap = '';
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: font60),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'emergency'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: font40,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: font60),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'call'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: h * 0.02,
                        color: const Color.fromARGB(255, 105, 105, 105)),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                FlutterPhoneDirectCaller.callNumber('+91 100');
              },
              child: Container(
                height: h * 0.08,
                width: w * 0.8,
                alignment: Alignment.centerLeft,
                decoration: butDecoration.copyWith(
                    gradient: const LinearGradient(
                  colors: [Colors.red, Colors.blue],
                )),
                child: Padding(
                  padding: EdgeInsets.only(left: font40),
                  child: Text(
                    "police".tr,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: font30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                FlutterPhoneDirectCaller.callNumber('+91 1090');
              },
              child: Container(
                height: h * 0.08,
                width: w * 0.8,
                alignment: Alignment.centerLeft,
                decoration: butDecoration,
                child: Padding(
                  padding: EdgeInsets.only(left: font40),
                  child: Text(
                    "women".tr,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: font30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                FlutterPhoneDirectCaller.callNumber('+91 108');
              },
              child: Container(
                height: h * 0.08,
                width: w * 0.8,
                alignment: Alignment.centerLeft,
                decoration: butDecoration.copyWith(
                    gradient: LinearGradient(
                  colors: [Colors.blue.shade300, Colors.blue.shade100],
                )),
                child: Padding(
                  padding: EdgeInsets.only(left: font40),
                  child: Text(
                    "ambulance".tr,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: font30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                FlutterPhoneDirectCaller.callNumber('+91 14567');
              },
              child: Container(
                height: h * 0.08,
                width: w * 0.8,
                alignment: Alignment.centerLeft,
                decoration: butDecoration.copyWith(
                    gradient: LinearGradient(
                  colors: [Colors.brown.shade200, Colors.brown.shade100],
                )),
                child: Padding(
                  padding: EdgeInsets.only(left: font40),
                  child: Text(
                    'senior'.tr,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: font30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: font60),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'nearby'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: font40,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: font60),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'services'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: h * 0.02,
                        color: const Color.fromARGB(255, 105, 105, 105)),
                  ),
                ),
              ],
            ),
            //nearby services 1st row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        googlemap =
                            'https://www.google.com/maps/search/?api=1&query=police+station+near+me';
                        launch(googlemap);
                      },
                      child: Container(
                        height: font60,
                        width: font60,
                        alignment: Alignment.centerLeft,
                        decoration: NearDecoration,
                        child: const Image(
                          image: AssetImage("assets/images/police.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizedboxlen,
                    ),
                    Text(
                      "policestation".tr,
                      style: const TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        googlemap =
                            'https://www.google.com/maps/search/?api=1&query=hospital+near+me';
                        launch(googlemap);
                      },
                      child: Container(
                        height: font60,
                        width: font60,
                        alignment: Alignment.centerLeft,
                        decoration: NearDecoration,
                        child: const Image(
                          image: AssetImage("assets/images/hospital.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizedboxlen,
                    ),
                    Text(
                      "hospital".tr,
                      style: const TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        googlemap =
                            'https://www.google.com/maps/search/?api=1&query=fire+station+near+me';
                        launch(googlemap);
                      },
                      child: Container(
                        height: font60,
                        width: font60,
                        alignment: Alignment.centerLeft,
                        decoration: NearDecoration,
                        child: const Image(
                          image: AssetImage("assets/images/fire.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizedboxlen,
                    ),
                    Text(
                      "fire".tr,
                      style: const TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
            // 2nd row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        googlemap =
                            'https://www.google.com/maps/search/?api=1&query=medical+near+me';
                        launch(googlemap);
                      },
                      child: Container(
                        height: font60,
                        width: font60,
                        alignment: Alignment.centerLeft,
                        decoration: NearDecoration,
                        child: const Image(
                          image: AssetImage("assets/images/medical.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizedboxlen,
                    ),
                    Text(
                      "medical".tr,
                      style: const TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        googlemap =
                            'https://www.google.com/maps/search/?api=1&query=hotel+near+me';
                        launch(googlemap);
                      },
                      child: Container(
                        height: font60,
                        width: font60,
                        alignment: Alignment.centerLeft,
                        decoration: NearDecoration,
                        child: const Image(
                          image: AssetImage("assets/images/hotel.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizedboxlen,
                    ),
                    Text(
                      "hotel".tr,
                      style: const TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        googlemap =
                            'https://www.google.com/maps/search/?api=1&query=fuel+pump+near+me';
                        launch(googlemap);
                      },
                      child: Container(
                        height: font60,
                        width: font60,
                        alignment: Alignment.centerLeft,
                        decoration: NearDecoration,
                        child: const Image(
                          image: AssetImage("assets/images/fuel.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizedboxlen,
                    ),
                    Text(
                      "fuel".tr,
                      style: const TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
