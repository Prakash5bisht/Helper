// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserProfileInformation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProfileInformationAdapter
    extends TypeAdapter<UserProfileInformation> {
  @override
  final int typeId = 0;

  @override
  UserProfileInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProfileInformation(
      fields[0] as String,
      fields[1] as bool,
      fields[2] as String,
      fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, UserProfileInformation obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.isLoggedIn)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.profilePhoto);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfileInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
