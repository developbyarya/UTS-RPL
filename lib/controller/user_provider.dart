import 'package:flutter/foundation.dart';
import 'package:posapp/model/user.dart';

class UserProvider extends ChangeNotifier {
  User? _currentUser;
  bool _isLoggedIn = false;

  User? get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;
  bool get isAdmin => _currentUser?.isAdmin ?? false;
  bool get isCashier => _currentUser?.isCashier ?? false;

  void login(String username, String password) {
    final user = User.authenticate(username, password);
    if (user != null) {
      _currentUser = user;
      _isLoggedIn = true;
      notifyListeners();
    } else {
      throw Exception('Invalid credentials');
    }
  }

  void logout() {
    _currentUser = null;
    _isLoggedIn = false;
    notifyListeners();
  }

  void setUser(User user) {
    _currentUser = user;
    _isLoggedIn = true;
    notifyListeners();
  }
} 