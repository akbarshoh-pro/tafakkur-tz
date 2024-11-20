import 'package:card_settings/data/repository/app_repository_impl.dart';
import 'package:card_settings/domain/repository/app_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cards_list_event.dart';
import 'cards_list_state.dart';


class CardsListBloc extends Bloc<CardsListEvent, CardsListState> {
  CardsListBloc() : super(CardsListState(cardsList: [])) {
    final AppRepository repo = AppRepositoryImpl();

    on<GetAllCards>((event, emit) {
      emit(state.copyWith(cardsList: repo.getCardsList()));
    });
  }
}
