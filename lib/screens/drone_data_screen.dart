import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DroneDataScreen extends StatefulWidget {
  @override
  _DroneDataScreenState createState() => _DroneDataScreenState();
}

class _DroneDataScreenState extends State<DroneDataScreen> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> droneData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDroneData();
  }

  Future<void> fetchDroneData() async {
    final response = await supabase
        .from('drone_data')
        .select()
        .order('timestamp', ascending: false)
        .limit(20)
        .maybeSingle();

    if (response.error == null) {
      setState(() {
        droneData = List<Map<String, dynamic>>.from(response.data);
        isLoading = false;
      });
    } else {
      print('Error fetching data: ${response.error!.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drone Data')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: droneData.length,
        itemBuilder: (context, index) {
          final data = droneData[index];
          return ListTile(
            title: Text(
                'Lat: ${data['latitude']}, Lng: ${data['longitude']}'),
            subtitle: Text(
                'Battery: ${data['battery']}%, Time: ${data['timestamp']}'),
          );
        },
      ),
    );
  }
}