import 'package:flutter/material.dart';

class MissionListScreen extends StatelessWidget {
  const MissionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final missions = [
      "Deliver Medical Kit to Zone A",
      "Deliver Communication Device to Zone B",
      "Food Package Drop to Zone C"
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Missions")),
      body: ListView.builder(
        itemCount: missions.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.local_shipping),
            title: Text(missions[index]),
            onTap: () {
              Navigator.pushNamed(context, '/chat');
            },
          );
        },
      ),
    );
  }
}