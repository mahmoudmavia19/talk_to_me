import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:talk_to_me/core/app_export.dart';

class ApiClient extends GetConnect {

  Gemini gemini = Gemini.instance;

  Future<String?> sendMessage(String message) async{
    return (await gemini.text(message))?.content?.parts?.first.text;
  }

}
