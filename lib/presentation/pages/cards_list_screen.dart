import 'package:card_settings/domain/model/card_model.dart';
import 'package:card_settings/presentation/manager/card_settings/card_settings_bloc.dart';
import 'package:card_settings/presentation/manager/cards_list/cards_list_event.dart';
import 'package:card_settings/presentation/pages/card_settings_screen.dart';
import 'package:card_settings/presentation/widgets/card/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../manager/card_settings/card_settings_event.dart';
import '../manager/cards_list/cards_list_bloc.dart';
import '../manager/cards_list/cards_list_state.dart';

class CardsListScreen extends StatefulWidget {
  const CardsListScreen({super.key});

  @override
  State<CardsListScreen> createState() => _CardsListScreenState();
}

class _CardsListScreenState extends State<CardsListScreen> {

  Future<void> _checkAndRequestPermission() async {
    if (await Permission.storage.isGranted) {
      print('Permission already granted');
      return;
    }

    final status = await Permission.storage.request();

    if (status.isGranted) {
      print('Permission granted');
    } else if (status.isDenied) {
      print('Permission denied');
    } else if (status.isPermanentlyDenied) {
      print('Permission permanently denied. Opening settings...');
      await openAppSettings();
    }
  }

  @override
  void initState() {
    _checkAndRequestPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My cards',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600
          ),
        ),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: BlocBuilder<CardsListBloc, CardsListState>(
        builder: (context, state) {
          return SafeArea(
            child: SizedBox(
                width: double.maxFinite,
                child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          print(state.cardsList[0].controller.value);
                          final res = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BlocProvider(
                                        create: (context) => CardSettingsBloc()
                                        ..add(SetValues(cardModel: CardModel(
                                            controller: state.cardsList[index].controller,
                                            userChooseColor: state.cardsList[index].userChooseColor,
                                            userChooseGradient: state.cardsList[index].userChooseGradient,
                                            userChooseImage: state.cardsList[index].userChooseImage,
                                            isLocked: false,
                                            isSettings: true,
                                            selectedImagePath: state.cardsList[index].selectedImagePath,
                                            backgroundColor: state.cardsList[index].backgroundColor,
                                            startColor: state.cardsList[index].startColor,
                                            endColor: state.cardsList[index].endColor,
                                            matrix: state.cardsList[index].controller.value.storage.toList(),
                                        ))),
                                        child: CardSettingsScreen(
                                            cardIndex: index),
                                      )
                              )
                          );

                          if(res as bool) {
                            context.read<CardsListBloc>()
                                .add(GetAllCards());
                          }
                        },
                        child: PaymentCard(cardModel: state.cardsList[index]),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16);
                    },
                    itemCount: state.cardsList.length
                )
            ),
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}

