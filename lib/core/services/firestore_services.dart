import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'user_tokens';

  Future<void> saveToken({required String token}) async {
    try {
      await _firestore.collection(_collectionName).doc(token).set({
        'token': token,
        'createdAt': FieldValue.serverTimestamp(),
      });
      log('Token saved to Firestore: $token');
    } catch (e) {
      log('Failed to save token to Firestore: $e');
    }
  }
}
