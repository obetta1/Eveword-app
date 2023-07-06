import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class StorageServoices {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
/// this is used to upload image to the firebase storage
  Future<void> uploadImage(XFile image) async {
    await storage.ref('product_image/${image.name}').putFile(File(image.path));
  }

  ///this is used to get the uploaded image url from the firebase storage
  Future<String> getDownloadImage(String imageName) async {
    String downloadUrl =
        await storage.ref('product_image/$imageName').getDownloadURL();
    return downloadUrl;
  }
}
