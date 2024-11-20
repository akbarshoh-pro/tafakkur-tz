import 'package:card_settings/domain/model/card_model.dart';
import 'package:card_settings/presentation/manager/card_settings/card_settings_event.dart';
import 'package:card_settings/presentation/widgets/card/payment_card.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../manager/card_settings/card_settings_bloc.dart';
import '../manager/card_settings/card_settings_state.dart';
import '../widgets/button/button.dart';

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
                            userChooseImage: state.userChooseImage,
                            isLocked: state.isLocked,
                            isSettings: state.isSettings,
                            selectedImagePath: state.selectedImagePath,
                            backgroundColor: state.backgroundColor
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
                                Color tempColor = state.backgroundColor;
                                showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return AlertDialog(
                                      title: Text(
                                          'Choose color',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      backgroundColor: Colors.white,
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SingleChildScrollView(
                                            child: ColorPicker(
                                              pickerColor: tempColor,
                                              onColorChanged: (color) {
                                                tempColor = color;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(dialogContext),
                                          child: Text(
                                              'Cancel',
                                            style: TextStyle(
                                              color: Colors.grey[700]
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            context.read<CardSettingsBloc>()
                                            .add(ChooseColorFromPick(backgroundColor: tempColor));
                                            Navigator.pop(dialogContext);
                                          },
                                          child: const Text(
                                              'Choose',
                                            style: TextStyle(
                                                color: Colors.black
                                            ),
                                          ),
                                        ),
                                      ],
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

                              }
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
