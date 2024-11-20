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
      userChooseColor: false,
      userChooseGradient: false,
      userChooseImage: true,
      isLocked: false,
      isSettings: true,
      selectedImagePath: "assets/images/image1.png",
      backgroundColor: const Color(0xff000000),
      startColor: const Color(0xff000000),
      endColor: const Color(0xff000000),
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
          userChooseGradient: false,
          userChooseImage: true,
          isLocked: event.isLocked
      ));
    });

    on<ChooseColorFromPick>((event, emit) {
      emit(state.copyWith(
          backgroundColor: event.backgroundColor,
          userChooseColor: true,
          userChooseGradient: false,
          userChooseImage: false
      ));
    });

    on<ChooseGradientColors>((event, emit) {
      emit(state.copyWith(
          startColor: event.startColor,
          endColor: event.endColor,
          userChooseGradient: true,
          userChooseColor: true,
          userChooseImage: false
      ));
    });

    on<SetValues>((event, emit) {
      emit(state.copyWith(
          controller: event.cardModel.controller,
          userChooseColor: event.cardModel.userChooseColor,
          userChooseGradient: event.cardModel.userChooseGradient,
          userChooseImage: event.cardModel.userChooseImage,
          isLocked: event.cardModel.isLocked,
          isSettings: event.cardModel.isSettings,
          selectedImagePath: event.cardModel.selectedImagePath,
          backgroundColor: event.cardModel.backgroundColor,
          startColor: event.cardModel.startColor,
          endColor: event.cardModel.endColor
      ));
    });

    on<SaveAllUpdates>((event, emit) async {
      final currentMatrix = state.controller.value.storage;

      await repo.updateCardsList(
        CardModel(
          controller: state.controller,
          userChooseColor: state.userChooseColor,
          userChooseGradient: state.userChooseGradient,
          userChooseImage: state.userChooseImage,
          isLocked: state.isLocked,
          isSettings: state.isSettings,
          selectedImagePath: state.selectedImagePath,
          backgroundColor: state.backgroundColor,
          startColor: state.startColor,
          endColor: state.endColor,
          matrix: currentMatrix.toList(),
        ),
      );

      emit(state.copyWith(saveSuccess: true));
    });

  }
}
