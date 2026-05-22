import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto2yes_or_no_bootcamp/domain/message.dart';
import 'package:proyecto2yes_or_no_bootcamp/providers/chat_provider.dart';
import 'package:proyecto2yes_or_no_bootcamp/widgets/chat/my_message_bubble.dart';
import 'package:proyecto2yes_or_no_bootcamp/widgets/chat/other_message_bubble.dart';
import 'package:proyecto2yes_or_no_bootcamp/widgets/input/message_field_box.dart';

class ChatScreen extends StatelessWidget{
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context){
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        leading: Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(''),
          ),
        ),
        title: Text("El Gopher"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: ListView.builder(
                    itemCount: chatProvider.messages.length,
                    itemBuilder: (context, index) {
                      Message message = chatProvider.messages[index];
                      if (message.fromWho == FromWho.me) {
                        return MyMessageBubble(message: message);
                      }
                      return OtherMessageBubble(message: message);
                  }
                )
              )
            ),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            )
          ]
        )

      )
    );
  }
}