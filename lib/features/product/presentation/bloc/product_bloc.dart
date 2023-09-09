import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_pagination/features/product/data/repositories/products_repository.dart';
import 'package:bloc_pagination/features/product/domain/use_cases/getProductListCase.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/helpers/blocHelpers.dart';
import '../../domain/entities/ProductEntity.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState()) {
    on<GetInitialProductsEvent>((event, emit) => getInitialProducts(event, emit));
    on<GetMoreProductsEvent>((event, emit) => getMoreProductsEvent(event, emit));
  }

  getInitialProducts(GetInitialProductsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(products: [], action: ProductAction.isLoading));
    await GetProductListUseCase(ProductRepository()).execute(skip: event.skip, limit: event.limit).then(
          (value) => emit(
            state.copyWith(
              action: ProductAction.loadInitial,
              products: value.products?.map((e) => Product.fromJson(e.toJson())).toList(),
            ),
          ),
        );
    emit(state.copyWith(action: ProductAction.unknown));
  }

  getMoreProductsEvent(GetMoreProductsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(action: ProductAction.isLoading));
    await GetProductListUseCase(ProductRepository()).execute(skip: event.skip, limit: event.limit).then((value) {
      if(value.products!=null){
        List<Product>? newProducts = value.products?.map((e) => Product.fromJson(e.toJson())).toList();
        List<Product> totalProductList = state.products;
        totalProductList.addAll(newProducts!);
        emit(
          state.copyWith(
            action: ProductAction.loadMore,
            products: totalProductList,
          ),
        );
        emit(state.copyWith(action: ProductAction.unknown));
      }


    });
  }
}
