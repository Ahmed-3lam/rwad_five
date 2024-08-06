import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessangerScreen extends StatelessWidget {
  const MessangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _searchField(),
                Container(
                  height: 40,
                  child: ListView.separated(
                    itemCount: 100,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => Container(
                      width: 20,
                    ),
                    itemBuilder: (context, index) => _statusItem(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ListView.separated(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (c, i) => SizedBox(
                          height: 20,
                        ),
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (c, i) => Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage("assets/images/man.jpg"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Alaa ohamed",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  child: Text(
                                    "Welcome to our new team ",
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.check_circle,
                              color: Colors.grey,
                            )
                          ],
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _statusItem() {
    return const Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage("assets/images/man.jpg"),
        ),
        CircleAvatar(
          radius: 8,
          backgroundColor: Colors.green,
        ),
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          ),
          label: Text(
            "Search",
            style: TextStyle(color: Colors.grey),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/man.jpg"),
        ),
      ),
      title: const Text(
        "Chats",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        const Icon(CupertinoIcons.camera),
        const SizedBox(
          width: 30,
        ),
        const Icon(CupertinoIcons.square_pencil),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
