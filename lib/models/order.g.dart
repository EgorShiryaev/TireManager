// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderAdapter extends TypeAdapter<Order> {
  @override
  final int typeId = 0;

  @override
  Order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Order(
      id: fields[0] as int?,
      status: fields[1] as String,
      carModel: fields[4] as String,
      clientName: fields[2] as String,
      clientPhone: fields[3] as String,
      issueDateTime: fields[8] as DateTime,
      service: fields[5] as Service,
      startDateTime: fields[7] as DateTime,
      employee: fields[6] as Employee,
    );
  }

  @override
  void write(BinaryWriter writer, Order obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.clientName)
      ..writeByte(3)
      ..write(obj.clientPhone)
      ..writeByte(4)
      ..write(obj.carModel)
      ..writeByte(5)
      ..write(obj.service)
      ..writeByte(6)
      ..write(obj.employee)
      ..writeByte(7)
      ..write(obj.startDateTime)
      ..writeByte(8)
      ..write(obj.issueDateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
