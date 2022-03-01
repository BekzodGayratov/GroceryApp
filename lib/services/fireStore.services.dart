import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class FireStoreService {
  static DocumentSnapshot<Map<String, dynamic>>? data;
  static final firestore = FirebaseFirestore.instance;
  static readValue({required String collection}) async {
    try {
      await readData();
      await firestore.collection(collection).doc().get().then((value) {});
      return true;
    } catch (e) {
      debugPrint(Exception().toString());
    }
  }

  static readData() async {
    CollectionReference<Map<String, dynamic>> collection =
        firestore.collection("grocery");
    await collection.doc("categories").get().then((value) {
      return data = value;
    });
  }
}
