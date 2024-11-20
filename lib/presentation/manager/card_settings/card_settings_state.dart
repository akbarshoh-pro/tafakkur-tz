
import 'package:flutter/cupertino.dart';

class CardSettingsState {
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
  final bool saveSuccess;

  CardSettingsState({
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
    required this.saveSuccess
  });

  CardSettingsState copyWith({
    TransformationController? controller,
    bool? userChooseColor,
    bool? userChooseGradient,
    bool? userChooseImage,
    bool? isLocked,
    bool? isSettings,
    String? selectedImagePath,
    Color? backgroundColor,
    Color? startColor,
    Color? endColor,
    bool? saveSuccess
  }) => CardSettingsState(
    controller: controller ?? this.controller,
    userChooseColor: userChooseColor ?? this.userChooseColor,
    userChooseGradient: userChooseGradient ?? this.userChooseGradient,
    userChooseImage: userChooseImage ?? this.userChooseImage,
    isLocked: isLocked ?? this.isLocked,
    isSettings: isSettings ?? this.isSettings,
    selectedImagePath: selectedImagePath ?? this.selectedImagePath,
    backgroundColor: backgroundColor ?? this.backgroundColor,
    startColor: startColor ?? this.startColor,
    endColor: endColor ?? this.endColor,
    saveSuccess: saveSuccess ?? this.saveSuccess
  );

}

