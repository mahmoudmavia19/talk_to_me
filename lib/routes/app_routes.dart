import 'package:get/get.dart';
import 'package:talk_to_me/presentation/chats_screen/binding/chat_binding.dart';
import 'package:talk_to_me/presentation/chats_screen/chat_screen.dart';
class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String chatRoute = '/chat';
  static List<GetPage> pages = [
    GetPage(
      name: chatRoute,
      page: () => ChatScreen(),
      bindings: [
        ChatBinding()
        ],
    ),
    GetPage(
       name: initialRoute,
      page: () => ChatScreen(),
      bindings: [
        ChatBinding()
      ],
    )
  ];
}
