import 'package:ecomerce/models/product_model.dart';
import 'package:ecomerce/repository/wishlist_repo/base_local_storage_repo.dart';
import 'package:hive/hive.dart';

class LocalStorageRepository extends BaseLocalStorageRepository {
  final String boxName = 'wishlist_box';

  @override
  Future<Box> open() async {
    Box box = await Hive.openBox<ProductModel>(boxName);
    return box;
  }

  @override
  List<ProductModel> getWishlist(Box box) {
    return box.values.toList() as List<ProductModel>;
  }

  @override
  Future<void> addProductTowishlist(Box box, ProductModel product) async {
    await box.put(product.id, product);
  }

  @override
  Future<void> removeProductFromWishlist(Box box, ProductModel product) async {
    await box.delete(product.id);
  }

  @override
  Future<void> clearWishlist(Box box) async {
    await box.clear();
  }
}
