import 'dart:convert';

import 'package:bloc_pagination/core/api/api_routes.dart';
import 'package:bloc_pagination/features/product/data/models/ProductList.dart';
import 'package:bloc_pagination/features/product/domain/repositories/productRepositoryInterface.dart';
import 'package:flutter/material.dart';

import '../data_sources/ApiClient.dart';

class ProductRepository implements ProductRepositoryInterface {
  var routes = ApiRoutes();
  @override
  Future<ProductListModel> getProducts({required int skip, required int limit}) async {
    try {
      var response = await ApiClient().get(path: routes.getProductList(skip: skip, limit: limit));
      // print('ProductRepository.getProducts $response');
      ProductListModel temp = ProductListModel.fromJson(response);
      return temp;
    } catch (e) {
      debugPrint(e.toString());
    }
    return ProductListModel();
  }
}
