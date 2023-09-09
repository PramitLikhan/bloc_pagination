part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetInitialProductsEvent extends ProductEvent {
  final int skip;
  final int limit;

  const GetInitialProductsEvent({required this.skip, required this.limit});
  @override
  List<Object?> get props => [skip];
}

class GetMoreProductsEvent extends ProductEvent {
  final int skip;
  final int limit;

  const GetMoreProductsEvent({required this.skip, required this.limit});
  @override
  List<Object?> get props => [skip];
}
