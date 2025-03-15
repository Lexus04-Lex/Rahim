import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("WElcome To The Favorites Page", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
    );
  }
}