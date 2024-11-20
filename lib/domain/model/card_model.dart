import 'package:flutter/cupertino.dart';

class CardModel {
  final TransformationController controller;
  final bool userChooseImage;
  final bool userChooseColor;
  final bool isLocked;
  final bool isSettings;
  final String selectedImagePath;
  final Color backgroundColor;

  CardModel({
    required this.controller,
    required this.userChooseColor,
    required this.userChooseImage,
    required this.isLocked,
    required this.isSettings,
    required this.selectedImagePath,
    required this.backgroundColor
  });

}