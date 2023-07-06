import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomerce/admin_pannel/model/order_stats.dart';
import 'package:ecomerce/admin_pannel/model/products.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/orders.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<List<OrderStats>> getOrderStats() {
    return _firebaseFirestore
        .collection('orderStats')
        .orderBy('dateTime')
        .get()
        .then((querySnapshot) => querySnapshot.docs
            .asMap()
            .entries
            .map((entry) => OrderStats.fromSnapshot(entry.value, entry.key))
            .toList());
  }

  Stream<List<Orders>> getOrders() {
    return _firebaseFirestore.collection('orders').snapshots().map(
        (snap) => snap.docs.map((doc) => Orders.fromSnapshot(doc)).toList());
  }

  Stream<List<Orders>> getPendingOrders() {
    return _firebaseFirestore
        .collection('orders')
        .where('isDelivered', isEqualTo: false)
        .where('isCancled', isEqualTo: false)
        .snapshots()
        .map((snap) =>
            snap.docs.map((doc) => Orders.fromSnapshot(doc)).toList());
  }

  Stream<List<Products>> getAllProducts() {
    return _firebaseFirestore.collection('products').snapshots().map(
        (snap) => snap.docs.map((doc) => Products.fromSnapshot(doc)).toList());
  }

  Future<void> signUp(String email, String password) {
    return  _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> addOrderStats(OrderStats orderStats) {
    return _firebaseFirestore.collection('orderStats').add(orderStats.toMap());
  }

  Future<void> addProduct(Products products) {
    return _firebaseFirestore.collection('products').add(products.toMap());
  }

  Future<void> addOrders(Orders orders) {
    return _firebaseFirestore.collection('orders').add(orders.toMap());
  }

//this is used to update any field on the order collection
  Future<void> updateOrder(
      Orders orders, String field, dynamic newValue) async {
    return _firebaseFirestore
        .collection('orders')
        .where('id', isEqualTo: orders.id)
        .get()
        .then((querySnapshort) =>
            querySnapshort.docs.first.reference.update({field: newValue}));
  }

  Future<void> updatefield(
      Products products, String field, dynamic newValue) async {
    return _firebaseFirestore
        .collection('products/')
        .where('id', isEqualTo: products.id)
        .get()
        .then((querySnapshort) =>
            querySnapshort.docs.first.reference.update({field: newValue}));
  }
}
