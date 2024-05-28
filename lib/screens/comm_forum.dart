import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Comm_forum extends StatefulWidget {
  const Comm_forum({super.key});

  @override
  State<Comm_forum> createState() => _Comm_forumState();
}

class _Comm_forumState extends State<Comm_forum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQzLNoqFt6Y364GWmnPw2lu14PuaEga-_QD3yV4V_OuQ&s'),
              ),
              SizedBox(
                width: 100,
              ),
              Text(
                "DISCOVER",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 130, 143),
                ),
              ),
            ],
          ),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          elevation: 0.00,
          backgroundColor: Color.fromARGB(255, 243, 243, 243),
        ),
        body: SingleChildScrollView(
            child: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Channels',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: View(),
                                  );
                                });
                          },
                          child: Text(
                            'View all',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 130, 143)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Plantation',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Icon(
                                  Icons.emoji_nature,
                                  color: Colors.white,
                                  size: 40,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Donation',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Icon(
                                  Icons.bloodtype,
                                  color: Colors.white,
                                  size: 40,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Teaching',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Icon(
                                  Icons.book_sharp,
                                  color: Colors.white,
                                  size: 40,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Discussion',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Comments(
                      image:
                          'https://t3.ftcdn.net/jpg/06/17/13/26/360_F_617132669_YptvM7fIuczaUbYYpMe3VTLimwZwzlWf.jpg',
                      name: 'Emily Harris',
                      comment:
                          "Thank you for organizing such a wonderful initiative. It's great to see the community come together.",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Comments(
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAHMtmD67ERu8DwRsZYuasfJhqRiOhPu8U8cKhbtaTFDgh0tLxhaNsbZdfEeV0R4UuRIA&usqp=CAU',
                      name: 'Shubham Jain',
                      comment:
                          "Loved the community gardening project. It's amazing to see our neighborhood flourish.",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Comments(
                      image: 'https://i.pngimg.me/thumb/f/720/1d714a7743.jpg',
                      name: 'Jack Robertson',
                      comment:
                          "Does anyone know about upcoming tutoring sessions for local schools? Happy to volunteer!",
                    ),
                  ])),
        )));
  }
}

class Comments extends StatefulWidget {
  final String image;
  final String name;
  final String comment;

  Comments({required this.image, required this.name, required this.comment});

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 243, 243, 243),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.image),
                  radius: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Spacer(),
                Icon(Icons.more_horiz)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(widget.comment),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Chats(),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.chat,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final _chatController = TextEditingController();
  DateTime now = DateTime.now();
  List<String> _chats = ['Wow that\'s great', 'Awesome', 'Good to volunteer'];

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  void _postChat() {
    if (_chatController.text.isNotEmpty) {
      setState(() {
        now = DateTime.now();
        _chats.add(_chatController.text);
        _chatController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chats.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_chats[index]),
                  leading: Text('${now.hour}:${now.minute}'),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _chatController,
                  decoration: InputDecoration(
                    hintText: 'Type your message...',
                  ),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _postChat,
                child: Text('Send'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class View extends StatelessWidget {
  View({super.key});
  List<String> l = [
    'Plantation',
    'Donation',
    'Teaching',
    'Healthcare',
    'NGO visits'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: l.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(l[index]),
                  leading: Icon(
                    Icons.star,
                    color: Colors.greenAccent,
                  ),
                );
              },
            ),
          )
        ]));
  }
}
