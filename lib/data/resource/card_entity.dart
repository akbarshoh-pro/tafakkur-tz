
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'card_entity.g.dart';

@HiveType(typeId: 1)
class CardEntity {
  @HiveField(1)
  final Matrix4 matrix4;
  @HiveField(2)
  final bool userChooseImage;
  @HiveField(3)
  final bool userChooseColor;
  @HiveField(4)
  final bool isLocked;
  @HiveField(5)
  final bool isSettings;
  @HiveField(6)
  final String selectedImagePath;
  @HiveField(7)
  final int backgroundColor;

  CardEntity({
    required this.matrix4,
    required this.userChooseColor,
    required this.userChooseImage,
    required this.isLocked,
    required this.isSettings,
    required this.selectedImagePath,
    required this.backgroundColor
  });

}