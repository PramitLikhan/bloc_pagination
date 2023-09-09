import 'package:bloc_pagination/features/product/data/models/ProductList.dart';
import 'package:bloc_pagination/features/product/domain/repositories/productRepositoryInterface.dart';

class GetProductListUseCase {
  final ProductRepositoryInterface _repository;

  GetProductListUseCase(this._repository);

  Future<ProductListModel> execute({
    required int skip,
    required int limit,
  }) async {
    try {
      final products = await _repository.getProducts(limit: limit, skip: skip);
      return products;
    } catch (e) {
      throw Exception('Failed to get products: $e');
    }
  }
}
