import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/consultation_provider.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/consultation_tile.dart';
import 'add_consultation_screen.dart';
import 'profile_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final consultations =
        Provider.of<ConsultationProvider>(context).consultations;

    final screens = [
      Scaffold(
        appBar: AppBar(title: const Text('Consultation Booking')),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  "My Consultation Diary 📅",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
            Expanded(
              child:
                  consultations.isEmpty
                      ? const Center(child: Text("No consultations added yet."))
                      : ListView.builder(
                        itemCount: consultations.length,
                        itemBuilder: (ctx, i) => ConsultationTile(index: i),
                      ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddConsultationScreen()),
            );
          },
        ),
      ),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}
