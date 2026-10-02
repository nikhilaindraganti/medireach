import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> fetchDroneData() async {
    try {
      final response = await supabase
          .from('drone_logs') // 👈 Replace with your actual table name
          .select();

      // response is already a List<dynamic>
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}