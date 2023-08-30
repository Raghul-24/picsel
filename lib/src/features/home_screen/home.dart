import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_project/src/common_widgets/src/buttons/outline_button.dart';
import 'package:flutter_starter_project/src/constants/string_constants.dart';
import 'package:flutter_starter_project/src/controllers/home_controller.dart';
import 'package:flutter_starter_project/src/features/home_screen/common_edit_icons.dart';
import 'package:flutter_starter_project/src/features/home_screen/mini_rive.dart';
import 'package:flutter_starter_project/src/routing/route_constants.dart';
import 'package:flutter_starter_project/src/services/local_storage/key_value_storage_service.dart';
import 'package:flutter_starter_project/src/ui_utils/sized_box.dart';
import 'package:flutter_starter_project/src/ui_utils/text_styles.dart';
import 'package:flutter_starter_project/src/ui_utils/ui_assets.dart';
import 'package:flutter_starter_project/src/ui_utils/ui_dimens.dart';
import 'package:flutter_starter_project/src/utils/src/colors/common_colors.dart';
import 'package:flutter_starter_project/src/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'nav_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final HomeController _homeController = HomeController();
  FirebaseAuth? firebase = FirebaseAuth.instance;

  final ImagePicker picker = ImagePicker();

  final KeyValueStorageService _keyValueStorageService =
      KeyValueStorageService();

  File? image;
  bool isChoose = false;

  @override
  void initState() {
    _homeController.init();
    _homeController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _homeController.dispose();
    super.dispose();
  }

  bool isLogin = false;
  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.logoCommonLightColor,
      drawer: NavDrawer(
        onPressed: () async {
          ref.read(homeController.notifier).keyValueStorageService!.resetKeys();
          Navigator.pushNamedAndRemoveUntil(
              context, RouteConstants.loginScreen, (route) => false);
        },
      ),
      appBar: AppBar(
        backgroundColor: CommonColor.primaryLightColor,
        title: Text(StringConstants.appName.tr(context),style: TextStyles.titleTextStyle.copyWith(
          color: CommonColor.whiteColor,
          fontSize: UIDimens.size32
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: UIDimens.size15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_homeController.images.isNotEmpty && !isChoose)
              Expanded(
                child: GridView.builder(
                  itemCount: _homeController.images.length,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _homeController.images.length<4? 1:2),
                  itemBuilder: (context, index) => GridTile(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                        imageUrl: _homeController.images[index].images![0]
                            .toString()),
                  )),
                ),
              ),
            if (isChoose)
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: _homeController.isEdited
                      ? _homeController.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Image.file(image!)
                      : CachedNetworkImage(
                          imageUrl:
                              _homeController.removeBg!.data!.url!.toString())),
            if (isChoose)
              Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonEditIcons(
                          onPressed: () {
                            if (image != null) {
                              _homeController.bgRemove(image!.path, null);
                            }
                          },
                          image: AppAssets.backgroundErase,
                        ),
                        CommonEditIcons(
                          onPressed: () {
                            if (image != null) {
                              _homeController.bgRemove(image!.path, true);
                            }
                          },
                          image: AppAssets.textureImage,
                        ),
                        CommonEditIcons(
                          onPressed: () {
                            Utils().myAlert(context,anotherImage: true,camera: (){
                              Navigator.of(context).pop();

                              getImage(ImageSource.camera, addImage: true);},gallery: (){
                              Navigator.of(context).pop();

                                  getImage(ImageSource.gallery,
                                      addImage: true);
                                });
                          },
                          image: AppAssets.mergeImage,
                        ),
                      ]),
                  const SizedBox(height: UIDimens.size10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConstants.eraser.tr(context),
                        style: TextStyles.greyTextStyle,
                      ),
                      Text(
                        StringConstants.texture.tr(context),
                        style: TextStyles.greyTextStyle,
                      ),
                      Text(
                        StringConstants.merge.tr(context),
                        style: TextStyles.greyTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: UIDimens.size10),
              child: Center(
                child: Column(
                  children: [
                    CommonOutlineButton(
                      backgroundColor: CommonColor.primaryTitleColor,
                      text: "Rive",
                      width: MediaQuery.of(context).size.width / 1.4,
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const RiveScreen()));
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonOutlineButton(
                          backgroundColor: CommonColor.primaryTitleColor,
                          text: !isChoose ? "Add Image to Edit" : "Change Image",
                          width: MediaQuery.of(context).size.width / 1.4,
                          onPressed: () async {
                            Utils().myAlert(context,camera: (){
                              Navigator.of(context).pop();
                              getImage(ImageSource.camera, addImage: true);},gallery: (){
                              Navigator.of(context).pop();
                              getImage(ImageSource.gallery,
                                  addImage: false);
                            });
                          },
                        ),
                        if (isChoose)
                          GestureDetector(
                            onTap: () async {
                              var userId =
                                  await _keyValueStorageService.getAuthID();
                              var userToken =
                                  await _keyValueStorageService.getAuthToken();
                              debugPrint(userId);
                              final bodyValue = json.encode({
                                "images": [
                                  (_homeController.removeBg!.data!.url!.toString())
                                ]
                              });
                              final value =
                                  "https://moonlight-24-default-rtdb.firebaseio.com/$userId.json?auth=$userToken";
                              debugPrint(value);
                              final req = await http.post(Uri.parse(value),
                                  body: bodyValue);
                              if (req.statusCode == 200) {
                                debugPrint("success");
                              } else {
                                debugPrint("failed");
                              }
                              setState(() {
                                isChoose = false;
                                _homeController.savedImages();
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: UIDimens.size10),
                              child: Row(
                                children: [
                                  Text("Save",
                                      style: TextStyles.titleTextStyle.copyWith(
                                          fontSize: UIDimens.size20,
                                          color: CommonColor.primaryTitleColor)),
                                  const WidthSpaceBox(size: UIDimens.size5),
                                  SizedBox(
                                    height: UIDimens.size20,
                                    child: Image(
                                      color: CommonColor.primaryTitleColor,
                                      image: const AssetImage(AppAssets.saveImage),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Future getImage(ImageSource media, {bool addImage = false}) async {
    var img = await picker.pickImage(source: media);

    debugPrint("image checking $image");
    image = File(img!.path);
    image = File(img.path);
    if (!addImage) {
      _homeController.anotherPath = image!.path;
    } else {
      _homeController.bgRemove(image!.path, false);
    }
    setState(() {
      isChoose = true;
      _homeController.isEdited = true;
    });
  }
}
