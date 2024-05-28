import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:cs_app/firebase/login_signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Donation_events extends StatefulWidget {
  String image;
  String cause;
  String part;
  int limit;
  String foundation;
  Donation_events({
    super.key,
    required this.image,
    required this.cause,
    required this.limit,
    required this.foundation,
    required this.part,
  });

  @override
  State<Donation_events> createState() => _Donation_eventsState();
}

class _Donation_eventsState extends State<Donation_events> {
  int _donatedAmount = 0;
  void _handleDonation(int amount) {
    setState(() {
      _donatedAmount += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    String image = widget.image;
    String cause = widget.cause;
    String foundation = widget.foundation;
    int limit = widget.limit;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                'Details',
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 130, 143),
                    fontWeight: FontWeight.bold),
              ),
              flexibleSpace: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 243, 243, 243)),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 170,
                        width: 400,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(image), fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        cause,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 20,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              Icons.verified,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    foundation,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.verified_user,
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                              Text(
                                'Verified foundation',
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.more_horiz)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 20,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Donation goals',
                            style: TextStyle(fontSize: 20),
                          ),
                          Spacer(),
                          Icon(Icons.more_horiz)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: 300,
                          height: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: (_donatedAmount / limit),
                              backgroundColor:
                                  Color.fromARGB(255, 206, 225, 227),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color.fromARGB(255, 0, 130, 143)),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Amount donated: ${_donatedAmount}/${limit}'),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 20,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return SafeArea(
                                  child: Container(
                                      width: 400,
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "How much you wanna donate?",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 20),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        _handleDonation(100);
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return Donate(
                                                                amountDonated:
                                                                    100,
                                                              );
                                                            });
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("100"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        _handleDonation(200);
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return Donate(
                                                                amountDonated:
                                                                    200,
                                                              );
                                                            });
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("200"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        _handleDonation(500);
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return Donate(
                                                                amountDonated:
                                                                    500,
                                                              );
                                                            });
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("500"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                );
                              })
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(
                              255, 0, 130, 143), // Background color
                          foregroundColor: Colors.white, // Text color
                          minimumSize: Size(400, 50), // Button size
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                        ),
                        child: Text(
                          'Donate Now',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}

class Donate extends StatefulWidget {
  int amountDonated;
  Donate({required this.amountDonated});
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  late ConfettiController _controller;
  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 3));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int amountDonated = widget.amountDonated;
    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      userProvider.currentUser?.donation++;
      if (userProvider.currentUser != null) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(userProvider.currentUser!.uid)
            .update({'donation': userProvider.currentUser!.donation});
      }
      return AlertDialog(
        title: Text("Donated!"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConfettiWidget(
              confettiController: _controller,
              blastDirection: -pi / 2,
              maxBlastForce: 5,
              minBlastForce: 1,
              emissionFrequency: 0.03,
              numberOfParticles: 10,
              shouldLoop: false,
              gravity: 0,
            ),
            Text(
                "Successfully donated ${amountDonated}, thanks for the contribution!"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("OK"),
          ),
        ],
      );
    });
  }
}
