import 'package:flutter/material.dart';
import 'instructors.dart';
import 'infrastructure.dart';
import 'about.dart';
import 'courses.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final _pages = [
    const AboutPage(),
    const InstructorsPage(),
    const InfrastructurePage(),
    const CoursesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bölüm Mobil Uygulaması'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          )
        ],
      ),
      body: _pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.info), label: 'Hakkında'),
          NavigationDestination(icon: Icon(Icons.people), label: 'Kişiler'),
          NavigationDestination(icon: Icon(Icons.class_), label: 'Altyapı'),
          NavigationDestination(icon: Icon(Icons.menu_book), label: 'Dersler'),
        ],
      ),
    );
  }
}
