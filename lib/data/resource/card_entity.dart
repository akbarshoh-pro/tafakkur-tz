import 'package:hive/hive.dart';

part 'card_entity.g.dart';

@HiveType(typeId: 0)
class CardEntity {
  @HiveField(0)
  final bool userChooseColor;
  @HiveField(1)
  final bool userChooseGradient;
  @HiveField(2)
  final bool userChooseImage;
  @HiveField(3)
  final bool isLocked;
  @HiveField(4)
  final bool isSettings;
  @HiveField(5)
  final String selectedImagePath;
  @HiveField(6)
  final int backgroundColor;
  @HiveField(7)
  final int startColor;
  @HiveField(8)
  final int endColor;
  @HiveField(9)
  final List<double> matrix;

  CardEntity({
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
