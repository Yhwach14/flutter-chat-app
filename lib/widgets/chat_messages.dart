import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, chatSnapshots) {
        if (chatSnapshots.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
          const Center(child: Text('No messages yet.'));
        }
        if (chatSnapshots.hasError) {
          return const Center(child: Text('No messages yet.'));
        }
        ;
        final loadedMessages = chatSnapshots.data!.docs;
        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),
          reverse: true,
          itemCount: loadedMessages.length,
          itemBuilder: (context, index) {
            final chatMessage =
                loadedMessages[index].data() as Map<String, dynamic>;
            final nextChatMessage = index + 1 < loadedMessages.length
                ? loadedMessages[index + 1].data() as Map<String, dynamic>
                : null;
            final currentChatUserid = chatMessage['userId'];
            final nextChatUserid = nextChatMessage != null
                ? nextChatMessage['userId']
                : null;
            final nextUserIsSame = currentChatUserid == nextChatUserid;

            if (nextUserIsSame) {
              return MessageBubble.next(
                message: chatMessage['text'],
                isMe: authenticatedUser.uid == currentChatUserid,
              );
            } else {
              return MessageBubble.first(
                message: chatMessage['text'],
                username: chatMessage['Username'],
                userImage: chatMessage['userImage'] ?? 'default',
                isMe: authenticatedUser.uid == currentChatUserid,
              );
            }
          },
        );
      },
    );
  }
}
