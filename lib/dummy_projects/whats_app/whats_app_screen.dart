import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rwad/dummy_projects/whats_app/models/chat_model.dart';

import '../../const.dart';

class WhatsAppScreen extends StatelessWidget {
  WhatsAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                itemBuilder: (context, index) => _chatItem(
                  image: chatList[index].image!,
                  name: chatList[index].name!,
                  time: chatList[index].createdAt!,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<ChatModel> chatList = [
    ChatModel(
      name: "Ahmed Allam",
      image: image1,
      createdAt: "12:00 PM",
    ),
    ChatModel(
      name: "Ahmed Allam",
      image: image1,
      createdAt: "12:00 PM",
    ),
    ChatModel(
      name: "Ahmed Allam",
      image: image1,
      createdAt: "12:00 PM",
    ),
    ChatModel(
      name: "Ahmed Allam",
      image: image1,
      createdAt: "12:00 PM",
    ),
    ChatModel(
      name: "Ahmed Allam",
      image: image1,
      createdAt: "12:00 PM",
    ),
    ChatModel(
      name: "Mohamed Allam",
      image: image2,
      createdAt: "11:00 PM",
    ),
    ChatModel(
      name: "Alaa Allam",
      image: image3,
      createdAt: "02:00 PM",
    ),
    ChatModel(
      name: "Ahmed Allam",
      image: image1,
      createdAt: "03:00 PM",
    ),
    ChatModel(
      name: "Ahmed Allam",
      image: image2,
      createdAt: "04:00 PM",
    ),
    ChatModel(
      name: "Ahmed Allam",
      image: image3,
      createdAt: "05:00 PM",
    ),
    ChatModel(
      name: "Ahmed Allam",
      image: image1,
      createdAt: "06:00 PM",
    ),
    ChatModel(
      name: "Ahmed Allam",
      image: image1,
      createdAt: "06:00 PM",
    ),
    ChatModel(
      name: "Ahmed Allam",
      image: image1,
      createdAt: "06:00 PM",
    ),
    ChatModel(
      name: "Ahmed Allam",
      image: image1,
      createdAt: "06:00 PM",
    ),
  ];

  Widget _chatItem({
    required String image,
    required String name,
    required String time,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.orange,
          backgroundImage: NetworkImage(
            image,
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
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
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
            ),
          ],
        ),
        Spacer(),
        Text(time)
      ],
    );
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
