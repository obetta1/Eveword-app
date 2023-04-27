import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category =
        Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  static List<Category> categories = const [
    Category(
        name: 'classic Bag',
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1680706777240-0e7fed57dfd3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2964&q=80'),
    Category(
        name: 'classic Bag',
        imageUrl:
            'https://media.istockphoto.com/id/1342605876/photo/clothes-donation-concept-box-of-cloth-with-donate-label-preparing-used-old-garment-at-home.jpg?s=612x612&w=0&k=20&c=O48DYde3Sh95SlMBgA-L5R0dzDqBxdZ6gALUI9sG9RA='),
    Category(
        name: 'classic wear',
        imageUrl:
            'https://images.unsplash.com/photo-1588099768531-a72d4a198538?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGNsb3RoaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
    Category(
        name: 'male wallet',
        imageUrl:
            'https://images.unsplash.com/photo-1576566588028-4147f3842f27?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGNsb3RoaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
    Category(
        name: 'male wallet',
        imageUrl:
            'https://images.unsplash.com/photo-1567401893414-76b7b1e5a7a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fGNsb3RoaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
    Category(
      name: 'classic wear',
      imageUrl:
          'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHNob2VzJTIwZmFzaGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
    )
  ];
}
