import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/mood_entry.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addEntry(MoodEntry entry) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await _firestore
        .collection('db')
        .doc(user.uid)
        .collection('entries')
        .add(entry.toJson());
  }

  Future<List<MoodEntry>> getEntries() async {
    final user = _auth.currentUser;
    if (user == null) return [];

    final snapshot = await _firestore
        .collection('db')
        .doc(user.uid)
        .collection('entries')
        .get();

    return snapshot.docs.map((doc) => MoodEntry.fromJson(doc.data())).toList();
  }
}
