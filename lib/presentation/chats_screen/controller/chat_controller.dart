import 'package:flutter/cupertino.dart';
import 'package:talk_to_me/core/app_export.dart';
import 'package:talk_to_me/data/apiClient/api_client.dart';
import 'package:talk_to_me/presentation/chats_screen/models/chat_model.dart';

class ChatController extends GetxController {
  Rx<ChatModel> chatModelObj = Rx<ChatModel>(ChatModel(chatId: '0',messages: [])) ;
  RxList<MessageModel> messages = RxList<MessageModel>([]) ;
  var apiClient = Get.find<ApiClient>();
  TextEditingController messageController = TextEditingController();
  GlobalKey<FormState> fKey = GlobalKey<FormState>();
  sendMessage() {
    if(fKey.currentState!.validate()){
      messages.add(MessageModel(
          message: messageController.text,
          date:DateTime.now() ,
          messageId: '0',
        senderId: '0'
      ));
      print('sender message ${messages.last.message}');
      apiClient.sendMessage(messageController.text).then((value){
        print('value');
        messageController.clear();
        messages.add(MessageModel(
            message: value,
            date:DateTime.now() ,
            messageId: '0',
            receiverType: '0',
        ));
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
