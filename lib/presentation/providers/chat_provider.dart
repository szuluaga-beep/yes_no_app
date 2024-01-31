import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnwer = GetYesNoAnswer();

  List<Message> messagesList = [
    Message(text: 'Hola amor', fromWho: FromWho.mine),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.mine),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(
      text: text,
      fromWho: FromWho.mine,
    );

    messagesList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }
    notifyListeners();
    moveScrollToBotton();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnwer.getAnswer();

    messagesList.add(herMessage);
    notifyListeners();
    moveScrollToBotton();
  }

  Future<void> moveScrollToBotton() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.elasticInOut);
  }
}
