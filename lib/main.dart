import 'package:flutter/material.dart';
import 'screens/map_screen.dart';
import 'screens/mission_list_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/confirmation_screen.dart';
import 'screens/drone_data_screen.dart';

void main() {
  runApp(const MediReachApp());
}

class MediReachApp extends StatelessWidget {
  const MediReachApp({super.key});

  // Supabase configuration constants
  static const String supabaseUrl = 'https://aotdgvmnyzqsmfonzvrm.supabase.co';
  static const String supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFvdGRndm1ueXpxc21mb256dnJtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NTMwOTEsImV4cCI6MjA3MzUyOTA5MX0._EEpKLoV3zjQOX8Q5vINLHsDZ2Pl4o6PnScm5Syps6g';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediReach',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/map',  // Default route when app starts
      routes: {
        '/map': (context) => const MapScreen(),
        '/missions': (context) => const MissionListScreen(),
        '/chat': (context) => const ChatScreen(),
        '/confirmation': (context) => const ConfirmationScreen(),
      },
    );
  }
}
