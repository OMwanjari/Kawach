import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health/components/my_textbox.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    //for currentuser
    final currentUser = FirebaseAuth.instance.currentUser!;
    // for all users
    final userCollection = FirebaseFirestore.instance.collection("user");
    Future<void> editField(String field) async {
      String newValue = "";
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text(
            // ignore: prefer_interpolation_to_compose_strings
            "Edit " + field,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          content: TextField(
              autofocus: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "Enter new $field",
                  hintStyle: const TextStyle(color: Colors.grey)),
              onChanged: (value) {
                newValue = value;
              }),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel",
                    style: TextStyle(
                      color: Colors.white,
                    ))),
            TextButton(
                onPressed: () => Navigator.of(context).pop(newValue),
                child: const Text("Save",
                    style: TextStyle(
                      color: Colors.white,
                    )))
          ],
        ),
      );
      //updating firestore
      // ignore: prefer_is_empty
      if (newValue.trim().length > 0) {
        await userCollection.doc(currentUser.email).update({field: newValue});
      }
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("user")
              .doc(currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;

              return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: h * 0.02),
                    child: Image.asset(
                      "assets/images/pro.png",
                      height: h * 0.1,
                    ),
                  ),
                  Text(
                    currentUser.email!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: h * 0.015),
                  ),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: h * 0.02),
                    child: Text(
                      "Details",
                      style: TextStyle(
                          color: Colors.grey[700], fontSize: h * 0.02),
                    ),
                  ),
                  MyTextBox(
                    text: userData['Username'],
                    sectionName: "User Name",
                    onPressed: () => editField('Username'),
                  ),
                  MyTextBox(
                    text: userData['Phone no'],
                    sectionName: "Your Phone no.",
                    onPressed: () => editField('Phone no'),
                  ),
                  MyTextBox(
                    text: userData['1st Guardian no'],
                    sectionName: "1st Guardian no.",
                    onPressed: () => editField('1st Guardian no'),
                  ),
                  MyTextBox(
                    text: userData['2nd Guardian no'],
                    sectionName: "2nd Guardian no.",
                    onPressed: () => editField('2nd Guardian no'),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: h * 0.02),
                    child: Text(
                      "My Posts",
                      style: TextStyle(
                          color: Colors.grey[700], fontSize: h * 0.02),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
