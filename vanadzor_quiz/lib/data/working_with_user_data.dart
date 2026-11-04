import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveUserData(String name, String surname, int score) async{
  final db = FirebaseFirestore.instance;

  final userData = {
    'name': name,
    'surname': surname,
    'score': score,
    'timestamp': FieldValue.serverTimestamp(),
  };

  await db.collection('users').add(userData);
}

Future<List<Map<String, dynamic>>> loadUserData() async {
  final db = FirebaseFirestore.instance;
  final querySnapshot = await db.collection('users').get();

  List<Map<String, dynamic>> users = querySnapshot.docs.map((doc) {
    final data = doc.data();
    return {
      'id': doc.id,
      'name': data['name'],
      'surname': data['surname'],
      'score': data['score'],
    };
  }).toList();

  return users;
}