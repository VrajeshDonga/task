import 'package:flutter/foundation.dart';
import 'package:task/model/user_model.dart';
import 'package:task/service/api_service.dart';

class UserViewModel extends ChangeNotifier {
  User? _user;
  String? _error;
  bool _isLoading = false;

  User? get user => _user;
  String? get error => _error;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();

  Future<void> fetchUser() async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await _apiService.fetchUser();
      _error = null;
    } catch (e) {
      _user = null;
      _error = 'Failed to load user';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}