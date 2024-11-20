import 'package:flutter/cupertino.dart';

class CardModel {
  final TransformationController controller;
  final bool userChooseColor;
  final bool userChooseGradient;
  final bool userChooseImage;
  final bool isLocked;
  final bool isSettings;
  final String selectedImagePath;
  final Color backgroundColor;
  final Color startColor;
  final Color endColor;
  final List<double> matrix;

  CardModel({
    required this.controller,
    required this.userChooseColor,
    required this.userChooseGradient,
    required this.userChooseImage,
    required this.isLocked,
    required this.isSettings,
    required this.selectedImagePath,
    required this.backgroundColor,
    required this.startColor,
    required this.endColor,
    required this.matrix,
  });
}