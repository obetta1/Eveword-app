// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Orders extends Equatable {
  final String id;
  final String customerId;
  final List<int> productId;
  final double deliveryFee;
  final double subtotal;
  final double total;
  final bool isAccepted;
  final bool isDelivered;
  final bool isCancled;
  final DateTime createdAt;

  const Orders({
    required this.id,
    required this.customerId,
    required this.productId,
    required this.deliveryFee,
    required this.subtotal,
    required this.total,
    required this.isAccepted,
    required this.isDelivered,
    required this.createdAt,
    required this.isCancled,
  });

  @override
  List<Object> get props {
    return [
      id,
      customerId,
      productId,
      deliveryFee,
      subtotal,
      total,
      isAccepted,
      isDelivered,
      createdAt,
      isCancled
    ];
  }

  Orders copyWith({
    String? id,
    String? customerId,
    List<int>? productId,
    double? deliveryFee,
    double? subtotal,
    double? total,
    bool? isAccepted,
    bool? isDelivered,
    bool? isCancled,
    DateTime? createdAt,
  }) {
    return Orders(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      productId: productId ?? this.productId,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      subtotal: subtotal ?? this.subtotal,
      total: total ?? this.total,
      isCancled: isCancled ?? this.isCancled,
      isAccepted: isAccepted ?? this.isAccepted,
      isDelivered: isDelivered ?? this.isDelivered,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'customerId': customerId,
      'productId': productId,
      'deliveryFee': deliveryFee,
      'subtotal': subtotal,
      'total': total,
      'isAccepted': isAccepted,
      'isDelivered': isDelivered,
      'isCancled': isCancled,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Orders.fromSnapshot(DocumentSnapshot snap) {
    return Orders(
      id: snap['id'] as String,
      customerId: snap['customerId'] as String,
      productId: List<int>.from((snap['productId'])),
      deliveryFee: snap['deliveryFee'] as double,
      subtotal: snap['subtotal'] as double,
      total: snap['total'] as double,
      isAccepted: snap['isAccepted'] as bool,
      isDelivered: snap['isDelivered'] as bool,
      isCancled: snap['isCancled'] as bool,
      createdAt: DateTime.fromMillisecondsSinceEpoch(snap['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Orders.fromJson(String source) =>
      Orders.fromSnapshot(json.decode(source) as DocumentSnapshot);

  @override
  bool get stringify => true;

  static List<Orders> orders = [
    Orders(
        id: '1',
        customerId: '111',
        productId: const [1, 2],
        deliveryFee: 2.3,
        subtotal: 200,
        total: 200,
        isAccepted: true,
        isDelivered: false,
        isCancled: false,
        createdAt: DateTime.now()),
    Orders(
        id: '2',
        customerId: '123',
        productId: const [1, 2],
        deliveryFee: 2.3,
        subtotal: 2100,
        total: 2100,
        isAccepted: false,
        isDelivered: false,
        isCancled: true,
        createdAt: DateTime.now()),
  ];
}
