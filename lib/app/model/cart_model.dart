import 'package:games/app/model/product_model.dart';

class CartModel {
  CartModel({
    this.quantity,
    this.productModel,
  });

  int? quantity;
  ProductModel? productModel;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        quantity: json["quantity"],
        productModel: ProductModel.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "productModel": productModel,
      };
}
