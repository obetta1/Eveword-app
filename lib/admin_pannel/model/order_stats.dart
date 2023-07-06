import 'package:charts_flutter_new/flutter.dart' as chart;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderStats {
  final DateTime dateTime;
  final int index;
  final int orders;
  chart.Color? barColor;

  OrderStats(
      {required this.dateTime,
      required this.index,
      required this.orders,
      this.barColor}) {
    barColor = chart.ColorUtil.fromDartColor(Colors.black);
  }

  factory OrderStats.fromSnapshot(DocumentSnapshot snap, int index) {
    return OrderStats(
        dateTime: DateTime.fromMillisecondsSinceEpoch(snap['dateTime']),
        index: index,
        orders: snap['orders']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateTime': dateTime.millisecondsSinceEpoch,
      'index': index,
      'orders': orders
    };
  }

  static final List<OrderStats> data = [
    OrderStats(dateTime: DateTime.now(), index: 0, orders: 10),
    OrderStats(dateTime: DateTime.now(), index: 4, orders: 14),
    OrderStats(dateTime: DateTime.now(), index: 5, orders: 25),
    OrderStats(dateTime: DateTime.now(), index: 1, orders: 12),
    OrderStats(dateTime: DateTime.now(), index: 3, orders: 38),
    OrderStats(dateTime: DateTime.now(), index: 6, orders: 16),
    OrderStats(dateTime: DateTime.now(), index: 7, orders: 17),
    OrderStats(dateTime: DateTime.now(), index: 8, orders: 22),
    OrderStats(dateTime: DateTime.now(), index: 3, orders: 18),
    OrderStats(dateTime: DateTime.now(), index: 11, orders: 42),
    OrderStats(dateTime: DateTime.now(), index: 9, orders: 31),
  ];
}
