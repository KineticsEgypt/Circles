import 'package:flutter/material.dart';
class CIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5
            )
          ],
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.black, Colors.grey]
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(
          icon: Icon(Icons.list),
          color: Colors.yellow,
          onPressed: () {},
        ),
      ),
    );
  }
}
