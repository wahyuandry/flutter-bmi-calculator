import 'dart:math';

import 'package:bmi/constants/constant.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi) {}

  double calculateBmi() {
    double heightInMeter = height! / 100;

    //final bmi = weight / (heightInMeter * heightInMeter);
    bmi = weight! / pow(heightInMeter, 2);
    return bmi!;
  }

  String determineBmiCategory() {
    String category = "";
    if (bmi! < 16.0) {
      category = underweightSevere;
    } else if (bmi! < 17) {
      category = underweightModerate;
    } else if (bmi! < 18.5) {
      category = underweightMild;
    } else if (bmi! < 25) {
      category = normal;
    } else if (bmi! < 30) {
      category = overweight;
    } else if (bmi! < 35) {
      category = obesI;
    } else if (bmi! < 40) {
      category = obesII;
    } else if (bmi! >= 40) {
      category = obesIII;
    }

    bmiCategory = category;
    return bmiCategory!;
  }

  String getHealtRiskDescription() {
    String desc = "";

    switch (bmiCategory!) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutritional deficiency and osteoporosis";
        break;
      case normal:
        desc = "Low risk (healthy range)";
        break;
      case overweight:
        desc =
            "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes melitus";
        break;
      case obesI:
      case obesII:
      case obesIII:
        desc =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes melitus";
        break;
      default:
    }

    bmiDescription = desc;

    return desc;
  }
}
