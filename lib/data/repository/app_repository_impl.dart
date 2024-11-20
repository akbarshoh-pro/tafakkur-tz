import 'package:card_settings/data/resource/local/hive_helper.dart';
import 'package:card_settings/domain/model/card_model.dart';
import 'package:card_settings/domain/repository/app_repository.dart';
import 'package:flutter/cupertino.dart';

class AppRepositoryImpl extends AppRepository {

  @override
  List<CardModel> getCardsList() =>
      HiveHelper.getCardsList().map((entity) {
        final controller = TransformationController();

        if (entity.matrix.isNotEmpty) {
          controller.value = Matrix4.fromList(entity.matrix);
        }

        return CardModel(
            controller: controller,
            userChooseColor: entity.userChooseColor,
            userChooseGradient: entity.userChooseGradient,
            userChooseImage: entity.userChooseImage,
            isLocked: true,
            isSettings: false,
            selectedImagePath: entity.selectedImagePath,
            backgroundColor: Color(entity.backgroundColor),
            startColor: Color(entity.startColor),
            endColor: Color(entity.endColor),
            matrix: entity.matrix
        );
      }).toList();


  @override
  Future<void> updateCardsList(CardModel cardModel) =>
      HiveHelper.updateCardsList(cardModel);

}