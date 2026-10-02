import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MediReach'),
        backgroundColor: const Color(0xFF0D1B2A), // navy color
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // open the sidebar
            },
          ),
        ),
      ),
      drawer: Drawer(
        width: 250,
        backgroundColor: const Color(0xFF0D1B2A),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "MediReach",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(color: Colors.white24),

            _buildDroneItem("Alpha Eagle", "Idle", Colors.green),
            _buildDroneItem("Bravo Hawk", "In-Transit", Colors.blue),
            _buildDroneItem("Charlie Falcon", "Delivering", Colors.orange),
            _buildDroneItem("Delta Osprey", "Maintenance", Colors.red),

            const SizedBox(height: 16),
            const Divider(color: Colors.white24),

            // Route Planner
            ExpansionTile(
              collapsedIconColor: Colors.white,
              iconColor: Colors.white,
              title: const Text("Route Planner",
                  style: TextStyle(color: Colors.white)),
              children: const [
                ListTile(
                  leading: Icon(Icons.alt_route, color: Colors.white70),
                  title:
                  Text("Plan New Route", style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: Icon(Icons.history, color: Colors.white70),
                  title: Text("Route History",
                      style: TextStyle(color: Colors.white70)),
                ),
              ],
            ),

            // Pending Deliveries
            ExpansionTile(
              collapsedIconColor: Colors.white,
              iconColor: Colors.white,
              title: const Text("Pending Deliveries",
                  style: TextStyle(color: Colors.white)),
              children: const [
                ListTile(
                  leading: Icon(Icons.medical_services, color: Colors.white70),
                  title: Text("Medical Kit - Zone A",
                      style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: Icon(Icons.devices_other, color: Colors.white70),
                  title: Text("Comm Device - Zone B",
                      style: TextStyle(color: Colors.white70)),
                ),
              ],
            ),

            const Spacer(),

            // Dispatcher info
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Dispatcher\nSan Francisco HQ",
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          "Welcome to MediReach Dashboard",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  // Drone helper
  Widget _buildDroneItem(String name, String status, Color color) {
    return ListTile(
      leading: Icon(Icons.flight, color: color),
      title: Text(name, style: const TextStyle(color: Colors.white)),
      subtitle: Text(status, style: const TextStyle(color: Colors.white70)),
    );
  }
}