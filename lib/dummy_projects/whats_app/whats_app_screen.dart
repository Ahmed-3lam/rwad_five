import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rwad/dummy_projects/whats_app/models/chat_model.dart';

import '../../const.dart';

class WhatsAppScreen extends StatelessWidget {
  WhatsAppScreen({super.key});
  List<ChatModel> chatList = [];

  @override
  Widget build(BuildContext context) {
    // for (var item in jsonList) {
    //   final chatModel = ChatModel.fromJson(item);
    //   chatList.add(chatModel);
    // }
    chatList = jsonList.map((e) => ChatModel.fromJson(e)).toList();
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(
          CupertinoIcons.chat_bubble_fill,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildCustomChats(
              icon: Icons.lock,
              text: "Locked Chats",
            ),
            _buildCustomChats(
              icon: Icons.archive,
              text: "Archive Chats",
              count: 5,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: chatList.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, index) => _chatItem(chatList[index]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _chatItem(ChatModel model) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.orange,
          backgroundImage: NetworkImage(
            model.image!,
          ),
          radius: 22,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            _messageType(model.messageType!, text: "Hello from egypt"),
          ],
        ),
        Spacer(),
        Text(model.createdAt!)
      ],
    );
  }

  Widget _messageType(
    MessageType messageType, {
    String? text,
  }) {
    if (messageType == MessageType.VIDEO) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            CupertinoIcons.videocam_fill,
            size: 20,
            color: Colors.grey,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "Video",
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      );
    } else if (messageType == MessageType.GIF) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            Icons.gif,
            size: 20,
            color: Colors.grey,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "GIF",
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      );
    } else {
      return Text(text ?? "");
    }
  }

  Widget _buildCustomChats({
    required IconData icon,
    required String text,
    int? count,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.green,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          if (count != null) Text(count.toString())
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.green,
      leading: const Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Text(
          "WhatsApp",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      leadingWidth: 150,
      actions: [
        const Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.search,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
