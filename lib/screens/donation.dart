import 'package:cs_app/screens/donation_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Donation extends StatefulWidget {
  const Donation({super.key});

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> events = [
    {
      'image':
          'https://t4.ftcdn.net/jpg/06/49/46/13/360_F_649461336_VeKRYlh3Snjq7BCWXOmbh1IirtmWM1H3.jpg',
      'cause': 'Help the kids for better \neducation',
      'part': '12',
      'limit': 15000,
      'foundation': 'The winchesters'
    },
    {
      'image':
          'https://img.etimg.com/thumb/width-640,height-480,imgsize-273527,resizemode-75,msid-66025529/magazines/panache/dont-fear-donating-blood-it-burns-calories-reduces-heart-attack-risk/blood-donation_gettyimages.jpg',
      'cause': 'Help by donating \nmedicine',
      'part': '20',
      'limit': 25000,
      'foundation': 'Asha Foundation'
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwAtBkRMdeyFcTwSLsbz_Ay_fKYmNOhNokYmcnVINpkA&s',
      'cause': 'Donate your old clothes',
      'part': '15',
      'limit': 12000,
      'foundation': 'Ratan Tata Trust'
    }
  ];

  List<Map<String, dynamic>> _filteredEvents(String query) {
    return events
        .where((event) =>
            event['cause'].toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.offset + 350.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

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
                "Support a cause",
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
        body: SingleChildScrollView(
            controller: _scrollController,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (query) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Search',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        height: 120,
                        width: 400,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 130, 143),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Start new \nFundraising',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              GestureDetector(
                                onTap: _scrollDown,
                                child: Container(
                                  height: 60,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Text(
                                      'Start Now',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 243, 243, 243)),
                                child: Icon(
                                  Icons.shopping_bag,
                                  color: Colors.blue,
                                  size: 35,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Medical')
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 243, 243, 243)),
                                child: Icon(
                                  Icons.book,
                                  color: Colors.orange,
                                  size: 35,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Education')
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 243, 243, 243)),
                                child: Icon(
                                  Icons.dangerous,
                                  color: Colors.red,
                                  size: 35,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Disaster')
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 243, 243, 243)),
                                child: Icon(
                                  Icons.view_module,
                                  color: Colors.green,
                                  size: 35,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Others')
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          'Statistics',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.more_horiz)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _filteredEvents(_searchController.text).length,
                      itemBuilder: (context, index) {
                        final event =
                            _filteredEvents(_searchController.text)[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: [
                              donation_events(
                                  event['image'],
                                  event['cause'],
                                  event['part'],
                                  event['limit'],
                                  event['foundation'],
                                  context),
                              SizedBox(
                                height: 60,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            )));
  }
}

Widget donation_events(String image, String cause, String part, int limit,
    String foundation, BuildContext context) {
  Widget don_eve = Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 150,
        width: 400,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10)),
      ),
      Positioned(
          top: 100,
          left: 27,
          child: Container(
            height: 90,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 243, 243, 243)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cause,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            part,
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 130, 143)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('participants')
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Donation_events(
                                  image: image,
                                  cause: cause,
                                  part: part,
                                  limit: limit,
                                  foundation: foundation,
                                )),
                      );
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 130, 143),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))
    ],
  );
  return don_eve;
}
