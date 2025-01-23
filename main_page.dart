import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_app/bmi_calculator.dart';
import 'package:ultimate_app/bmi_result_page.dart';
import 'package:ultimate_app/theme_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String selectedGender = '';
  String height = '';
  String weight = '';
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    isDarkMode =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BODY MASS INDEX App'),
        backgroundColor: isDarkMode ? Colors.black : Colors.lightGreen,
        actions: [DarkModeSwitch(isDarkMode)],
      ),
      body: Container(
        color:
            isDarkMode ? Colors.black : Colors.white, // Change background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RotationTransition(
                turns: const AlwaysStoppedAnimation(30 / 360),
                child: SvgPicture.asset('assets/bmi_logo.svg',
                    height: 120, width: 120),
              ),
              ElevatedButton(
                onPressed: () => selectGender('Male'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Male'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => selectGender('Female'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                child: const Text('Female'),
              ),
              const SizedBox(height: 16.0),
              if (selectedGender.isNotEmpty)
                Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        height = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Height (cm)',
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor:
                            isDarkMode ? Colors.grey[800] : Colors.grey[200]!,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      onChanged: (value) {
                        weight = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Weight (kg)',
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor:
                            isDarkMode ? Colors.grey[800] : Colors.grey[200]!,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () => calculateBMI(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Calculate BMI'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void calculateBMI() {
    double heightCm = double.tryParse(height) ?? 0;
    double weightKg = double.tryParse(weight) ?? 0;

    if (heightCm > 0 && weightKg > 0) {
      double bmi = BMICalculator().calculateBMI(heightCm, weightKg);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BMIResultPage(
            bmi: bmi,
          ),
        ),
      );
    }
  }
}

class DarkModeSwitch extends StatelessWidget {
  final bool isDarkMode;

  const DarkModeSwitch(this.isDarkMode, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isDarkMode ? Icons.brightness_7 : Icons.brightness_4),
      onPressed: () {
        ThemeProvider themeProvider =
            Provider.of<ThemeProvider>(context, listen: false);
        themeProvider
            .setThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
      },
    );
  }
}
