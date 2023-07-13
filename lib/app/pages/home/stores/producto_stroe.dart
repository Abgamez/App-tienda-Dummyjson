import 'package:flutter/material.dart';
import 'package:tienda_dummyjson/app/pages/data/http/exceptions.dart';
import 'package:tienda_dummyjson/app/pages/data/models/producto_model.dart';
import 'package:tienda_dummyjson/app/pages/data/repositories/producto_repository.dart';

class ProductoStore {
  final IProductoRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<ProductoModel>> state =
      ValueNotifier<List<ProductoModel>>([]);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  ProductoStore({required this.repository});
  Future getProductos() async {
    isLoading.value = true;

    try {
      final result = await repository.getProductos();
      state.value = result;
    } on NotFoundException catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }
}
