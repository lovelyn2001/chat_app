import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String email = '';
  String message = '';
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentUserDetails();
  }

  void getCurrentUserDetails() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      email = user.email ?? '';
    }
    print('current user email is: $email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
          ),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: db.collection("chatMessages").snapshots(),
                builder:
                    (
                      BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot,
                    ) {
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('Something went wrong'),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: Text("Loading..."));
                      }

                      final messages = snapshot.data!.docs;

                      return ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data =
                              messages[index].data()! as Map<String, dynamic>;
                          return ListTile(
                            title: Text(data['message'] ?? ''),
                            subtitle: Text(data['sender'] ?? ''),
                          );
                        },
                      );
                    },
              ),
            ),

            Container(
              decoration: messageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: messageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (message.trim().isEmpty) return;

                      final messages = {
                        "sender": email,
                        "message": message,
                        "timestamp":
                            FieldValue.serverTimestamp(), // for ordering
                      };

                      try {
                        await db.collection("chatMessages").add(messages);
                        print("Message sent!");
                      } catch (e) {
                        print("Error writing document: $e");
                      }

                      textController.clear();
                      message = '';
                    },
                    child: Text('Send', style: sendButtonTextStyle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
