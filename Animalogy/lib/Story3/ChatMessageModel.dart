import 'package:flutter/material.dart';
import 'package:animalogy/FadeAnimation.dart';
import 'package:animalogy/ThemeColor.dart';

class Chat{
  List<ChatMessage> messages;
  Chat(this.messages);
  bool firstRender = true;

  List<Widget> render() {
    double delay = 1;
    if(firstRender) {
      firstRender = false;
      return messages.map((e) {
        delay++;
        return e.render(delay);
      }).toList();
    }
    return messages.map((e) => e.render(0)).toList();
  }

  addMessage(ChatMessage message) {
    messages.add(message);
  }
}

class ChatMessage {
  String messageContent;
  bool leftSide;
  String messageType;
  void Function(ChatMessage) onTap;

  ChatMessage({ required this.messageContent, required this.messageType, required this.onTap, this.leftSide = true });

  Widget render(double delay) {
    return FadeAnimation(
        delay,
        GestureDetector(
          onTap: (){
            onTap;
          },
          child: Container(
            padding: leftSide ? const EdgeInsets.only(left: 14, right: 80, top: 10, bottom: 10)
                : const EdgeInsets.only(left: 80, right: 14, top: 10, bottom: 10),
            child: Align(
              alignment: leftSide ? Alignment.topLeft : Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: leftSide ? kLeftChat : kChatThemeColor,
                ),
                padding: const EdgeInsets.all(16),
                child: leftSide ? Text(messageContent,style: const TextStyle(fontSize: 15))
                    : Text(messageContent,style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
        )
    );
  }

}



class ChatMessagePromp extends ChatMessage {
  List<ChatMessagePromptOptions> options;
  // bool checkCenter;

  ChatMessagePromp({
    required super.messageContent,
    required super.messageType,
    required this.options, required super.onTap
  });

  @override
  Widget render(double delay) {
    List<Widget> children = [
      Align(
        // alignment: this.checkCenter ? Alignment.center : Alignment.topRight,
        alignment: Alignment.topRight,
        child: Container(
          width: double.infinity,
          // padding: this.checkCenter ? EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10) : EdgeInsets.only(left: 80, right: 80, top: 10, bottom: 10),
          padding: const EdgeInsets.only(left: 80, right: 80, top: 10, bottom: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20),
            ),
            color: kLeftChat,
          ),
          child: Text(messageContent, textAlign: TextAlign.center, style: const TextStyle(fontSize: 15),),
        ),
      ),
      const Divider(height: 3,),
    ];
    children.addAll(options.map((e) => e.render()));
    return FadeAnimation(delay,
        Container(
          width: double.infinity,
          // padding: this.checkCenter ? EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10) : EdgeInsets.only(left: 80, right: 14, top: 10, bottom: 10),
          padding: const EdgeInsets.only(left: 80, right: 14, top: 10, bottom: 10),
          child: Align(
            // alignment: this.checkCenter ? Alignment.center : Alignment.topRight,
            alignment: Alignment.topRight,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                )
            ),
          ),
        )
    );
  }
}

class ChatMessagePromptOptions{
  String option;
  String prompt;
  ChatMessage confirmMessage;
  // ChatMessagePromp checkCen;
  void Function(ChatMessage) onTap;
  // ChatMessagePromptOptions({required this.option, required this.prompt, required this.checkCen, required this.onTap, required this.confirmMessage});
  ChatMessagePromptOptions({required this.option, required this.prompt, required this.onTap, required this.confirmMessage});
  Widget render (){
    return FadeAnimation(2, Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
      child: GestureDetector(
        onTap: () => onTap(confirmMessage),
        // child: this.checkCen.checkCenter ? Text("$option) $prompt", style: TextStyle(fontSize: 15, color: Colors.green),) : Text("$option) $prompt", style: TextStyle(fontSize: 15, color: kThemeColor),),
        child: Text("$option) $prompt", style: const TextStyle(fontSize: 15, color: kThemeColor),),
      ),
    ));
  }
}

class StoryContainer extends ChatMessage{

  StoryContainer({
    required super.messageContent,
    required super.messageType,
    required super.onTap
  });

  @override
  Widget render(double delay) {
    return FadeAnimation(
        delay,
        GestureDetector(
          onTap: () {
            onTap;
          },
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(20),
                //   color: Colors.green,
                // ),
                padding: const EdgeInsets.all(16),
                child: Text(messageContent,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          ),
        )
    );
  }

}