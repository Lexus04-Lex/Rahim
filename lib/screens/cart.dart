import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("WElcome To The Cart Page", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
    );
  }
}