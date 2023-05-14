import 'package:flutter/material.dart';

class categories extends StatelessWidget {
  const categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'categories',
          style: TextStyle(
            fontSize: 25.0
          ),
        ),
      ),
    );
  }
}
