import 'package:bloc_counter/model/product/product.dart';

abstract class ProductState {}

// init
class ProductInitial extends ProductState {}

// isLoading
class ProductLoading extends ProductState {}

// isloaded sucess
class ProductLoaded extends ProductState {
  List<Product> product = [];
  ProductLoaded(this.product);
}
