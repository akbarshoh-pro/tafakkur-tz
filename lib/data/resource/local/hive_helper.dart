import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../../domain/model/card_model.dart';
import '../card_entity.dart';
import '../matrix_4.g.dart';

abstract class HiveHelper {
  static late Box cardBox;

  static Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    Hive.registerAdapter(CardEntityAdapter());
    Hive.registerAdapter(Matrix4Adapter());

    cardBox = await Hive.openBoxc("card_box");

    if(cardBox.isEmpty) {
      final cardsList = [
        CardEntity(
            matrix4: Matrix4.identity(),
            userChooseColor: false,
            userChooseImage: true,
            isLocked: true,
            isSettings: false,
            selectedImagePath: 'assets/images/image1.png',
            backgroundColor: 0xFF000000
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
          matrix4: cardModel.controller.value,
          userChooseColor: cardModel.userChooseColor,
          userChooseImage: cardModel.userChooseImage,
          isLocked: cardModel.isLocked,
          isSettings: cardModel.isSettings,
          selectedImagePath: cardModel.selectedImagePath,
          backgroundColor: cardModel.backgroundColor.value
      )
    ];

    cardBox.put("cardsList", newList);
  }

}