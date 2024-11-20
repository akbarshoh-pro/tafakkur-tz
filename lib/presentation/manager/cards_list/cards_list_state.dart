
import 'package:card_settings/domain/model/card_model.dart';

class CardsListState {
  final List<CardModel> cardsList;

  CardsListState({
    required this.cardsList
  });

  CardsListState copyWith({List<CardModel>? cardsList}) =>
      CardsListState(cardsList: cardsList ?? this.cardsList);
}

