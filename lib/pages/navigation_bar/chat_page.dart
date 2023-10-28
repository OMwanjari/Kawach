// ignore: depend_on_referenced_packages
// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health/components/wall_past.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  final textcontroller = TextEditingController();

  void postMessage() {
    //only post if there is something in the Textfield
    if (textcontroller.text.isNotEmpty) {
      FirebaseFirestore.instance.collection("User Posts").add({
        'UserEmail': currentUser.email,
        'Message': textcontroller.text,
        'TimeStamp': Timestamp.now(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Column(children: [
          //wall
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("User Posts")
                  .orderBy("TimeStamp", descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    // ignore: avoid_types_as_parameter_names
                    itemBuilder: (context, Index) {
                      final post = snapshot.data!.docs[Index];

                      return WallPost(
                          message: post['Message'], user: post['UserEmail']);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error:${snapshot.error}'),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          //post message
          Padding(
            padding: EdgeInsets.all(h * 0.025),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                      controller: textcontroller,
                      obscureText: false,
                      decoration: const InputDecoration(
                        hintText: "Enter Message",
                        filled: true,
                        fillColor: Colors.white70,
                      )),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(h * 0.01)),
                    child: IconButton(
                      onPressed: postMessage,
                      icon: const Icon(Icons.done),
                      color: Colors.white,
                    ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
