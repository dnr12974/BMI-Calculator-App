import 'package:flutter/material.dart';

class GenderSelectionPage extends StatelessWidget {
  final ValueChanged<String> onGenderSelected;

  const GenderSelectionPage({super.key, required this.onGenderSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Gender'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                onGenderSelected('Male');
              },
              child: const Text('Male'),
            ),
            ElevatedButton(
              onPressed: () {
                onGenderSelected('Female');
              },
              child: const Text('Female'),
            ),
          ],
        ),
      ),
    );
  }
}
