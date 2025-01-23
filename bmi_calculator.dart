class BMICalculator {
  double calculateBMI(double heightInCm, double weightInKg) {
    double heightInM = heightInCm / 100.0;
    return weightInKg / (heightInM * heightInM);
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal weight';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }
}
