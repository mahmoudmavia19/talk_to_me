import 'package:flutter/material.dart';
import 'package:talk_to_me/core/app_export.dart';
import 'package:talk_to_me/core/utils/app_strings.dart';
import 'package:talk_to_me/presentation/chats_screen/controller/chat_controller.dart';
import 'package:talk_to_me/presentation/chats_screen/models/chat_model.dart';
import 'package:talk_to_me/widgets/animated_decorated_text.dart';

class ChatScreen extends GetWidget<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bot Chat'),
      ),
      body: Obx(() {
        var messages = controller.messages.reversed.toList();
        return ListView.separated(
          padding: EdgeInsets.only(bottom: 100),
            shrinkWrap: true,
            reverse: true,
            itemBuilder: (context, index) =>
               messages[index].senderId != null
                    ? _buildMessage(context, messages[index])
                    : _buildBotMessage(context, messages[index]),
            separatorBuilder: (context, index) => Container(),
            itemCount:messages.length);
      }),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _messageBox(),
      ),
    );
  }

  _messageBox() => Form(
        key: controller.fKey,
        child: TextFormField(
            controller: controller.messageController,
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.cantBeEmpty;
              }
              return null;
            },
            onFieldSubmitted: (value) {
              controller.sendMessage();
            },
            decoration: InputDecoration(
                hintText: 'Type a message',
                suffixIcon: IconButton(
                  onPressed: () {
                  //  controller.sendMessage();
                    controller.sendChat();
                  },
                  icon: Icon(Icons.send),
                ))),
      );

  _buildMessage(context, MessageModel messageModel) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(15.v),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(20.v),
                  bottomStart: Radius.circular(30.v),
                  topEnd: Radius.circular(30.v),
                  topStart: Radius.circular(0.v)),
              color: Theme.of(context).colorScheme.onSecondary),
          child: Text(
            messageModel.message.toString(),
            style: Theme.of(context)
                .primaryTextTheme
                .bodyLarge
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _buildBotMessage(context, MessageModel messageModel) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(15.v),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(30.v),
                  bottomStart: Radius.circular(20.v),
                  topEnd: Radius.circular(0.v),
                  topStart: Radius.circular(30.v)),
              color: Theme.of(context).colorScheme.onPrimary),
          child:
          AnimatedDecoratedText(messageModel.message.toString())
          /*DefaultTextStyle(
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                repeatForever: false,
                animatedTexts: [
                  TyperAnimatedText(''),
                      speed: Duration(milliseconds: 50)),
                ],
              )),*/
        ),
      ),
    );
  }
}
