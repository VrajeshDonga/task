import 'package:flutter/foundation.dart';
import 'package:task/model/user_model.dart';
import 'package:task/service/api_service.dart';

class UserViewModel extends ChangeNotifier {
  List<User>? _users;
  String? _error;
  bool _isLoading = false;

  List<User>? get users => _users;
  String? get error => _error;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();

  Future<void> fetchUsers() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _users = await _apiService.fetchUsers();
    } catch (e) {
      _users = null;
      _error = 'Failed to load users: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}