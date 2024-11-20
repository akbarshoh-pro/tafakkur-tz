
import 'package:card_settings/domain/model/card_model.dart';
import 'package:flutter/cupertino.dart';

abstract class CardSettingsEvent {}

class GetImageFromLocal extends CardSettingsEvent {
  String selectedImagePath;
  Matrix4 controllerValue;
  bool isLocked;

  GetImageFromLocal({
    required this.selectedImagePath,
    required this.controllerValue,
    required this.isLocked
  });
}

class ChooseColorFromPick extends CardSettingsEvent {
  final Color backgroundColor;

  ChooseColorFromPick({
    required this.backgroundColor
  });
}

class SetValues extends CardSettingsEvent {
  final CardModel cardModel;

  SetValues({required this.cardModel});
}

class SaveAllUpdates extends CardSettingsEvent {}
