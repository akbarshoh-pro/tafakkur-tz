import 'package:card_settings/domain/model/card_model.dart';
import 'package:card_settings/presentation/manager/card_settings/card_settings_event.dart';
import 'package:card_settings/presentation/widgets/card/payment_card.dart';
import 'package:card_settings/presentation/widgets/dialog/color_picker_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/card_settings/card_settings_bloc.dart';
import '../manager/card_settings/card_settings_state.dart';
import '../widgets/button/button.dart';
import '../widgets/dialog/gradient_picker_bottom_sheet.dart';

class CardSettingsScreen extends StatefulWidget {
  final int cardIndex;

  const CardSettingsScreen({
    super.key,
    required this.cardIndex
  });

  @override
  State<CardSettingsScreen> createState() => _CardSettingsScreenState();
}

class _CardSettingsScreenState extends State<CardSettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, false);
          },
            child: const Icon(Icons.arrow_back_ios)
        ),
        title: Text(
          '${widget.cardIndex + 1} Card settings',
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600
          ),
        ),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: BlocConsumer<CardSettingsBloc, CardSettingsState>(
        listener: (context, state) {
          if(state.saveSuccess) {
            Navigator.pop(context, true);
          }
        },
        builder: (context, state) {
          return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16
                ),
                child: Column(
                  children: [
                    PaymentCard(
                        cardModel: CardModel(
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
                            matrix: state.controller.value.storage.toList(),
                        )
                    ),

                    const SizedBox(height: 24),

                    Button(
                        text: 'Choose image',
                        width: double.maxFinite,
                        height: 48,
                        fontSize: 18,
                        onTap: () async {
                          final result = await FilePicker.platform.pickFiles(
                            type: FileType.image,
                            allowMultiple: false,
                          );

                          if (result != null && result.files.single.path != null) {
                            context.read<CardSettingsBloc>()
                                .add(GetImageFromLocal(
                                selectedImagePath: result.files.single.path!,
                                controllerValue: Matrix4.identity(),
                                isLocked: false
                            ));
                          }
                        }
                    ),

                    const SizedBox(height: 24),

                    Row(
                      children: [
                        Expanded(
                          child: Button(
                              width: double.maxFinite,
                              height: 48,
                              fontSize: 12,
                              text: 'Choose color',
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return ColorPickerDialog(
                                      initialColor: state.backgroundColor,
                                      onColorSelected: (color) {
                                        context.read<CardSettingsBloc>()
                                            .add(ChooseColorFromPick(backgroundColor: color));
                                      },
                                    );
                                  },
                                );
                              }
                          ),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: Button(
                            width: double.maxFinite,
                            height: 48,
                            fontSize: 12,
                            text: 'Choose gradient',
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                ),
                                builder: (BuildContext dialogContext) {
                                  return GradientPickerBottomSheet(
                                    onGradientSelected: (startColor, endColor) {
                                      context.read<CardSettingsBloc>().add(
                                        ChooseGradientColors(
                                          startColor: startColor,
                                          endColor: endColor,
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        )

                      ],
                    ),

                    const Spacer(),
                    Button(
                      text: 'Save',
                      width: double.maxFinite,
                      height: 56,
                      fontSize: 20,
                      onTap: () {
                         context.read<CardSettingsBloc>()
                            .add(SaveAllUpdates());
                      },
                    )
                  ],
                ),
              )
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}


