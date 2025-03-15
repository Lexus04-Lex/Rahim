// ignore_for_file: deprecated_member_use

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rahim/classes/body.dart';
import 'package:rahim/firebase_options.dart';
import 'package:rahim/screens/cart.dart';
import 'package:rahim/screens/favorite.dart';
import 'package:rahim/screens/search.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late List<Widget> _pages;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeScreen(), // ✅ Replaced HomeWidget() to prevent recursion
      const Favorite(),
      const Cart(),
      const Search(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IA STORES'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: [
          Icon(Icons.person),
          
        ],
      ),
      body: _pages[_currentPageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.orange,
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.decelerate,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        items: const [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.menu),
            Text('Home')
          ]),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.favorite),
            Text('Favorites')
          ]),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.card_travel),
            Text('Cart')
          ]),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.search_rounded),
            Text('Search')
          ])
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 237, 167, 63),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () => {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.category),
                    title: const Text('Categories'),
                    onTap: () => {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.history),
                    title: const Text('History'),
                    onTap: () => {},
                  ),
                  const Divider(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.only(bottom: 20),
              child: ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Logout'),
                onTap: () => FirebaseAuth.instance.signOut(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

