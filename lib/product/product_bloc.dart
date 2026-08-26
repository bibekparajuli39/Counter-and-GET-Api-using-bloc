import 'package:bloc_counter/model/product/product.dart';
import 'package:bloc_counter/network/api_endpoint.dart';
import 'package:bloc_counter/product/product_event.dart';
import 'package:bloc_counter/product/product_repository.dart';
import 'package:bloc_counter/product/product_state.dart';
import 'package:bloc_counter/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  // final ApiService apiService;
  ProductBloc(this.repository) : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final response = await repository.getProducts();

        emit(ProductLoaded(response));
      } catch (e) {
        debugPrint("");
      }
    });
  }
}

// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   ProductBloc() : super(ProductState((product)));
// }
