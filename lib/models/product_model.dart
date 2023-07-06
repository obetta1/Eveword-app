import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final bool isRecommended;
  @HiveField(6)
  final bool isPopular;

  const ProductModel(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.category,
      required this.price,
      required this.isRecommended,
      required this.isPopular});
  @override
  List<Object?> get props =>
      [id, name, imageUrl, category, price, isRecommended, isPopular];

  static ProductModel fromSnapshot(DocumentSnapshot snap) {
    ProductModel products = ProductModel(
        id: snap['id'],
        name: snap['name'],
        imageUrl: snap['imageUrl'],
        category: snap['category'],
        price: double.parse(snap['price'].toString()),
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular']);
    return products;
  }

  static List<ProductModel> products = const [
    ProductModel(
        id: '1',
        name: 'female Bag',
        imageUrl:
            'https://images.unsplash.com/photo-1628149453636-23e882b3c1fc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80',
        category: 'classic Bag',
        price: 5000.0,
        isRecommended: true,
        isPopular: false),
    ProductModel(
        id: '2',
        name: 'female Bag',
        imageUrl:
            'https://images.unsplash.com/photo-1628149455678-16f37bc392f4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
        category: 'male wallet',
        price: 7000.0,
        isRecommended: true,
        isPopular: false),
    ProductModel(
        id: '3',
        name: 'classic Bag',
        imageUrl:
            'https://images.unsplash.com/photo-1591375607635-2d8fd2a613ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDIwfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
        category: 'classic Bag',
        price: 6000.0,
        isRecommended: false,
        isPopular: true),
    ProductModel(
        id: '4',
        name: 'male wallet',
        imageUrl:
            'https://images.unsplash.com/photo-1517254797898-04edd251bfb3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
        category: 'male wallet',
        price: 8000.0,
        isRecommended: true,
        isPopular: true),
    ProductModel(
        id: '5',
        name: 'classic bag',
        imageUrl:
            'https://media.istockphoto.com/id/1442397311/photo/womans-hand-holding-stylish-black-leather-bag-over-the-white-wall.jpg?s=170667a&w=0&k=20&c=ESol-_CbiqfwlRcbnwy3__8zxS10AhgZFDbeHmws5Zk=',
        category: 'classic wear',
        price: 5000.0,
        isRecommended: false,
        isPopular: true),
    ProductModel(
        id: '6',
        name: 'classic bag',
        imageUrl:
            'https://media.istockphoto.com/id/1442397311/photo/womans-hand-holding-stylish-black-leather-bag-over-the-white-wall.jpg?s=170667a&w=0&k=20&c=ESol-_CbiqfwlRcbnwy3__8zxS10AhgZFDbeHmws5Zk=',
        category: 'classic wear',
        price: 5000.0,
        isRecommended: false,
        isPopular: true),
    ProductModel(
        id: '7',
        name: 'classic wear',
        imageUrl:
            'https://images.unsplash.com/photo-1566958799193-c2aa57a835d4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2123&q=80',
        category: 'classic wear',
        price: 5000.0,
        isRecommended: false,
        isPopular: true),
    ProductModel(
        id: '8',
        name: 'classic wear',
        imageUrl:
            'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHNob2VzJTIwZmFzaGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
        category: 'classic wear',
        price: 5000.0,
        isRecommended: false,
        isPopular: true)
  ];
}
