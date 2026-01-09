import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../repository/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _repository = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  UserModel? _user;
  UserModel? get user => _user;

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    _setLoading(true);
    try {
      _user = await _repository.login(email, password);
      return true;
    } catch (_) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  Future<UserModel> signup(String name, String email, String password) async {
    _setLoading(true);
    try {
      _user = await _repository.signup(name, email, password);
      return _user!;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> resetPassword(String email) async {
    _setLoading(true);
    try {
      await _repository.resetPassword(email);
    } finally {
      _setLoading(false);
    }
  }
}
