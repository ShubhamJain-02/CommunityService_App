import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cs_app/firebase/login_signup.dart';
import 'package:cs_app/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class UserAbout extends StatefulWidget {
  const UserAbout({super.key});

  @override
  State<UserAbout> createState() => _UserAboutState();
}

class _UserAboutState extends State<UserAbout> {
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
              width: 20,
            ),
            Text(
              "ABOUT",
              style: TextStyle(
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
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return SafeArea(
            child: Container(
              color: Color.fromARGB(255, 0, 130, 143),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          AnimatedTextKit(
                            animatedTexts: [
                              RotateAnimatedText(
                                  'Hello ${userProvider.currentUser!.name}',
                                  textStyle: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      backgroundColor: Colors.lightBlueAccent)),
                              RotateAnimatedText('GiVVLY',
                                  textStyle: TextStyle(
                                      letterSpacing: 3,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange)),
                              RotateAnimatedText(
                                'Give with generosity',
                                textStyle: TextStyle(
                                    letterSpacing: 2,
                                    fontSize: 30,
                                    color: Colors.lightBlueAccent),
                              ),
                            ],
                            isRepeatingAnimation: true,
                            totalRepeatCount: 10000,
                            pause: Duration(milliseconds: 1000),
                          ),
                        ],
                      )),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.57,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(80)),
                      color: Color.fromARGB(255, 243, 243, 243),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upcoming tasks',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: ListView(
                              children: [
                                events('Event at gurgaon'),
                                events('Plantation drive at Noida'),
                                events('Donation at Yatan Ngo'),
                                events('Cloth donation at cognizant'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Community details',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          color: Color.fromARGB(
                                            255,
                                            235,
                                            232,
                                            253,
                                          )),
                                      child: Center(
                                        child: Text(
                                          '${userProvider.currentUser!.projects}',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 121, 100, 238)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 80,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Projects',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'You have completed ${userProvider.currentUser!.projects} projects!',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          color: Color.fromARGB(
                                              255, 219, 227, 229)),
                                      child: Center(
                                        child: Text(
                                          '${userProvider.currentUser!.donation}',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 13, 72, 72)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 80,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Donations',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'You have donated ${userProvider.currentUser!.donation} times!',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget events(String event) {
  return Column(
    children: [
      ListTile(
        tileColor: Colors.amber,
        iconColor: Colors.greenAccent,
        leading: Icon(
          Icons.energy_savings_leaf,
          size: 30,
        ),
        trailing: Text(
          event,
          style: TextStyle(fontSize: 20),
        ),
      ),
      Divider(
        thickness: 2,
        color: const Color.fromARGB(255, 213, 213, 213),
        endIndent: 10,
        indent: 10,
      )
    ],
  );
}
