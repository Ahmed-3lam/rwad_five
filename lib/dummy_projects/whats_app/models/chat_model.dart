class ChatModel {
  String? name;
  String? image;
  String? createdAt;
  MessageType? messageType;
  ChatModel({
    this.name,
    this.image,
    this.createdAt,
    this.messageType,
  });

  ChatModel.fromJson(Map json) {
    name = json["name"];
    image = json["image"];
    createdAt = json["createdAt"];
    switch (json["message_type"]) {
      case "video":
        messageType = MessageType.VIDEO;

      case "GIF":
        messageType = MessageType.GIF;

      default:
        messageType = MessageType.MESSAGE;
    }
  }
}

enum MessageType {
  VIDEO,
  GIF,
  MESSAGE,
}
