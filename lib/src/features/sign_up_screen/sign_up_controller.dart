import 'package:flutter/cupertino.dart';
import 'package:flutter_starter_project/src/model_classes/error_model/sign_in_error_response.dart';
import 'package:flutter_starter_project/src/model_classes/sign_up_model/sign_up_model.dart';
import 'package:flutter_starter_project/src/model_classes/sign_up_model/sign_up_response.dart';
import 'package:flutter_starter_project/src/repository/auth_repository.dart';

class SignUpController with ChangeNotifier{
  final AuthRepository _authRepository = AuthRepository();

  SignUpResponse? _currentUser;
  SignUpResponse? get currentUser => _currentUser;

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController get confirmPasswordController => _confirmPasswordController;

  SignInErrorResponse? _errorModel;
  SignInErrorResponse? get errorModel => _errorModel;

  late BuildContext _context;

  dynamic validateUser;

  void init(BuildContext context){
    _context = context;
  }


  Future<bool> signUp() async {
    final data = SignUpModel(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    _currentUser = null;
    try {
      validateUser = await _authRepository.sendSignUpData(
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
    if (_currentUser?.email == _emailController.text) {
      debugPrint("Email ${_currentUser?.expiresIn}");
      return true;
    } else {
      return false;
    }
  }
}