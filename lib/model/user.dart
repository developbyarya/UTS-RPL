enum UserRole { admin, cashier }

class User {
  final String id;
  final String username;
  final String name;
  final UserRole role;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.role,
  });

  bool get isAdmin => role == UserRole.admin;
  bool get isCashier => role == UserRole.cashier;

  // Dummy users for testing
  static final List<User> dummyUsers = [
    User(
      id: '1',
      username: 'admin',
      name: 'Administrator',
      role: UserRole.admin,
    ),
    User(
      id: '2',
      username: 'cashier',
      name: 'Cashier',
      role: UserRole.cashier,
    ),
  ];

  static User? authenticate(String username, String password) {
    // Dummy authentication - in real app, this would check against a database
    if (username == 'admin' && password == 'admin123') {
      return dummyUsers.firstWhere((user) => user.username == 'admin');
    } else if (username == 'cashier' && password == 'cashier123') {
      return dummyUsers.firstWhere((user) => user.username == 'cashier');
    }
    return null;
  }
} 