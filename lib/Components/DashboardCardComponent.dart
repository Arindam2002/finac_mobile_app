import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onPressed;

  GradientCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 120.0,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF7B6CEB), Color(0xFFEF7896)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Colors.white70),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Colors.white, fontSize: 18),),
                Text(description, style: TextStyle(color: Colors.white70),)
              ],
            )
          ],
        ),
      ),
    );
  }
}