import 'package:card_settings/data/resource/local/hive_helper.dart';
import 'package:card_settings/domain/model/card_model.dart';
import 'package:card_settings/domain/repository/app_repository.dart';
import 'package:flutter/cupertino.dart';

class AppRepositoryImpl extends AppRepository {

  @override
  List<CardModel> getCardsList() =>
      HiveHelper.getCardsList().map((entity){
        final controller = TransformationController();
        controller.value = entity.matrix4;
        return CardModel(
            controller: controller,
            userChooseColor: entity.userChooseColor,
            userChooseImage: entity.userChooseImage,
            isLocked: entity.isLocked,
            isSettings: entity.isSettings,
            selectedImagePath: entity.selectedImagePath,
            backgroundColor: Color(entity.backgroundColor)
        );
      }).toList();

  @override
  Future<void> updateCardsList(CardModel cardModel) =>
      HiveHelper.updateCardsList(cardModel);

}