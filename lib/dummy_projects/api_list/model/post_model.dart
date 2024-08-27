class PostModel {
  String? title;
  String? body;

  PostModel.fromJson(Map json) {
    title = json["title"];
    body = json["body"];
  }
}
