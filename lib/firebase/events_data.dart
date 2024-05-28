import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getEvents() async {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final CollectionReference event = db.collection('Event');

  QuerySnapshot querySnapshot = await event.get();
  final List<Map<String, dynamic>> events = querySnapshot.docs
      .map((doc) => doc.data() as Map<String, dynamic>)
      .toList();
  print(events);
  return events;
}
