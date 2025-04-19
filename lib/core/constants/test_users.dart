// This file contains test user data for testing purposes.
class TestUser {
  final String email;
  final String password;

  const TestUser({required this.email, required this.password});
}

class TestUsers {
  static const testUser1 = TestUser(
    email: 'demo@example.com',
    password: 'password123',
  );

  // Add more test users here if needed
}
