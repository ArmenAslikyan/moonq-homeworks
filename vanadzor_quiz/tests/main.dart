// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vanadzor_quiz/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final db = FirebaseFirestore.instance;

  const testUsers = <Map<String, Object>>[
    {'name': 'Levon', 'surname': 'Mkrtchyan', 'score': 9},
    {'name': 'Aram', 'surname': 'Hakobyan', 'score': 9},
    {'name': 'Vrej', 'surname': 'Grigoryan', 'score': 9},
    {'name': 'Ruben', 'surname': 'Petrosyan', 'score': 9},
    {'name': 'Edgar', 'surname': 'Avetisyan', 'score': 9},
    {'name': 'Samvel', 'surname': 'Danielyan', 'score': 9},
    {'name': 'Ashot', 'surname': 'Sahakyan', 'score': 8},
    {'name': 'Gorik', 'surname': 'Poghosyan', 'score': 8},
    {'name': 'Artur', 'surname': 'Hovhannisyan', 'score': 8},
    {'name': 'Arsenik', 'surname': 'Ghazaryan', 'score': 8},
    {'name': 'Mher', 'surname': 'Simonyan', 'score': 8},
    {'name': 'Tatul', 'surname': 'Sargsyan', 'score': 8},
    {'name': 'Hovik', 'surname': 'Martirosyan', 'score': 7},
    {'name': 'Karenik', 'surname': 'Harutyunyan', 'score': 7},
    {'name': 'Boris', 'surname': 'Vardanyan', 'score': 7},
    {'name': 'Sargis', 'surname': 'Melikyan', 'score': 7},
    {'name': 'Tigranik', 'surname': 'Baghdasaryan', 'score': 7},
    {'name': 'Gagik', 'surname': 'Grigoryan', 'score': 7},
    {'name': 'Narekik', 'surname': 'Khachatryan', 'score': 6},
    {'name': 'Vardan', 'surname': 'Hakobyan', 'score': 6},
    {'name': 'Armen', 'surname': 'Melkonyan', 'score': 6},
    {'name': 'Gegham', 'surname': 'Gevorgyan', 'score': 6},
    {'name': 'Raffi', 'surname': 'Stepanyan', 'score': 6},
    {'name': 'Taron', 'surname': 'Manukyan', 'score': 6},
    {'name': 'Lusine', 'surname': 'Mkrtchyan', 'score': 5},
    {'name': 'Hasmik', 'surname': 'Poghosyan', 'score': 5},
    {'name': 'Nune', 'surname': 'Avetisyan', 'score': 5},
    {'name': 'Sona', 'surname': 'Danielyan', 'score': 5},
    {'name': 'Marine', 'surname': 'Ghazaryan', 'score': 5},
    {'name': 'Anahit', 'surname': 'Simonyan', 'score': 5},
    {'name': 'Meline', 'surname': 'Baghdasaryan', 'score': 4},
    {'name': 'Shushan', 'surname': 'Hovhannisyan', 'score': 4},
    {'name': 'Liana', 'surname': 'Sahakyan', 'score': 4},
    {'name': 'Mariamik', 'surname': 'Vardanyan', 'score': 4},
    {'name': 'Ruzan', 'surname': 'Harutyunyan', 'score': 4},
    {'name': 'Karine', 'surname': 'Khachatryan', 'score': 3},
    {'name': 'Susanna', 'surname': 'Martirosyan', 'score': 3},
    {'name': 'Nare', 'surname': 'Petrosyan', 'score': 3},
    {'name': 'Alla', 'surname': 'Gevorgyan', 'score': 3},
    {'name': 'Roza', 'surname': 'Sargsyan', 'score': 3},
    {'name': 'Margarit', 'surname': 'Manukyan', 'score': 2},
    {'name': 'Eliza', 'surname': 'Melkonyan', 'score': 2},
    {'name': 'Lusya', 'surname': 'Hakobyan', 'score': 2},
    {'name': 'Satenik', 'surname': 'Stepanyan', 'score': 2},
    {'name': 'Arpine', 'surname': 'Ghazaryan', 'score': 2},
    {'name': 'Eva', 'surname': 'Mkrtchyan', 'score': 1},
    {'name': 'Maneik', 'surname': 'Poghosyan', 'score': 1},
    {'name': 'Lilitik', 'surname': 'Avetisyan', 'score': 1},
    {'name': 'Tamar', 'surname': 'Danielyan', 'score': 1},
    {'name': 'Arevik', 'surname': 'Simonyan', 'score': 1},
  ];

  try {
    for (final user in testUsers) {
      final documentId = 'test_${user['name']}_${user['surname']}';
      await db.collection('users').doc(documentId).set({
        ...user,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('Seeded $documentId');
    }
    print('Successfully seeded ${testUsers.length} users.');
  } catch (error) {
    stderr.writeln('Seeding stopped: $error');
    exitCode = 1;
  }

  await db.terminate();
}
