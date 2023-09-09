class ApiRoutes {
  String getProductList({required int skip, required int limit}) => 'https://dummyjson.com/products?skip=$skip&limit=$limit';
}
