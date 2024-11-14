import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isnta_clone/body.dart';

void main() {
  runApp(const InstaCloneApp());
}

class InstaCloneApp extends StatelessWidget {
  const InstaCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Colors.white,
            secondary: Colors.black,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.black,
          ),
          useMaterial3: true),
      home: const InstaCloneHome(),
    );
  }
}

class InstaCloneHome extends StatefulWidget {
  const InstaCloneHome({super.key});

  @override
  State<InstaCloneHome> createState() => _InstaCloneHomeState();
}

class _InstaCloneHomeState extends State<InstaCloneHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: GoogleFonts.lobsterTwo(fontSize: 24),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_outline),
            onPressed: () {
              print('Tab!');
            },
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.paperplane),
            onPressed: () {},
          ),
        ],
      ),
      body: const InstaBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 28), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 28), label: 'Search'),
        ],
      ),
    );
  }
}
