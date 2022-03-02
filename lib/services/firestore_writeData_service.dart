import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreReadData {
  static final firestore = FirebaseFirestore.instance;
  static writeData({required String collection}) async {
    try {
      await firestore.collection(collection).doc().get().then((value) {});
      
    } catch (e) {}
  }
}
