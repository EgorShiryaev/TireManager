// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderAdapter extends TypeAdapter<Order> {
  @override
  final int typeId = 1;

  @override
  Order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Order(
      orderNumber: fields[0] as int,
      status: fields[1] as String,
      carModel: fields[4] as String,
      clientName: fields[2] as String,
      clientPhoneNumber: fields[3] as String,
      completeDateTime: fields[10] as DateTime,
      numberCars: fields[5] as String,
      price: fields[7] as int,
      service: fields[6] as String,
      startDateTime: fields[9] as DateTime,
      whoCompleting: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Order obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.orderNumber)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.clientName)
      ..writeByte(3)
      ..write(obj.clientPhoneNumber)
      ..writeByte(4)
      ..write(obj.carModel)
      ..writeByte(5)
      ..write(obj.numberCars)
      ..writeByte(6)
      ..write(obj.service)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.whoCompleting)
      ..writeByte(9)
      ..write(obj.startDateTime)
      ..writeByte(10)
      ..write(obj.completeDateTime);
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
