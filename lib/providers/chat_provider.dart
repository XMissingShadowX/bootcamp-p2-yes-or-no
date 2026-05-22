import 'package:flutter/material.dart';
import 'package:proyecto2yes_or_no_bootcamp/providers/get_yes_no_answer.dart';

import '../domain/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer _getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: "Hola", fromWho: FromWho.me),
    Message(text: "Adios", fromWho: FromWho.me),
  ];

  void sendMessage(String text) async {
    messages.add(Message(text: text, fromWho: FromWho.me));
    notifyListeners();
    moveScrollToBottom();
    if(text.endsWith("?")) await getReplay();
  }

  void moveScrollToBottom() async {
    await Future.delayed(Duration(seconds: 1));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  Future<void> getReplay() async{
    final Message answer = await _getYesNoAnswer.getAnswer();
    messages.add(answer);
    notifyListeners();
    moveScrollToBottom();
  }
}