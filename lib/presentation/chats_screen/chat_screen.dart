import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:talk_to_me/core/app_export.dart';
import 'package:talk_to_me/core/utils/app_strings.dart';
import 'package:talk_to_me/presentation/chats_screen/controller/chat_controller.dart';
import 'package:talk_to_me/presentation/chats_screen/models/chat_model.dart';

class ChatScreen extends GetWidget<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bot Chat'),
      ),
      body: Obx(
        () {
          return ListView.separated(
            shrinkWrap: true,
              itemBuilder:
              (context, index) => controller.messages[index].senderId!=null?  _buildMessage(context,controller.messages[index]):_buildBotMessage(context,controller.messages[index]),
              separatorBuilder: (context, index) => Container(),
              itemCount:  controller.messages.length);
        }
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _messageBox(),
      ),
    );
  }

  _messageBox()=>Form(
    key: controller.fKey,
    child: TextFormField(
      controller: controller.messageController,
        validator: (value) {
        if(value!.isEmpty) {
          return AppStrings.cantBeEmpty;
        }
        },
        decoration: InputDecoration(
            hintText: 'Type a message',
            suffixIcon: IconButton(
              onPressed: () {
                controller.sendMessage();
              },
              icon: Icon(Icons.send),
            )
        )
    ),
  );

  _buildMessage(context,MessageModel messageModel) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(15.v),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(20.v),bottomStart: Radius.circular(30.v),topEnd: Radius.circular(30.v),topStart: Radius.circular(0.v)),
             color: Theme.of(context).colorScheme.onSecondary
          ),
          child: Text(messageModel.message.toString(),style:Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(color: Colors.white),),
        ),
      ),
    );
  }

  _buildBotMessage(context,MessageModel messageModel) {
   return Align(
     alignment: AlignmentDirectional.centerEnd,
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Container(
         padding: EdgeInsets.all(15.v),
         decoration: BoxDecoration(
             borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(30.v),bottomStart: Radius.circular(20.v),topEnd: Radius.circular(0.v),topStart: Radius.circular(30.v)),
             color: Theme.of(context).colorScheme.onPrimary
         ),
         child: DefaultTextStyle(
          style:Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(color: Colors.white),
           child: AnimatedTextKit(
             isRepeatingAnimation: false,
             repeatForever: false,
             animatedTexts: [
               TyperAnimatedText(messageModel.message.toString(),speed: Duration(milliseconds: 50)),
             ],
           )
         ),
         ),
     ),
   );
  }


}
