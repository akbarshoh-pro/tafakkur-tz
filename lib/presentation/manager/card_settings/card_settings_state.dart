
import 'package:flutter/cupertino.dart';

class CardSettingsState {
  final TransformationController controller;
  final bool userChooseImage;
  final bool userChooseColor;
  final bool isLocked;
  final bool isSettings;
  final String selectedImagePath;
  final Color backgroundColor;
  final bool saveSuccess;

  CardSettingsState({
    required this.controller,
    required this.userChooseImage,
    required this.userChooseColor,
    required this.isLocked,
    required this.isSettings,
    required this.selectedImagePath,
    required this.backgroundColor,
    required this.saveSuccess
  });

  CardSettingsState copyWith({
    TransformationController? controller,
    bool? userChooseImage,
    bool? userChooseColor,
    bool? isLocked,
    bool? isSettings,
    String? selectedImagePath,
    Color? backgroundColor,
    bool? saveSuccess
  }) => CardSettingsState(
    controller: controller ?? this.controller,
    userChooseImage: userChooseImage ?? this.userChooseImage,
    userChooseColor: userChooseColor ?? this.userChooseColor,
    isLocked: isLocked ?? this.isLocked,
    isSettings: isSettings ?? this.isSettings,
    selectedImagePath: selectedImagePath ?? this.selectedImagePath,
    backgroundColor: backgroundColor ?? this.backgroundColor,
    saveSuccess: saveSuccess ?? this.saveSuccess
  );

}

