// Import necessary packages for authentication, UI, constants, Firestore, and custom widgets
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app/components/bubble_button.dart';

// Main chat screen widget
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String email = '';
  // Store the message being typed
  String message = '';
  // Firestore database instance
  FirebaseFirestore db = FirebaseFirestore.instance;
  // Controller for the message input field
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Get current user details when screen initializes
    getCurrentUserDetails();
  }

  // Fetch current user's email from FirebaseAuth
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
          // Logout button
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
            // Display chat messages
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: db
                    .collection("chatMessages")
                    .orderBy('timestamp', descending: false)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text('Loading....'));
                  }

                  // Get list of messages from snapshot
                  final messages = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      // Cast message data to Map
                      messages[index].data() as Map<String, dynamic>;
                      // Check if the message is sent by current user
                      final bool isMe = messages[index]['sender'] == email;

                      // Custom chat bubble widget
                      return BubbleButton(
                        isMe: isMe,
                        text1: messages[index]['message'],
                        text2: messages[index]['sender'],
                      );
                    },
                  );
                },
              ),
            ),

            // Message input area
            Container(
              decoration: messageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onChanged: (value) {
                        // Update message as user types
                        message = value;
                      },
                      decoration: messageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      // Prevent sending empty messages
                      if (message.trim().isEmpty) return;

                      // Prepare message data
                      final messages = {
                        "sender": email,
                        "message": message,
                        "timestamp": FieldValue.serverTimestamp(),
                      };

                      try {
                        // Add message to Firestore
                        await db.collection("chatMessages").add(messages);
                        print("Message sent!");
                      } catch (e) {
                        print("Error writing document: $e");
                      }

                      // Clear input field after sending
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
