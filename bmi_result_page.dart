import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_app/main_page.dart';
import 'package:ultimate_app/theme_provider.dart';

class BMIResultPage extends StatelessWidget {
  final double bmi;

  const BMIResultPage({super.key, 
    required this.bmi,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark;
    final backgroundColor =
        isDarkMode ? Colors.black : Colors.blue[900]; // Dark blue background
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
        backgroundColor: backgroundColor,
        actions: [DarkModeSwitch(isDarkMode)],
      ),
      body: Container(
        color: backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pink,
                ),
                child: Center(
                  child: Text(
                    bmi.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'BMI Category: ${getBMICategory(bmi)}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }
}
