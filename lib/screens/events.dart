import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:cs_app/firebase/login_signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class Events_det extends StatefulWidget {
  final String? loc;
  final String? opp;
  final Map<String, dynamic>? events;

  const Events_det({super.key, this.loc, this.opp, this.events});

  @override
  State<Events_det> createState() => _Events_detState();
}

class _Events_detState extends State<Events_det> {
  @override
  Widget build(BuildContext context) {
    String loc = widget.loc ?? "";
    String opp = widget.opp ?? "";
    Map<String, dynamic> event = widget.events ?? {};
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          title: Column(
            children: [
              Text(
                event['event_name'],
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 130, 143),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(event['image_event']),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event['org_name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        event['org_type'],
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
              MaterialButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Join();
                  },
                ),
                color: Color.fromARGB(255, 0, 130, 143),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Join & sign up',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
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
              Navigator.pop(context); // Navigate back to the previous page
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Date and Time',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.calendar_month),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event['date'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        event['time'],
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Calendar(),
                          );
                        },
                      );
                    },
                    child: Text(
                      'Add to calendar',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 130, 143),
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "What you'll be doing",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(event['desc']),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Location',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event['mis_name'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        event['full_loc'],
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Private lot parking available',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Map_view(
                              event: event,
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      'View Map',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 130, 143),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SafeArea(
                child: Container(
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FlutterMap(
                      options: MapOptions(
                        center: LatLng(double.parse(event['lat']),
                            double.parse(event['long'])),
                        zoom: 10,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        MarkerLayer(markers: [
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: LatLng(double.parse(event['lat']),
                                double.parse(event['long'])),
                            child: Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 40.0,
                            ),
                          ),
                        ])
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}

class Join extends StatefulWidget {
  @override
  _JoinState createState() => _JoinState();
}

class _JoinState extends State<Join> {
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
    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      userProvider.currentUser?.projects++;
      if (userProvider.currentUser != null) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(userProvider.currentUser!.uid)
            .update({'projects': userProvider.currentUser!.projects});
      }
      return AlertDialog(
        title: Text("Registered!"),
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
            Text("Meet you at the event :)"),
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

class Calendar extends StatelessWidget {
  Calendar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: AlertDialog(
        title: Center(child: Text("Done!")),
        content: Text(
          "Successfully added to calendar",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}

class Map_view extends StatelessWidget {
  final Map<String, dynamic> event;
  Map_view({super.key, required this.event});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(double.parse(event['lat']),
                        double.parse(event['long'])),
                    zoom: 10,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(double.parse(event['lat']),
                            double.parse(event['long'])),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40.0,
                        ),
                      ),
                    ])
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
