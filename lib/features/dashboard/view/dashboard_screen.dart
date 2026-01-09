import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the Dashboard!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement file picking logic.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
