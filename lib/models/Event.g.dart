// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventAdapter extends TypeAdapter<Event> {
  @override
  final int typeId = 0;

  @override
  Event read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Event(
      eventType: fields[0] as String?,
      remark: fields[1] as String?,
      amount: fields[2] as double?,
      comment: fields[3] as String?,
      attachment: fields[4] as String?,
      eventdateTime: fields[5] as DateTime?,
      noticedDateTime: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.eventType)
      ..writeByte(1)
      ..write(obj.remark)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.comment)
      ..writeByte(4)
      ..write(obj.attachment)
      ..writeByte(5)
      ..write(obj.eventdateTime)
      ..writeByte(6)
      ..write(obj.noticedDateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
