import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomerce/models/user_model.dart';
import 'package:ecomerce/repository/user/base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> createUser(UserModel user)  {
     return  _firebaseFirestore.collection('users').doc(user.id).set(
          user.toMap());
  }

  @override
  Stream<UserModel> getUsers(String userId) {
    return _firebaseFirestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snapshot) => UserModel.fromSnapshot(snapshot));
  }

  @override
  Future<void> updateIUser(UserModel user) async {
    await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toMap())
        .then((value) => print('user dater updated'));
  }
}
