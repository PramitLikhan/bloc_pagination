part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.products = const [],
    this.action = ProductAction.unknown,
    this.lastValueReturned = false,
  });
  final List<Product> products;
  final ProductAction? action;
  final bool lastValueReturned;

  ProductState copyWith({
    List<Product>? products,
    ProductAction? action,
    lastValueReturned,
  }) =>
      ProductState(
        products: products ?? this.products,
        action: action ?? this.action,
        lastValueReturned: lastValueReturned ?? false,
      );

  @override
  List<Object?> get props => [action];
}
