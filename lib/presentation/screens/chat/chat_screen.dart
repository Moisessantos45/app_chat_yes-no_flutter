import 'package:couter_app/domain/entities/message.dart';
import 'package:couter_app/presentation/providers/chat_provider.dart';
import 'package:couter_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:couter_app/presentation/widgets/chat/my_mesaage_bubble.dart';
import 'package:couter_app/presentation/widgets/chat/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage:
                NetworkImage("https://i.ibb.co/vVYw6B9/bg-Makabe-shizuru.webp"),
          ),
        ),
        title: const Text('Moises santos 👻'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.listMessage.length,
              itemBuilder: (context, index) {
                final message = chatProvider.listMessage[index];

                return (message.typeMessage == TypeMessage.hers)
                    ? HerMessageBubble(
                        message: message,
                      )
                    : MyMessageBubble(
                        message: message,
                      );
              },
            )),
            MyMessageFieldBox(
              onValue: chatProvider.sendMessage,
              //onValue: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
