import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({super.key});

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  final _latController = TextEditingController();
  final _lngController = TextEditingController();
  final _batteryController = TextEditingController();
  bool _loading = false;
  String? _message;

  Future<void> _saveData() async {
    final lat = double.tryParse(_latController.text.trim());
    final lng = double.tryParse(_lngController.text.trim());
    final battery = int.tryParse(_batteryController.text.trim());

    if (lat == null || lng == null || battery == null) {
      setState(() => _message = "⚠ Invalid input values!");
      return;
    }

    setState(() {
      _loading = true;
      _message = null;
    });

    try {
      final result = await Supabase.instance.client
          .from('drone_data')
          .insert({
        'latitude': lat,
        'longitude': lng,
        'battery': battery,
        'timestamp': DateTime.now().toIso8601String(), // 👈 important
      })
          .select()
          .single(); // only return one inserted row

      debugPrint("✅ Inserted row: $result");

      setState(() => _message = "✅ Data saved!\nLat: $lat, Lng: $lng, Battery: $battery");

      // clear input fields
      _latController.clear();
      _lngController.clear();
      _batteryController.clear();
    } catch (e) {
      debugPrint("❌ Insert error: $e");
      setState(() => _message = "❌ Insert error: $e");
    }

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Drone Data"),
        backgroundColor: const Color(0xFF0D1B2A), // navy blue
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _latController,
              decoration: const InputDecoration(labelText: "Latitude"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _lngController,
              decoration: const InputDecoration(labelText: "Longitude"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _batteryController,
              decoration: const InputDecoration(labelText: "Battery %"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading ? null : _saveData,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D1B2A),
                foregroundColor: Colors.white,
              ),
              child: _loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Go"), // 👈 button text
            ),
            if (_message != null) ...[
              const SizedBox(height: 20),
              Text(
                _message!,
                style: TextStyle(
                  color: _message!.contains("❌") ? Colors.red : Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}