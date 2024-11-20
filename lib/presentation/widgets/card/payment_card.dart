import 'dart:io';

import 'package:flutter/material.dart';

import '../../../domain/model/card_model.dart';

class PaymentCard extends StatelessWidget {
  final CardModel cardModel;

  const PaymentCard({
    super.key,
    required this.cardModel
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        children: [
          if (cardModel.userChooseColor)
            Container(
              width: double.maxFinite,
              height: 200,
              color: cardModel.backgroundColor,
            ),
          if (cardModel.userChooseGradient)
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [cardModel.startColor, cardModel.endColor], // You can use any two colors here
                ),
              ),
            ),

          if (cardModel.userChooseImage)
            InteractiveViewer(
              transformationController: cardModel.controller,
              panEnabled: !cardModel.isLocked,
              scaleEnabled: !cardModel.isLocked,
              minScale: 0.5,
              maxScale: 10.0,
              child: Image.file(
                File(cardModel.selectedImagePath),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
          const Positioned(
            left: 24,
            top: 12,
            child: Text(
              "U",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: Colors.white
              ),
            ),
          ),
          if(!cardModel.isSettings)
            const Positioned(
            bottom: 32,
            left: 16,
            child: Row(
              children: [
                SizedBox(width: 16),
                Text(
                  '9860 0000 0000 0000',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),
                ),
                SizedBox(width: 24),
                Text(
                  '00/00',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

