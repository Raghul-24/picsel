
import 'key_value_storage_base.dart';
class KeyValueStorageService {
  static const _authTokenKey = 'authToken';

  static const _authStateKey = 'authStateKey';

  static const _authUserId = 'authUserId';

  static const _authPasswordKey = 'authPasswordKey';


  static const _mobileNumber = 'mobileNumber';

  final _keyValueStorage = KeyValueStorageBase.instance;

  Future<String> getAuthPassword() async {
    return await _keyValueStorage.getEncrypted(_authPasswordKey) ?? '';
  }

  void setAuthState() {
    _keyValueStorage.setCommon<bool>(_authStateKey, true);
  }

  bool getAuthState() {
    return _keyValueStorage.getCommon<bool>(_authStateKey) ?? false;
  }

  void setAuthUserId() {
    _keyValueStorage.setCommon<bool>(_authUserId, true);
  }

  bool getAuthUserId() {
    return _keyValueStorage.getCommon<bool>(_authUserId) ?? false;
  }

  void setMobileNumber(String mobileNumber){
    _keyValueStorage.setCommon<String>(_mobileNumber,mobileNumber);
  }

  String? getMobileNumber() {
   return _keyValueStorage.getCommon<String>(_mobileNumber);
  }
  Future<String> getAuthToken() async {
    return await _keyValueStorage.getEncrypted(_authTokenKey) ?? '';
  }

  Future<String> getAuthID() async {
    return await _keyValueStorage.getEncrypted(_authUserId) ?? '';
  }

  void setAuthID(String token) {
    _keyValueStorage.setEncrypted(_authUserId, token);
  }

  void setAuthPassword(String password) {
    _keyValueStorage.setEncrypted(_authPasswordKey, password);
  }

  void setAuthToken(String token) {
    _keyValueStorage.setEncrypted(_authTokenKey, token);
  }

  void resetKeys() {
    _keyValueStorage.clearCommon();
    _keyValueStorage.clearEncrypted();
  }
}
