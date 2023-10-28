// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart%20';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_sms/flutter_sms.dart';

String address = '';
String location = '';
String message = "";
String gud1 = '';
String gud2 = '';

List<String> recipents = ["100", gud1, gud2];

class MainPage extends StatelessWidget {
  const MainPage({super.key});

//for locator
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

//locator ended
  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address =
        '${place.street},${place.subLocality},${place.locality},${place.postalCode}';
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final currentUser = FirebaseAuth.instance;

    var font25 = h * 0.025;
    var buttonsize = h * 0.24;
    var sos = h * 0.05;
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: h * 0.05,
            ),
            Container(
                margin: EdgeInsets.only(left: w * 0.07),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'welcome'.tr,
                          style: TextStyle(
                              fontSize: font25,
                              color: const Color.fromARGB(255, 105, 105, 105)),
                        ),
                      ],
                    ),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("user")
                            .where("uid",
                                isEqualTo: currentUser.currentUser!.uid)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  var data = snapshot.data!.docs[i];
                                  gud1 = data["1st Guardian no"];
                                  gud2 = data["2nd Guardian no"];
                                  return Text(data["Username"],
                                      style: TextStyle(
                                          fontSize: h * 0.02,
                                          color: const Color.fromARGB(
                                              255, 105, 105, 105)));
                                });
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                    Text('alert'.tr,
                        style: TextStyle(
                            fontSize: h * 0.08, fontWeight: FontWeight.bold)),
                    Text(
                      "$gud1,$gud2",
                      style: TextStyle(fontSize: h * 0.0001),
                    ),
                    Text(
                      'tap'.tr,
                      style: TextStyle(fontSize: font25),
                    )
                  ],
                )),
            // ignore: sized_box_for_whitespace
            Container(
              height: h * 0.42,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );

                      Position position = await _determinePosition();
                      location = '${position.latitude},${position.longitude}';
                      await GetAddressFromLatLong(position);
                      message =
                          'Help! I am in Emergency , my Location :$address, https://www.google.com/maps/search/?api=1&query=$location , (Message BY KAWACH APP)';
                      Future.delayed(const Duration(milliseconds: 5), () {
                        _sendSMS(message, recipents);
                      });
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                      Future.delayed(const Duration(seconds: 7), () {
                        FlutterPhoneDirectCaller.callNumber('+91 100');
                      });
                    },
                    child: Container(
                      height: buttonsize,
                      width: buttonsize,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[500],
                        shape: BoxShape.circle,
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
                            colors: [Colors.red.shade400, Colors.red.shade800],
                            stops: const [0.1, 0.9]),
                      ),
                      child: Text(
                        "SOS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: sos,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendSMS(String message, List<String> recipents) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _result = await sendSMS(message: message, recipients: recipents)
        // ignore: body_might_complete_normally_catch_error
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
}
