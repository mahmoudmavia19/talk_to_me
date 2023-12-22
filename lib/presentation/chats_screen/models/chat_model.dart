/// This class defines the variables used in the [ChatModel],
/// and is typically used to hold data that is passed between different parts of the application.
class ChatModel {
 String chatId;
 List<MessageModel> messages;
 ChatModel({required this.chatId, required this.messages});
}
class MessageModel {
  String? message;
  String? messageId;
  String? senderId;
  String? receiverType;
  DateTime? date;
  MessageModel({
    required this.message,
    required this.messageId,
      this.senderId,
    required this.date,
    this.receiverType
  });
}