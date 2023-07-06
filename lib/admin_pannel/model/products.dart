// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Products extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  final String category;
  final bool isRecommended;
  final bool isPopular;
  double price;
  int quantity;

  Products({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.isRecommended,
    required this.isPopular,
    this.price = 0.0,
    this.quantity = 0,
    required this.description,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      imageUrl,
      category,
      description,
      isRecommended,
      isPopular,
      price,
      quantity,
    ];
  }

  Products copyWith({
    int? id,
    String? name,
    String? imageUrl,
    String? category,
    String? description,
    bool? isRecommended,
    bool? isPopular,
    double? price,
    int? quantity,
  }) {
    return Products(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      category: category ?? this.category,
      isRecommended: isRecommended ?? this.isRecommended,
      isPopular: isPopular ?? this.isPopular,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

//this convert the product object to map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id.toString(),
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'category': category,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'price': price,
      'quantity': quantity,
    };
  }

//convert the map to objet product
  factory Products.fromSnapshot(DocumentSnapshot snap) {
    return Products(
      id: snap['id'] as int,
      name: snap['name'] as String,
      imageUrl: snap['imageUrl'] as String,
      description: snap['description'] as String,
      category: snap['category'] as String,
      isRecommended: snap['isRecommended'] as bool,
      isPopular: snap['isPopular'] as bool,
      price: snap['price'] as double,
      quantity: snap['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  static List<Products> products = [
    Products(
        id: 1,
        name: 'female Bag',
        description: 'bag for outinghis is a nice item to spend you money on',
        imageUrl:
            'https://images.unsplash.com/photo-1628149453636-23e882b3c1fc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80',
        category: 'classic Bag',
        price: 5000.0,
        isRecommended: true,
        isPopular: false),
    Products(
        id: 2,
        name: 'female Bag',
        imageUrl:
            'https://images.unsplash.com/photo-1628149455678-16f37bc392f4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
        category: 'male wallet',
        price: 7000.0,
        isRecommended: true,
        isPopular: false,
        description: 'this is a nice item to spend you money on'),
    Products(
        id: 3,
        name: 'classic Bag',
        imageUrl:
            'https://images.unsplash.com/photo-1591375607635-2d8fd2a613ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDIwfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
        category: 'classic Bag',
        price: 6000.0,
        isRecommended: false,
        isPopular: true,
        description: 'his is a nice item to spend you money on'),
    Products(
        id: 4,
        name: 'male wallet',
        imageUrl:
            'https://images.unsplash.com/photo-1517254797898-04edd251bfb3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
        category: 'male wallet',
        price: 8000.0,
        isRecommended: true,
        isPopular: true,
        description: 'his is a nice item to spend you money on'),
    Products(
        id: 5,
        name: 'classic bag',
        description: '',
        imageUrl:
            'https://media.istockphoto.com/id/1442397311/photo/womans-hand-holding-stylish-black-leather-bag-over-the-white-wall.jpg?s=170667a&w=0&k=20&c=ESol-_CbiqfwlRcbnwy3__8zxS10AhgZFDbeHmws5Zk=',
        category: 'classic wear',
        price: 5000.0,
        isRecommended: false,
        isPopular: true),
    Products(
        id: 6,
        name: 'classic bag',
        description: 'his is a nice item to spend you money on',
        imageUrl:
            'https://media.istockphoto.com/id/1442397311/photo/womans-hand-holding-stylish-black-leather-bag-over-the-white-wall.jpg?s=170667a&w=0&k=20&c=ESol-_CbiqfwlRcbnwy3__8zxS10AhgZFDbeHmws5Zk=',
        category: 'classic wear',
        price: 5000.0,
        isRecommended: false,
        isPopular: true),
    Products(
        id: 7,
        name: 'classic wear',
        description: '',
        imageUrl:
            'https://images.unsplash.com/photo-1566958799193-c2aa57a835d4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2123&q=80',
        category: 'classic wear',
        price: 5000.0,
        isRecommended: false,
        isPopular: true),
    Products(
        id: 8,
        name: 'classic wear',
        description: 'his is a nice item to spend you money on',
        imageUrl:
            'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHNob2VzJTIwZmFzaGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
        category: 'classic wear',
        price: 5000.0,
        isRecommended: false,
        isPopular: true)
  ];
}
