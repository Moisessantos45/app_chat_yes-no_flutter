import 'package:couter_app/Config/helpers/get_yes_no_answer.dart';
import 'package:couter_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  final ScrollController chatScrollController = ScrollController();

  List<Message> listMessage = [
    // Message(message: "Hola como estas?", typeMessage: TypeMessage.me),
  ];

  Future<void> sendMessage(String text) async {
    final Message newMessage =
        Message(message: text, typeMessage: TypeMessage.me);
    listMessage.add(newMessage);

    if (text.endsWith("?")) {
      await herReply();
    }

    notifyListeners();
    moveScrollToButton();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    listMessage.add(herMessage);
    notifyListeners();
    moveScrollToButton();
  }

  Future<void> moveScrollToButton() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 300),
        curve: Curves.easeInOut);
  }
}
