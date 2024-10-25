import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import '../models/product_design.dart'; // Assuming the ProductDesign class is saved here
import 'package:esoger/utils/handle_error.dart';

final productDesignProvider =
    StateNotifierProvider<ProductDesignNotifier, List<ProductDesign>?>((ref) {
  return ProductDesignNotifier();
});

class ProductDesignNotifier extends StateNotifier<List<ProductDesign>?> {
  ProductDesignNotifier() : super(null);

  final _storage = const FlutterSecureStorage();

  // Load ProductDesign from secure storage
  Future<void> loadProductDesign() async {
    String? productDesignJson = await _storage.read(key: 'productDesign');
    if (productDesignJson != null) {
      List productDesignList = jsonDecode(productDesignJson);
      state = productDesignList
          .map((json) => ProductDesign.fromJson(json))
          .toList();
    }
  }

  // Save the entire ProductDesign to secure storage
  Future<void> saveProductDesign(List<ProductDesign> productDesign) async {
    state = productDesign;
    await _storage.write(
        key: 'productDesign',
        value: jsonEncode(productDesign
            .map((productDesign) => productDesign.toJson())
            .toList()));
  }

  // Clear ProductDesign from state and storage
  Future<void> clearProductDesign() async {
    state = null;
    await _storage.delete(key: 'productDesign');
  }
}
