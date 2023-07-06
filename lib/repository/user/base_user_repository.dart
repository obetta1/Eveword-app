import 'package:ecomerce/models/models.dart';

abstract class BaseUserRepository {
  Stream<UserModel> getUsers(String userId);
  Future<void> createUser(UserModel user);
  Future<void> updateIUser(UserModel user);
}
