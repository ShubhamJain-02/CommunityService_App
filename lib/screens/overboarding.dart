import 'package:cs_app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

class Overboard extends StatefulWidget {
  Overboard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _OverboardState createState() => _OverboardState();
}

class _OverboardState extends State<Overboard> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        allowScroll: true,
        pages: pages,
        showBullets: true,
        inactiveBulletColor: Colors.green,
        skipCallback: () {
          // Show a Snackbar when "Skip" is clicked
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Skip clicked"),
          ));
        },
        finishCallback: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
      ),
    );
  }

  final pages = [
    PageModel(
        color: Color.fromARGB(255, 243, 154, 21),
        imageAssetPath: 'assets/images/page1.png',
        title: 'Multiple Services',
        body:
            'We render quality and trusted services in order to ensure seamless donations.',
        doAnimateImage: true),
    PageModel(
        color: Color.fromARGB(255, 64, 214, 22),
        imageAssetPath: 'assets/images/page2.png',
        title: 'Book slots',
        body:
            'Find and book community service events at the ease of just a click.',
        doAnimateImage: true),
    PageModel(
        color: Color.fromARGB(255, 202, 236, 12),
        imageAssetPath: 'assets/images/page3.png',
        title: 'Community Forum',
        body:
            'Join our amazing community, be part of the conversation and look out for new opportunities.',
        doAnimateImage: true),
  ];
}
