import 'package:flutter/material.dart';

import '../button/button.dart';
import 'color_picker_dialog.dart';

class GradientPickerBottomSheet extends StatefulWidget {
  final Function(Color, Color) onGradientSelected;

  const GradientPickerBottomSheet({
    super.key,
    required this.onGradientSelected,
  });

  @override
  State<GradientPickerBottomSheet> createState() => _GradientPickerBottomSheetState();
}

class _GradientPickerBottomSheetState extends State<GradientPickerBottomSheet> {
  Color startColor = Colors.blue;
  Color endColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          children: [
            Column(
              children: [
                const Center(
                  child: Text(
                    'Choose gradient colors',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Start color",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),

                        const SizedBox(height: 12),

                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return ColorPickerDialog(
                                  initialColor: startColor,
                                  onColorSelected: (color) {
                                    setState(() {
                                      startColor = color;
                                    });
                                  },
                                );
                              },
                            );
                          },
                          child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: startColor
                              )
                          ),
                        )
                      ],
                    ),

                    const SizedBox(width: 24),

                    Column(
                      children: [
                        const Text(
                          "End color",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),

                        const SizedBox(height: 12),

                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return ColorPickerDialog(
                                  initialColor: endColor,
                                  onColorSelected: (color) {
                                    setState(() {
                                      endColor = color;
                                    });
                                  },
                                );
                              },
                            );
                          },
                          child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: endColor
                              )
                          ),
                        )
                      ],
                    )
                  ],
                ),

                const SizedBox(height: 36),

                Button(
                    width: double.maxFinite,
                    height: 56,
                    fontSize: 18,
                    text: 'Select gradient',
                    onTap: () {
                      widget.onGradientSelected(startColor, endColor);
                      Navigator.pop(context);
                    }
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

