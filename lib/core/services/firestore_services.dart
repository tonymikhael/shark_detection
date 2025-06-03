import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveToken({required String token}) async {
    final String collectionName = 'user_tokens';

    try {
      await _firestore.collection(collectionName).doc(token).set({
        'token': token,
        'createdAt': FieldValue.serverTimestamp(),
      });
      log('Token saved to Firestore: $token');
    } catch (e) {
      log('Failed to save token to Firestore: $e');
    }
  }

  Future<void> setDetectionFlag() async {
    final String collectionName = 'detection_flag';
    final String docId = '2G1bvkON43ShRInpwUsq';

    try {
      await _firestore.collection(collectionName).doc(docId).update({
        'detection_flag': true,
      });
      log('detection flag set');
    } catch (e) {
      log('failed to set detection flag');
    }
  }

  Future<void> reSetDetectionFlag() async {
    final String collectionName = 'detection_flag';
    final String docId = '2G1bvkON43ShRInpwUsq';

    try {
      await _firestore.collection(collectionName).doc(docId).update({
        'detection_flag': false,
      });
      log('detection flag set');
    } catch (e) {
      log('failed to set detection flag');
    }
  }
}
