import 'package:authentication_repository/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User', () {
    const id = 'mock_id';
    const email = 'mock_email';

    test('uses value equality', () {
      expect(
        const User(email: email, id: id),
        equals(const User(email: email, id: id)),
      );
    });

    test('isEmpty returns true for empty users', () {
      expect(User.empty.isEmpty, isTrue);
    });

    test('isEmpty returns false for non-empty users', () {
      const user = User(email: email, id: id);
      expect(user.isEmpty, isFalse);
    });

    test('isNotEmpty returns true for non-empty users', () {
      const user = User(email: email, id: id);
      expect(user.isNotEmpty, isTrue);
    });

    test('isNotEmpty returns false for empty users', () {
      expect(User.empty.isNotEmpty, isFalse);
    });
  });
}
