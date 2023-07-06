// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String fullName;
  final String email;
  final String address;
  final String city;
  final String counntry;
  final String zipecode;

  const UserModel({
    this.id,
    this.fullName = '',
    this.email = '',
    this.address = '',
    this.city = '',
    this.counntry = '',
    this.zipecode = '',
  });

  @override
  List<Object> get props {
    return [
      id!,
      fullName,
      email,
      address,
      city,
      counntry,
      zipecode,
    ];
  }

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? address,
    String? city,
    String? counntry,
    String? zipecode,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      counntry: counntry ?? this.counntry,
      zipecode: zipecode ?? this.zipecode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'email': email,
      'address': address,
      'city': city,
      'counntry': counntry,
      'zipecode': zipecode,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    return UserModel(
      id: snap.id,
      fullName: snap['fullName'] as String,
      email: snap['email'] as String,
      address: snap['address'] as String,
      city: snap['city'] as String,
      counntry: snap['counntry'] as String,
      zipecode: snap['zipecode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromSnapshot(json.decode(source) as DocumentSnapshot);

  @override
  bool get stringify => true;
}
