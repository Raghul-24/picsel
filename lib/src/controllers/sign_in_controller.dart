import 'package:flutter/cupertino.dart';
import 'package:flutter_starter_project/src/model_classes/error_model/sign_in_error_response.dart';
import 'package:flutter_starter_project/src/model_classes/sign_in_model/sign_in_model.dart';
import 'package:flutter_starter_project/src/model_classes/sign_in_model/sign_in_response.dart';
import 'package:flutter_starter_project/src/repository/auth_repository.dart';
import 'package:flutter_starter_project/src/services/local_storage/key_value_storage_service.dart';


class SignInController with ChangeNotifier{
  final AuthRepository _authRepository = AuthRepository();

  SignInResponse? _currentUser;
  SignInResponse? get currentUser => _currentUser;

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final KeyValueStorageService _keyValueStorageService =
  KeyValueStorageService();

  SignInErrorResponse? _errorModel;
  SignInErrorResponse? get errorModel => _errorModel;

  late BuildContext _context;

  dynamic validateUser;

  void init(BuildContext context){
    _context = context;
  }

  void updateToken(String value) {
    _keyValueStorageService.setAuthToken(value);
  }

  Future<bool> login() async {
    final data = SignInModel(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    _currentUser = null;
    try {
      validateUser = await _authRepository.sendLoginData(
          updateTokenCallback: updateToken,
          data: data.toJson(),
          context: _context);
      validateUser.fold((l) {
        _currentUser = l;
      }, (r) {
        _errorModel = r;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    if (_currentUser?.registered == true) {
      _keyValueStorageService.setAuthState();
      _keyValueStorageService.setAuthToken(currentUser!.idToken.toString());
      _keyValueStorageService.setAuthID(currentUser!.localId.toString());
      debugPrint("Email ${_currentUser?.email}");
      return true;
    } else {
      return false;
    }
  }
}