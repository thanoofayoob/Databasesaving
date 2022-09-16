import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/instance_manager.dart';
import 'package:machine_test/app/modules/homePage/Model/generalResponse.dart';
import 'package:machine_test/app/utils/cPrint.dart';

import '../network/DioClient.dart';
import '../network/endpoints.dart';

class GeneralRepo {
  final _dio = Get.find<DioClient>();

  Future<ApiResponse<List<GeneralResponse>>> getHomePageDetails() async {
    try {
      Response response = await _dio.request(
        endPoint: EndPoint.getDetails,
      );

      cPrint(response.statusCode);

      if (response.statusCode == 200) {
        var temp = <GeneralResponse>[];

        for (Map<String, dynamic> json in response.data) {
          temp.add(GeneralResponse.fromJson(json));
        }
        return ApiResponse<List<GeneralResponse>>.completed(temp!);
      } else {
        return Future<ApiResponse<List<GeneralResponse>>>.error(response.statusMessage!);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return Future<ApiResponse<List<GeneralResponse>>>.error(e.toString());
    }
  }
}
