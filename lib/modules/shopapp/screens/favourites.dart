import 'package:flutter/material.dart';

class favourites extends StatelessWidget {
  const favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'favourites',
          style: TextStyle(
            fontSize: 25.0
          ),
        ),
      ),
    );
  }
}
