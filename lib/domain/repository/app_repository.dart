
import '../model/card_model.dart';

abstract class AppRepository {
  List<CardModel> getCardsList();
  Future<void> updateCardsList(CardModel cardModel);
}