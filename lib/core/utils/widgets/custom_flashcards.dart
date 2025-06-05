import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flip_card/flip_card.dart';

class CustomFlashcards extends StatelessWidget {
  final String front;
  final String back;

  const CustomFlashcards({super.key, required this.front, required this.back});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: _buildCard(front),
        back: _buildCard(back),
      ),
    );
  }

  Widget _buildCard(String text) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        elevation: 17,
        shadowColor: const Color.fromARGB(255, 2, 75, 6),
        color: Colors.green[700],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                letterSpacing: 1.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
