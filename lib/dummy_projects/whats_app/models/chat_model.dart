class ChatModel {
  String? name;
  String? image;
  String? createdAt;

  ChatModel({
    this.name,
    this.image,
    this.createdAt,
  });

  ChatModel.fromJson(Map json) {
    name = json["name"];
    image = json["image"];
    createdAt = json["createdAt"];
  }
}

Map json = {"name": "Ahmed ALlam", "image": "htto", "createdAt": "9:10 PM"};
