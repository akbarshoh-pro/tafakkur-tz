// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardEntityAdapter extends TypeAdapter<CardEntity> {
  @override
  final int typeId = 1;

  @override
  CardEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardEntity(
      matrix4: fields[1] as Matrix4,
      userChooseColor: fields[3] as bool,
      userChooseImage: fields[2] as bool,
      isLocked: fields[4] as bool,
      isSettings: fields[5] as bool,
      selectedImagePath: fields[6] as String,
      backgroundColor: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CardEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.matrix4)
      ..writeByte(2)
      ..write(obj.userChooseImage)
      ..writeByte(3)
      ..write(obj.userChooseColor)
      ..writeByte(4)
      ..write(obj.isLocked)
      ..writeByte(5)
      ..write(obj.isSettings)
      ..writeByte(6)
      ..write(obj.selectedImagePath)
      ..writeByte(7)
      ..write(obj.backgroundColor);
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