// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardEntityAdapter extends TypeAdapter<CardEntity> {
  @override
  final int typeId = 0;

  @override
  CardEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardEntity(
      userChooseColor: fields[0] as bool,
      userChooseGradient: fields[1] as bool,
      userChooseImage: fields[2] as bool,
      isLocked: fields[3] as bool,
      isSettings: fields[4] as bool,
      selectedImagePath: fields[5] as String,
      backgroundColor: fields[6] as int,
      startColor: fields[7] as int,
      endColor: fields[8] as int,
      matrix: (fields[9] as List).cast<double>(),
    );
  }

  @override
  void write(BinaryWriter writer, CardEntity obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.userChooseColor)
      ..writeByte(1)
      ..write(obj.userChooseGradient)
      ..writeByte(2)
      ..write(obj.userChooseImage)
      ..writeByte(3)
      ..write(obj.isLocked)
      ..writeByte(4)
      ..write(obj.isSettings)
      ..writeByte(5)
      ..write(obj.selectedImagePath)
      ..writeByte(6)
      ..write(obj.backgroundColor)
      ..writeByte(7)
      ..write(obj.startColor)
      ..writeByte(8)
      ..write(obj.endColor)
      ..writeByte(9)
      ..write(obj.matrix);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
