import 'package:bloc_counter/model/product/product.dart';
import 'package:bloc_counter/network/api_endpoint.dart';
import 'package:bloc_counter/services/api_service.dart';

class ProductRepository {
  final ApiService apiService;
  ProductRepository(this.apiService);

  Future<List<Product>> getProducts() async {
    final response = await apiService.get(ApiEndPoint.products);
    final List data = response.data;
    return data.map((e) => Product.fromMap(e)).toList();
  }
}
