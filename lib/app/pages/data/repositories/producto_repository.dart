import 'dart:convert';

import 'package:tienda_dummyjson/app/pages/data/http/exceptions.dart';
import 'package:tienda_dummyjson/app/pages/data/http/http_cliente.dart';
import 'package:tienda_dummyjson/app/pages/data/models/producto_model.dart';

abstract class IProductoRepository {
  Future<List<ProductoModel>> getProductos();
}

class ProductoRepository implements IProductoRepository {
  final IHttpClient client;
  ProductoRepository({required this.client});
  @override
  Future<List<ProductoModel>> getProductos() async {
    final response = await client.get(
      url: "https://dummyjson.com/products",
    );

    if (response.statusCode == 200) {
      final List<ProductoModel> productos = [];
      final body = jsonDecode(response.body);

      body['products'].map((item) {
        final ProductoModel producto = ProductoModel.fromMap(item);
        productos.add(producto);
      }).toList();

      return productos;
    } else if (response.statusCode == 404) {
      throw NotFoundException("A url no es valida");
    } else {
      throw Exception("No hay productos");
    }
  }
}
