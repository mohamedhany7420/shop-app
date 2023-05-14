import 'package:flutter/material.dart';

class settings extends StatelessWidget {
  const settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'settings',
          style: TextStyle(
            fontSize: 25.0
          ),
        ),
      ),
    );
  }
}
