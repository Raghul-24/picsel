import 'package:flutter/material.dart';
import 'package:flutter_starter_project/src/model_classes/edit_image_model/remove_bg_model/remove_bg_response.dart';
import 'package:flutter_starter_project/src/services/networking/api_endpoint.dart';
import 'package:flutter_starter_project/src/services/networking/api_service.dart';
import 'package:flutter_starter_project/src/services/networking/webservice_constants.dart';


class PicsEditRepository {
  final ApiService _apiService = ApiService();

  Future<PicsArtSuccessResponse?> editPics(
      {required String data, bool? filerType, Map<String,String>? field, String? data1}
      ) async {
    return await _apiService.mulitPart<
        PicsArtSuccessResponse?>(
        endpoint: ApiEndpoint.picsArt(filerType==null? PicsArtEndpoint.BG_REMOVE :filerType? PicsArtEndpoint.TEXTURE : PicsArtEndpoint.STYLE_TRANSFER),
        data: data,
        field: field,
        data1: data1,
        converter: (response) {
          final code=response[WebserviceConstants.statusCode];
          debugPrint("response mad${response[WebserviceConstants.statusCode]}");
          if (code == 200) {
            return PicsArtSuccessResponse.fromJson(response);
          }
          return null;
        });
  }
}
