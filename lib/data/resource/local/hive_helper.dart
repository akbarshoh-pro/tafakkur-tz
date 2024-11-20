import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../../domain/model/card_model.dart';
import '../card_entity.dart';

abstract class HiveHelper {
  static late Box cardBox;

  static Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    Hive.registerAdapter(CardEntityAdapter());

    cardBox = await Hive.openBox("card_box");

    if (cardBox.isEmpty) {
      final cardsList = [
        CardEntity(
          userChooseColor: false,
          userChooseGradient: false,
          userChooseImage: true,
          isLocked: true,
          isSettings: false,
          selectedImagePath: 'assets/images/image1.png',
          backgroundColor: 0xFF000000,
          startColor: 0xFF000000,
          endColor: 0xFF000000,
          matrix: Matrix4.identity().storage.toList(),
        )
      ];
      cardBox.put("cardsList", cardsList);
    }

  }


  static List<CardEntity> getCardsList() {
    final List<dynamic> rawList = cardBox.get("cardsList");

    return rawList.cast<CardEntity>();
  }
  static Future<void> updateCardsList(CardModel cardModel) async {
    final newList = [
      CardEntity(
        userChooseColor: cardModel.userChooseColor,
        userChooseGradient: cardModel.userChooseGradient,
        userChooseImage: cardModel.userChooseImage,
        isLocked: cardModel.isLocked,
        isSettings: cardModel.isSettings,
        selectedImagePath: cardModel.selectedImagePath,
        backgroundColor: cardModel.backgroundColor.value,
        startColor: cardModel.startColor.value,
        endColor: cardModel.endColor.value,
        matrix: cardModel.matrix,
      )
    ];

    cardBox.put("cardsList", newList);
  }
}