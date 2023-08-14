import 'package:flutter/material.dart';
import 'package:flutter_starter_project/src/model_classes/edit_image_model/remove_bg_model/remove_bg_response.dart';
import 'package:flutter_starter_project/src/model_classes/edit_image_model/send_images_response.dart';
import 'package:flutter_starter_project/src/services/networking/api_endpoint.dart';
import 'package:flutter_starter_project/src/services/networking/api_service.dart';
import 'package:flutter_starter_project/src/services/networking/webservice_constants.dart';
import 'package:flutter_starter_project/src/utils/src/typedefs.dart';


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
          if (code == 200) {
            return PicsArtSuccessResponse.fromJson(response);
          }
          return null;
        });
  }

  Future<SendImagesResponse>sendImages({required JSON data, String? userId, String? userToken})async{
    return await _apiService.setData(
        endpoint: ApiEndpoint.auth(AuthEndpoint.SEND_IMAGE,userId: userId,userToken: userToken),
        data: data,
        converter: (response){
          if (response[200] == 200) {
            debugPrint("success");
          } else {
            debugPrint("failed");
          }
          return SendImagesResponse();
        });
  }
}
