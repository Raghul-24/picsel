import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_starter_project/src/model_classes/edit_image_model/remove_background_image.dart';
import 'package:flutter_starter_project/src/model_classes/edit_image_model/remove_bg_model/remove_bg_response.dart';
import 'package:flutter_starter_project/src/model_classes/edit_image_model/saved_images.dart';
import 'package:flutter_starter_project/src/model_classes/edit_image_model/style_transfer.dart';
import 'package:flutter_starter_project/src/model_classes/edit_image_model/texture_fields.dart';
import 'package:flutter_starter_project/src/model_classes/error_model/sign_in_error_response.dart';
import 'package:flutter_starter_project/src/model_classes/user_detail_model/user_detail_response.dart';
import 'package:flutter_starter_project/src/repository/pics_edit_repository.dart';
import 'package:flutter_starter_project/src/services/local_storage/key_value_storage_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final homeController = ChangeNotifierProvider((ref) => HomeController());

class HomeController with ChangeNotifier {

  final PicsEditRepository _picsEditRepository = PicsEditRepository();

  SavedImagesResponse? savedImagesResponse;
  List<SavedImagesResponse> images = [];

  final _keyValueStorageService = KeyValueStorageService();

  KeyValueStorageService? get keyValueStorageService => _keyValueStorageService;

  SignInErrorResponse? _errorModel;

  SignInErrorResponse? get errorModel => _errorModel;

  UserDetailResponse? _currentUser;

  UserDetailResponse? get userDetailResponse => _currentUser;

  PicsArtSuccessResponse? _removeBackgroundResponse;

  PicsArtSuccessResponse? get removeBg => _removeBackgroundResponse;


  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool isEdited = false;

  String? anotherPath;

  String? userId;
  String? userToken;
  dynamic validateUser;

  void init() async{
    userId = await _keyValueStorageService.getAuthID();
    userToken =
    await _keyValueStorageService.getAuthToken();

    savedImages();
  }

  Future<PicsArtSuccessResponse?> bgRemove(String filePath,
      bool? filterType) async {


    var backgroundTextureField = BackgroundTextureField(
        format: "JPG",
        height: "1024",
        offsetX: "0",
        offsetY: "0",
        pattern: "tile",
        rotate: "0",
        scale: "1",
        width: "1024"
    ).toJson();

    var backgroundRemoveField = BackgroundRemoveField(
        scale: "fit",
        format: "jpg",
        bgBlur: "0",
        outputType: "cutout"
    ).toJson();

    var backgroundStyleTransferField = BackgroundStyleTransferField(
        format: "jpg",
        level: "l4"
    ).toJson();

    var data = filePath;
    toggleLoading();
    _removeBackgroundResponse = await _picsEditRepository.editPics(
        field: filterType == null ? backgroundRemoveField : filterType
            ? backgroundStyleTransferField
            : backgroundTextureField,
        data:filterType ==false ? anotherPath! : filePath,
        data1:filterType == false ? filePath : null,
        filerType: filterType);
    toggleLoading();
    isEdited = false;
    notifyListeners();
    debugPrint("final output image ${_removeBackgroundResponse?.data?.url
        .toString()}");
    return _removeBackgroundResponse;
  }


  Future<void>savedImages() async {
    final url = Uri.parse(
        'https://moonlight-24-default-rtdb.firebaseio.com/$userId.json?auth=$userToken');
    final response = await http.get(url);
    final List<SavedImagesResponse> savedImages = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach((userId, images) {
      if (extractedData == null) {
        return;
      }
      savedImages.add(SavedImagesResponse(
          id: userId,
          images: images['images']
      ));
    });
    images = savedImages;
    notifyListeners();
  }


  void toggleLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}