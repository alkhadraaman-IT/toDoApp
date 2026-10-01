import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';

/// واجهة مصدر البيانات البعيد للمصادقة
abstract class AuthRemoteDataSource {
  Future<UserModel> signInWithEmail(String email, String password);

  Future<UserModel> signUpWithEmail(String email, String password, String displayName);

  Future<UserModel> signInWithGoogle();

  Future<void> signOut();

  UserModel? getCurrentUser();

  Stream<UserModel?> get authStateChanges;
}

/// تنفيذ مصدر البيانات باستخدام Firebase Auth + Google Sign-In
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRemoteDataSourceImpl({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.instance;

  @override
  Future<UserModel> signInWithEmail(String email, String password) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (credential.user == null) {
      throw Exception('فشل تسجيل الدخول');
    }
    return UserModel.fromFirebaseUser(credential.user!);
  }

  @override
  Future<UserModel> signUpWithEmail(String email, String password, String displayName) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await credential.user?.updateDisplayName(displayName);
    await credential.user?.reload();
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw Exception('فشل إنشاء الحساب');
    }
    return UserModel.fromFirebaseUser(user);
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate();
    if (googleUser == null) {
      throw Exception('تم إلغاء تسجيل الدخول عبر Google');
    }
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    if (userCredential.user == null) {
      throw Exception('فشل تسجيل الدخول عبر Google');
    }
    return UserModel.fromFirebaseUser(userCredential.user!);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  @override
  UserModel? getCurrentUser() {
    final user = _firebaseAuth.currentUser;
    return user != null ? UserModel.fromFirebaseUser(user) : null;
  }

  @override
  Stream<UserModel?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((user) {
      return user != null ? UserModel.fromFirebaseUser(user) : null;
    });
  }
}
