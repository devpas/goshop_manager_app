import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../modify/repository/products_repository.dart';
import '../../../../src/core/handlers/handlers.dart';
import '../../../models/data/category_data.dart';
import '../../../models/data/product_data.dart';
import '../../states/states.dart';

class ProductsNotifier extends StateNotifier<ProductsState> {
  ProductsNotifier(this._productsPASRepository)
      : super(
          const ProductsState(),
        );

  final ProductsPASRepository _productsPASRepository;

  String keySearch = "";
  String codeRef = "";
  String productName = "";
  double priceBuy = -1;
  double priceSell = -1;
  List<ProductPasData> listProductPos = [];
  Function unOrdDeepEq = const DeepCollectionEquality.unordered().equals;

  Future<void> fetchProductsPos() async {
    final response = await _productsPASRepository.getProduct("");
    response.when(
      success: (data) async {
        listProductPos = data.products!;
        int minCategoryId = data.products![0].categoryId!;
        for (int i = 0; i < data.products!.length; i++) {
          if (data.products![i].categoryId! < minCategoryId) {
            minCategoryId = data.products![i].categoryId!;
          }
        }
        fetchProductsByCategory(minCategoryId);
        print(state.products!.length);
      },
      failure: (failure) {
        if (failure == const NetworkExceptions.unauthorisedRequest()) {
          debugPrint('==> get brands failure: $failure');
        }
      },
    );
  }

  Future<void> fetchProducts() async {
    final response = await _productsPASRepository.getProduct("");
    response.when(
      success: (data) async {
        state = state.copyWith(products: data.products);
        listProductPos = state.products!;
      },
      failure: (failure) {
        if (failure == const NetworkExceptions.unauthorisedRequest()) {
          debugPrint('==> get brands failure: $failure');
        }
      },
    );
  }

  Future<void> fetchProductsByCategory(int? categoryId) async {
    String alias = "categoryId=$categoryId&";
    final response = await _productsPASRepository.getProduct(alias);
    response.when(
      success: (data) async {
        state = state.copyWith(products: data.products);
      },
      failure: (failure) {
        if (failure == const NetworkExceptions.unauthorisedRequest()) {
          debugPrint('==> get brands failure: $failure');
        }
      },
    );
  }

  void getProductByCategory(int? categoryId) async {
    var listProductAfterFilter = listProductPos;
    listProductAfterFilter = listProductAfterFilter
        .where((product) => product.categoryId == categoryId)
        .toList();
    state = state.copyWith(products: listProductAfterFilter);
  }

  void filterProduct(CategoryPasData categorySelected,
      List<ProductPasData> data, String productName) {
    print(categorySelected.id);
    if (categorySelected.id != -1) {
      data = data
          .where((product) => product.categoryId == categorySelected.id)
          .toList();
    }

    if (productName.isNotEmpty) {
      data = data
          .where((product) =>
              product.name!.toLowerCase().contains(productName.toLowerCase()))
          .toList();
    }

    Future.delayed(const Duration(milliseconds: 100), () {
      state = state.copyWith(productsAfterFilter: data);
      keySearch = productName;
    });
  }

  void searchProducts(int categoryId) {
    print("$categoryId,$codeRef,$productName,$priceBuy,$priceSell");

    List<List> searchParam = [];
    if (categoryId != -1) {
      searchParam.add(["categoryId", categoryId]);
    }
    if (codeRef != "") {
      searchParam.add(["codeRef", codeRef]);
    }
    if (productName != "") {
      searchParam.add([
        "productName",
        productName.toLowerCase().contains(productName.toLowerCase())
      ]);
    }
    if (priceBuy != -1) {
      searchParam.add(["priceBuy", priceBuy]);
    }
    if (priceSell != -1) {
      searchParam.add(["priceSell", priceSell]);
    }

    List<ProductPasData> listProductAfterSearch = [];

    for (int i = 0; i < listProductPos.length; i++) {
      List<List> valueProductForSearch = [];
      if (categoryId != -1) {
        valueProductForSearch.add(["categoryId", listProductPos[i].categoryId]);
      }
      if (codeRef != "") {
        valueProductForSearch.add(["codeRef", listProductPos[i].reference]);
      }
      if (productName != "") {
        valueProductForSearch.add([
          "productName",
          listProductPos[i]
              .name!
              .toLowerCase()
              .contains(productName.toLowerCase())
        ]);
      }
      if (priceBuy != -1) {
        valueProductForSearch.add(["priceBuy", listProductPos[i].priceBuy]);
      }
      if (priceSell != -1) {
        valueProductForSearch.add(["priceSell", listProductPos[i].priceSell]);
      }

      if (unOrdDeepEq(searchParam, valueProductForSearch) == true) {
        listProductAfterSearch.add(listProductPos[i]);
      }

      state = state.copyWith(productsAfterFilter: listProductAfterSearch);
    }
  }

  void setProductSelected(ProductPasData product) {
    state = state.copyWith(productsSelected: product);
  }
}