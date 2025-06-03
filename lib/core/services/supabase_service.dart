import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient supabase = Supabase.instance.client;

  // Return the stream of data (no async/await here)
  Stream<List<Map<String, dynamic>>> getAllImagesRealtime() {
    try {
      return supabase
          .from('shark_images')
          .stream(primaryKey: ['id']).map((list) => list.reversed.toList());
    } catch (e) {
      log('Error fetching images: $e');
      return Stream.value([]);
    }
  }

  Future<void> seenImage({required int id}) async {
    try {
      await supabase.from('shark_images').update({'seen': 'TRUE'}).eq('id', id);
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
