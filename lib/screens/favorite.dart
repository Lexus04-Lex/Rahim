import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("WElcome To The Favorites Page", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
    );
  }
}