import 'package:card_settings/domain/model/card_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/app_repository_impl.dart';
import '../../../domain/repository/app_repository.dart';
import 'card_settings_event.dart';
import 'card_settings_state.dart';

class CardSettingsBloc extends Bloc<CardSettingsEvent, CardSettingsState> {
  CardSettingsBloc() : super(CardSettingsState(
      controller: TransformationController(),
      userChooseImage: true,
      userChooseColor: false,
      isLocked: false,
      isSettings: true,
      selectedImagePath: "assets/images/image1.png",
      backgroundColor: const Color(0xff000000),
      saveSuccess: false
  )) {
    final AppRepository repo = AppRepositoryImpl();

    on<GetImageFromLocal>((event, emit) {
      final controller = state.controller;
      controller.value = event.controllerValue;
      emit(state.copyWith(
          controller: controller,
          selectedImagePath: event.selectedImagePath,
          userChooseColor: false,
          userChooseImage: true,
          isLocked: event.isLocked
      ));
    });
    on<ChooseColorFromPick>((event, emit) {
      emit(state.copyWith(
          backgroundColor: event.backgroundColor,
          userChooseColor: true,
          userChooseImage: false
      ));
    });

    on<SetValues>((event, emit) {
      emit(state.copyWith(
          controller: event.cardModel.controller,
          userChooseImage: event.cardModel.userChooseImage,
          userChooseColor: event.cardModel.userChooseColor,
        isLocked: event.cardModel.isLocked,
        isSettings: event.cardModel.isSettings,
        selectedImagePath: event.cardModel.selectedImagePath,
        backgroundColor: event.cardModel.backgroundColor
      ));
    });

    on<SaveAllUpdates>((event, emit) async {
      print(state.controller.value);
      await repo.updateCardsList(
        CardModel(
            controller: state.controller,
            userChooseColor: state.userChooseColor,
            userChooseImage: state.userChooseImage,
            isLocked: state.isLocked,
            isSettings: state.isSettings,
            selectedImagePath: state.selectedImagePath,
            backgroundColor: state.backgroundColor
        )
      );

      emit(state.copyWith(saveSuccess: true));
    });
  }
}
