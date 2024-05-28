import 'package:cs_app/firebase/events_data.dart';
import 'package:cs_app/screens/events.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

void openKommunicateChat() {
  dynamic conversationObject = {
    'appId':
        '30328cb3e257c5bfcca0db95a3ded49f7', // Replace 'YOUR_APP_ID_HERE' with your actual App ID
  };

  KommunicateFlutterPlugin.buildConversation(conversationObject)
      .then((clientConversationId) {
    print('hi');
    print("Conversation builder success : " + clientConversationId.toString());
  }).catchError((error) {
    print("Conversation builder error : " + error.toString());
  });
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String location = 'Gurgaon, Haryana';
  String preference = 'Your preference';
  String searchQuery = '';
  List<Map<String, dynamic>> filteredEvents = [];

  void setLoc(String loc) {
    setState(() {
      location = loc;
    });
  }

  void setPre(String pre) {
    setState(() {
      preference = pre;
    });
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      filterEvents();
    });
  }

  void filterEvents() {
    getEvents().then((events) {
      setState(() {
        if (searchQuery.isEmpty) {
          filteredEvents = events;
        } else {
          filteredEvents = events
              .where((event) =>
                  event['city_name']
                      .toString()
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase()) ||
                  event['opp_avail']
                      .toString()
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase()))
              .toList();
        }
      });
    });
  }

  List<bool> _selections = [true, false];
  final Future<List<Map<String, dynamic>>> events = getEvents();

  @override
  void initState() {
    super.initState();
    filterEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        title: Column(
          children: [
            ToggleButtons(
              children: <Widget>[
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Events'),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Organisation'),
                  ),
                ),
              ],
              isSelected: _selections,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < _selections.length; i++) {
                    _selections[i] = i == index;
                  }
                });
              },
              borderRadius: BorderRadius.circular(10),
              borderWidth: 2,
              selectedBorderColor: Color.fromARGB(255, 0, 130, 143),
              selectedColor: Colors.white,
              fillColor: Color.fromARGB(255, 0, 130, 143),
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: TextField(
                onChanged: updateSearchQuery,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Find Volunteer Locations',
                  labelStyle: TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 243, 243, 243),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore Near You',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 70,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 243, 243),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Searching near',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            location,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                child: Location(),
                              );
                            },
                          ).then((newLocation) {
                            if (newLocation != null) {
                              setLoc(newLocation);
                            }
                          });
                        },
                        child: Text(
                          'Update',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 130, 143)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder<List<Map<String, dynamic>>>(
                  future: events,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No events found.'));
                    } else {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var event in filteredEvents)
                              Row(
                                children: [
                                  cards(
                                    event['image'] ?? '',
                                    event['city_name'] ?? '',
                                    event['opp_avail'] ?? '',
                                    context,
                                    event,
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),
                          ],
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Volunteer with your favorite causes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 70,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 243, 243),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Based on',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            preference,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                child: Preference(),
                              );
                            },
                          ).then((newPreference) {
                            if (newPreference != null) {
                              setPre(newPreference);
                            }
                          });
                        },
                        child: Text(
                          'Change',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 130, 143)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      vol(
                          'https://www.brushwithbamboo.com/wp-content/uploads/2021/11/care-for-the-environment.jpg',
                          'Environment',
                          Colors.amberAccent,
                          'Help protect and restore our planet through environmental volunteer opportunities.'),
                      SizedBox(
                        width: 20,
                      ),
                      vol(
                          'https://switzerland-tour.com/storage/media/Culture/Emmental-Culture-7.jpg',
                          'Arts & Culture',
                          Colors.purpleAccent,
                          'Support and preserve arts and culture by volunteering in creative initiatives.'),
                      SizedBox(
                        width: 20,
                      ),
                      vol(
                          'https://news.microsoft.com/wp-content/uploads/prod/sites/66/2018/03/DIGITAL-TRANSFORMATION.jpg',
                          'Technology',
                          Colors.greenAccent,
                          'Empower communities with tech skills and innovations by volunteering in technology projects'),
                      SizedBox(
                        width: 20,
                      ),
                      vol(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpZGAKyhABiKBONCO__N1yJZlD2NWEUdMn1qNez1lqVA&s',
                          'Hunger',
                          Colors.pinkAccent,
                          'Join the fight against hunger by volunteering to provide meals and support to those in need.'),
                      SizedBox(
                        width: 20,
                      ),
                      vol(
                          'https://imageio.forbes.com/specials-images/imageserve/63c6a9c2f763b228da987497/Happy-employees-with-visible-and-invisible-disabilities-in-office/960x0.jpg',
                          'Disables',
                          Colors.blueAccent,
                          'Make a difference by volunteering to assist and empower individuals with disabilities.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openKommunicateChat();
        },
        child: Icon(
          Icons.chat_bubble,
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 0, 130, 143),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}

Widget cards(String image, String loc, String opp, BuildContext context,
    Map<String, dynamic> event) {
  Widget card = GestureDetector(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Events_det(
          loc: loc,
          opp: opp,
          events: event,
        ),
      ),
    ),
    child: Container(
      padding: EdgeInsets.all(8),
      height: 120,
      width: 220,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 243, 243, 243),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                event['city_name'],
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                event['opp_avail'],
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    ),
  );
  return card;
}

Widget vol(String image, String text, Color color, String desc) {
  Widget vol_list = Column(
    children: [
      FlipCard(
        fill: Fill.fillBack,
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        front: Container(
          height: 120,
          width: 110,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        back: Container(
            height: 120,
            width: 110,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  desc,
                  style: TextStyle(color: Colors.white),
                ))),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      )
    ],
  );
  return vol_list;
}

class Location extends StatefulWidget {
  Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 200,
        child: Column(
          children: [
            Text('Enter new location'),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _textController,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                    context,
                    _textController
                        .text); // Pass back the location to the previous screen
              },
              child: Text('Ok'),
            ),
          ],
        ),
      ),
    );
  }
}

class Preference extends StatefulWidget {
  Preference({super.key});

  @override
  State<Preference> createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 200,
        child: Column(
          children: [
            Text('Enter new preference'),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _textController,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _textController.text);
              },
              child: Text('Ok'),
            ),
          ],
        ),
      ),
    );
  }
}
