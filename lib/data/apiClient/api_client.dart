import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:talk_to_me/core/app_export.dart';
import 'package:talk_to_me/presentation/chats_screen/models/chat_model.dart';

class ApiClient extends GetConnect {

  Gemini gemini = Gemini.instance;

  Future<String?> sendMessage(String message) async{
    return (await gemini.text(message))?.content?.parts?.first.text;
  }

  Future<String?> sendChat(List<MessageModel> messages) async{
    List<Content> chats = [];
    for(var message in messages){
      chats.add(Content(parts: [Parts(text: message.message)],role:message.senderId!=null? 'user':'model'));
    }
    try {
      String? responseText = (await gemini.chat(chats))?.content?.parts?.first.text;
      print(responseText);
      return responseText;
    }catch (e){
      return 'I con\'t understand you';
    }

  }

}
