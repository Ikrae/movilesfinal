import 'package:flutter/material.dart';

class genrecard extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onTap;
  genrecard({required this.color, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onTap,
      child: Card(
        margin: EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 20),
        color: color,
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
          )),
        ),
      ),
    );
  }
}