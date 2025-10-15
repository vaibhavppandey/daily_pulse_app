import 'package:daily_pulse_app/app/constants/storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _storage = const FlutterSecureStorage();

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        final token = await user.getIdToken();
        await _storage.write(key: StorageConstants.token, value: token);
      }
      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        final token = await user.getIdToken();
        await _storage.write(key: StorageConstants.token, value: token);
      }
      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _storage.delete(key: StorageConstants.token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: StorageConstants.token);
  }

  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && _firebaseAuth.currentUser != null;
  }
}
