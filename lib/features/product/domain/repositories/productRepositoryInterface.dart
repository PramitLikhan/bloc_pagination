import '../../data/models/ProductList.dart';

abstract class ProductRepositoryInterface {
  Future<ProductListModel> getProducts({required int skip, required int limit});
}
