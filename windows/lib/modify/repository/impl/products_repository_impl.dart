import 'package:dio/dio.dart';
import 'package:g_manager_app/src/core/utils/local_storage.dart';

import '../../../src/core/di/injection.dart';
import '../../../src/core/handlers/handlers.dart';
import '../../../modify/models/models.dart';
import '../products_repository.dart';

class ProductsRepositoryPASImpl extends ProductsPASRepository {
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Cookie": ""
  };
  @override
  Future<ApiResult<ProductsPasResponse>> getProduct(String alias) async {
    headers["Cookie"] = LocalStorage.instance.getCookieAccess();
    List<dynamic> listParam = [];
    List<String> queryParam = alias.split("&");
    queryParam = queryParam
        .where(
          (param) => param.isNotEmpty,
        )
        .toList();
    if (queryParam.isNotEmpty) {
      for (int i = 0; i < queryParam.length; i++) {
        List kv = queryParam[i].split("=");
        if (kv[0] == "categoryId") {
          listParam.add({"key": "category_id", "value": kv[1]});
        }
      }
    }

    final data = {
      "key_access": LocalStorage.instance.getKeyAccess(),
      "query_param": listParam
    };
    if (LocalStorage.instance.getShareMode()) {
      data["file_share_id"] = LocalStorage.instance.getFileShareId();
    }
    final client = inject<HttpServiceAppscript>().client(requireAuth: false);
    final response = await client.post(
      '?api=product/getData',
      data: data,
      options: Options(
          headers: headers,
          method: "POST",
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
    if (response.statusCode == 302) {
      String location = response.headers['location'].toString();
      String url2 = location.substring(1, location.length - 1);
      Response response2 = await Dio().request(
        url2,
        options: Options(
            headers: headers,
            method: "GET",
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      print(response2);
      return ApiResult.success(
        data: ProductsPasResponse.fromJson(response2.data),
      );
    } else {
      return ApiResult.success(
        data: ProductsPasResponse.fromJson(response.data),
      );
    }
  }

  @override
  Future<ApiResult<ProductsPasResponse>> getStockCurrent(String alias) {
    // TODO: implement getStockCurrent
    throw UnimplementedError();
  }
}