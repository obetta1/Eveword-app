import 'package:ecomerce/admin_pannel/controller/order_controller.dart';
import 'package:ecomerce/admin_pannel/controller/product_controller.dart';
import 'package:ecomerce/admin_pannel/model/orders.dart';
import 'package:ecomerce/admin_pannel/services/database_service.dart';
import 'package:ecomerce/admin_pannel/services/storage_services.dart';
import 'package:ecomerce/ui_helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/widgets.dart';
import '../model/products.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({Key? key}) : super(key: key);

  static const String routeName = '/newproducts';

  get name => null;

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => NewProductScreen());
  }

  final StorageServoices storage = StorageServoices();
  final ProductController productController = Get.put(ProductController());
  final DatabaseService _databaseService = DatabaseService();


  void _pickImage(BuildContext context) async {
    ImagePicker imagePicker = ImagePicker();
    try {
      final XFile? image =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        showSnackbar('Image picker', 'no image uploaded');
      }

      if (image != null) {
        await storage.uploadImage(image);
        var imageUrl = await storage.getDownloadImage(image.name);
        print(imageUrl);
        productController.newProduct
            .update('imageUrl', (_) => imageUrl, ifAbsent: () => imageUrl);
      }
    } catch (e) {
      showSnackbar('Image picker', 'invalid image format.  ');
    }

    //Get.to(const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Admin',
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 180,
                  child: Card(
                    color: Colors.black,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: InkWell(
                            //picks the image from the gallary
                            onTap: () => _pickImage(context),
                            child: const Icon(
                              Icons.add_circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        productController.newProduct['imageUrl'] != null
                            ? Image.network(
                                productController.newProduct['imageUrl'])
                            : Text(
                                'Add product photo',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(color: Colors.white),
                              )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.lightBlue.withAlpha(80),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CustomInputField(
                            validaton: (val){},
                            onChange: (value) {
                              productController.newProduct.update(
                                  'id', (_) => value,
                                  ifAbsent: () => value);
                            },
                            label: 'Product id',
                            hintText: 'id',
                          ),
                          const SizedBox(height: 5),
                          CustomInputField(
                            validaton: (val){},
                            onChange: (value) {
                              productController.newProduct.update(
                                  'name', (_) => value,
                                  ifAbsent: () => value);
                            },
                            label: 'Name',
                            hintText: 'Enter product name',
                          ),
                          const SizedBox(height: 10),
                          CustomInputField(
                            validaton: (val){},
                            onChange: (value) {
                              productController.newProduct.update(
                                  'description', (_) => value,
                                  ifAbsent: () => value);
                            },
                            label: 'Product Description',
                            hintText: 'description',
                          ),
                          const SizedBox(height: 5),
                          CustomInputField(
                            validaton: (val){},
                            onChange: (value) {
                              productController.newProduct.update(
                                  'category', (_) => value,
                                  ifAbsent: () => value);
                            },
                            label: 'Category',
                            hintText: 'Enter Category',
                          ),
                          const SizedBox(height: 5),
                          CustomInputField(
                            validaton: (val){},
                            onChange: (value) {
                              productController.newProduct.update(
                                  'price', (_) => value,
                                  ifAbsent: () => value);
                            },
                            label: 'Price',
                            hintText: 'Enter price',
                          ),
                          const SizedBox(height: 5),
                          CustomInputField(
                            validaton: (val){},
                            onChange: (value) {
                              productController.newProduct.update(
                                  'quantity', (_) => value,
                                  ifAbsent: () => value);
                            },
                            label: 'Qauntity',
                            hintText: 'Enter qauntity of product available',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BuidCheckBox(
                              title: 'Recommended',
                              productController: productController,
                              name: 'isRecommended',
                              controllerValue: productController.isRecommended),
                          BuidCheckBox(
                            title: 'Popular',
                            productController: productController,
                            name: 'isPopular',
                            controllerValue: productController.isPopular,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //this is used to send the input data to backend
              ElevatedButton(
                  onPressed: () {


                    print(productController.newProduct);
                    //adds the new product to databse when the save button is clicked
                    _addProductToDatabase();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue.shade300),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'SAVE',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ))
            ],
          ),
        )),
      ),
    );
  }

  Future<void> _addProductToDatabase() {
    return _databaseService.addProduct(Products(
        id: int.parse(productController.newProduct['id']),
        name: productController.newProduct['name'],
        imageUrl: productController.newProduct['imageUrl'],
        category: productController.newProduct['category'],
        isRecommended: (productController.newProduct['isRecommended'] == null)
            ? false
            : productController.newProduct['isRecommended'],
        isPopular: (productController.newProduct['isPopular'] == null)
            ? false
            : productController.newProduct['isPopular'],
        price: int.parse(productController.newProduct['price']).toDouble(),
        quantity: int.parse(productController.newProduct['quantity']),
        description: productController.newProduct['description']));
  }
}
