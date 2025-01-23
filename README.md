# BMI Calculator App

A simple and user-friendly BMI (Body Mass Index) Calculator app built using Dart. This app allows users to calculate their BMI based on their gender, height, and weight. It also includes a theme-changing option for a personalized user experience.

---

## Features
- **Gender Selection:** Choose your gender (Male or Female) for accurate BMI interpretation.
- **Height Input:** Enter your height in centimeters (cm).
- **Weight Input:** Enter your weight in kilograms (kg).
- **Theme Changing Option:** Switch between light and dark themes.
- **Responsive UI:** Designed for an intuitive user experience.

---



## How It Works
1. Select your gender (Male/Female).
2. Input your height in centimeters.
3. Input your weight in kilograms.
4. Click the **Calculate** button to view your BMI and its interpretation.
5. Use the theme toggle to switch between light and dark modes.

---

## Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/your-repo/bmi-calculator-app.git
   ```
2.Navigate into the project directory:
  ```bash
  cd bmi-calculator-app
  ```
3.Install the necessary dependencies:
  ```bash
  flutter pub get
  ```
4.Run the app on an emulator or a connected device:
  ```bash
  flutter run
  ```

## BMI Calculation and Categories

![BMI Chart](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi1eu_Y6iUho7v2jHygpq72XqYHijZ3vdcuqLljWpkeJZiIfw-UoBNY76Le0dzF5kjwO4tebPcbsMKQYmUiSANvp_ZccZRCpQTKFWQAeErAS8hqWrqvw-Q0vfuQxLwn5PFq1UUj_LeQMlzlIS_3SVGC2ATEjPcrFYIxJJvzNPY0TVvL4fxSl_hLpjWlTFOj/s616/how%20to%20%20c%20alculate%20BMI%20online.bmp)

Once the BMI is calculated, it is categorized into the following ranges:

### BMI Categories
- **Underweight:** BMI < 18.5
- **Normal weight:** BMI 18.5 – 24.9
- **Overweight:** BMI 25 – 29.9
- **Obesity:** BMI ≥ 30

### BMI Category Function
The app uses the following `getBMICategory` function to determine the BMI category based on the calculated value:

```dart
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
```
---------------------------------------------------------------------------
**Developed by-Dheer N Raijada**


